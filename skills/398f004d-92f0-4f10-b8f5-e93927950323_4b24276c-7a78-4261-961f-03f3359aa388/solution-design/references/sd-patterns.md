# Architecture Patterns — Teqfocus Solution Design

---

## PATTERN LIBRARY

Each pattern describes the standard architecture for a Teqfocus accelerator. Use as the starting point — adapt to client-specific constraints, not replace.

---

### PATTERN 01 — Payer AI (Prior Authorization)

```
┌─────────────────────────────────────────────────────────────┐
│  SALESFORCE LAYER                                           │
│  Health Cloud UM Module → Agentforce Prior Auth Agent       │
│  Human Review Queue → HIPAA Audit Log                       │
├─────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                 │
│  Data 360 ← Zero-Copy Share ← Snowflake Policy Data        │
│  (Agent grounds on live policy — nothing duplicated)        │
├─────────────────────────────────────────────────────────────┤
│  INTEGRATION LAYER                                          │
│  MuleSoft + HL7 FHIR → Epic / Oracle Health (Cerner)       │
│  Auth request in → Coverage decision + audit out            │
└─────────────────────────────────────────────────────────────┘
```

**Architecture decisions:**
- Zero-copy is mandatory: agent never operates on copied policy data; grounding is live
- Trust Layer: all agent actions masked, zero retention, full audit trail
- Human-in-the-loop: agent recommends, UM nurse / medical director commits every decision
- FHIR R4: standard for Epic/Cerner integration; pre-built MuleSoft FHIR connector accelerates build

---

### PATTERN 02 — Provider Care (Patient Engagement)

```
┌─────────────────────────────────────────────────────────────┐
│  SALESFORCE LAYER                                           │
│  Health Cloud Patient Record → Agentforce Care Agent       │
│  Agentforce Marketing Journey → Care Coordinator Workbench │
├─────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                 │
│  Data 360 ← EHR data (clinical) + Claims (admin)           │
│  Care gap rules → HEDIS / CMS Stars / VBC metrics          │
├─────────────────────────────────────────────────────────────┤
│  INTEGRATION LAYER                                          │
│  MuleSoft + HL7 FHIR → EHR (Epic / Cerner)                │
│  Claims feed (HL7 X12 or direct API)                        │
└─────────────────────────────────────────────────────────────┘
```

**Architecture decisions:**
- Longitudinal patient record: all clinical and administrative data unified in Health Cloud
- Care gap rules configured to the provider's specific quality program — not generic
- Marketing journey for patient outreach uses Agentforce Marketing (formerly MC Growth/Advanced)
- EHR integration is read-only for Data 360; write-back to EHR is Phase 2 scope only

---

### PATTERN 03 — Insurance Underwriting

```
┌─────────────────────────────────────────────────────────────┐
│  SALESFORCE LAYER                                           │
│  FSC Insurance → Submission Intake → Agentforce UW Agent   │
│  Appetite Rules Engine → Underwriter Workbench             │
├─────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                 │
│  Data 360 ← Loss runs + external risk data                  │
│  Risk scoring rules → real-time flag surfacing              │
├─────────────────────────────────────────────────────────────┤
│  INTEGRATION LAYER                                          │
│  Direct API / MuleSoft → Policy Admin System               │
│  (Guidewire PolicyCenter / Duck Creek / custom core)        │
└─────────────────────────────────────────────────────────────┘
```

**Architecture decisions:**
- Policy admin system is the system of record for issued policies — Salesforce does not replace it
- Salesforce FSC Insurance owns the producer relationship and submission workflow
- Appetite rules stored in Salesforce — underwriting team can update without IT
- Loss run document ingestion: OCR + structured extraction before data model mapping

---

### PATTERN 04 — Insurance Claims

```
┌─────────────────────────────────────────────────────────────┐
│  SALESFORCE LAYER                                           │
│  Agentforce Service → FNOL Intake → Coverage Verification  │
│  STP Rules → Adjuster Workbench → SLA Monitor              │
├─────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                 │
│  Data 360 ← Policy system + historical claims data         │
│  STP rules engine → straight-through decision logic        │
├─────────────────────────────────────────────────────────────┤
│  INTEGRATION LAYER                                          │
│  MuleSoft / Direct API → Claims Management System          │
│  (Guidewire ClaimCenter / Duck Creek / custom)              │
└─────────────────────────────────────────────────────────────┘
```

**Architecture decisions:**
- Claims management system remains system of record — Salesforce handles intake, triage, and adjuster UX
- STP: configure rules for claim types with highest STP potential (clear liability, low value, documented loss)
- Document ingestion pipeline (photos, reports): ingested to Salesforce Files + attached to claim record

---

### PATTERN 05 — Life Sciences HCP Engagement

```
┌─────────────────────────────────────────────────────────────┐
│  SALESFORCE LAYER                                           │
│  Life Sciences Cloud → HCP Record → Next-Best-Action Agent │
│  Call Planning → Sample Management → Field Dashboards      │
├─────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                 │
│  Data 360 ← Rx data (IQVIA / Symphony) + call history      │
│  Commercial / Medical firewall → data visibility rules      │
├─────────────────────────────────────────────────────────────┤
│  INTEGRATION LAYER                                          │
│  IQVIA / Symphony Rx data feed (SFTP or API)               │
│  Veeva migration OR co-existence (client-specific)          │
└─────────────────────────────────────────────────────────────┘
```

**Architecture decisions:**
- Commercial/medical firewall is regulatory — not configurable by client users; designed at architecture phase
- Sunshine Act compliance: speaker programs, transfers of value tracked and reportable
- PDMA sample compliance: lot numbers, quantities, accountability chain in Salesforce
- Veeva decision: if client has Veeva SFA, assess co-existence vs. migration at Step 1; never assume migration in Step 3

---

### PATTERN 06 — SaaS Deal Intelligence & Renewal

```
┌─────────────────────────────────────────────────────────────┐
│  SALESFORCE LAYER                                           │
│  Sales Cloud + Revenue Cloud Advanced → Agentforce Agent   │
│  AE / CSM Workbench → Renewal Pipeline View → Forecast     │
├─────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                 │
│  Data 360 ← Product telemetry (Mixpanel / Amplitude /      │
│  Segment / custom DW) — zero-copy preferred                 │
│  Churn signal model + expansion signal rules                │
├─────────────────────────────────────────────────────────────┤
│  INTEGRATION LAYER                                          │
│  Zero-copy Snowflake ↔ Data 360 (if Snowflake warehouse)   │
│  Direct API to product analytics (if no Snowflake)         │
└─────────────────────────────────────────────────────────────┘
```

**Architecture decisions:**
- Revenue Cloud Advanced replaces CPQ (end-of-sale); migration path is supported to 2028
- Product telemetry connected via zero-copy if prospect has Snowflake; direct API otherwise
- Churn model: start with rule-based signals (usage drop, support volume, NPS) in Phase 1; ML model is Phase 2

---

## INTEGRATION DECISION RULES

Apply in order:

1. **Prospect has Snowflake** → zero-copy Data 360 ↔ Snowflake by default. No data movement.
2. **3+ source systems with complex transformation** → MuleSoft. Justify the middleware investment in the design doc.
3. **Existing MuleSoft in the org** → extend it. Never introduce competing middleware.
4. **EHR (Epic / Oracle Health)** → MuleSoft + HL7 FHIR adaptor. Always. Direct EHR APIs are unstable and version-sensitive.
5. **Single source, low volume, no transformation** → Salesforce direct REST API.
6. **Real-time event streaming** → Salesforce Platform Events or MuleSoft Anypoint.

---

## COMPLIANCE PATTERNS

### HIPAA
- PHI fields: masked in Einstein Trust Layer; zero retention on all agent interactions
- BAA: required with Salesforce before go-live; standard Salesforce BAA covers Health Cloud + Agentforce
- Encryption: at rest (Salesforce Shield or platform encryption) + in transit (TLS 1.2+)
- Audit logging: every agent action, every human decision, timestamped; Salesforce Shield Event Monitoring preferred
- Minimum necessary: data access scoped to clinical role; sharing rules designed at Phase 0

### SOC 2 Type II
- Audit logging: Salesforce event monitoring covers access, data export, API calls
- Access review: quarterly access review process documented and scheduled
- Incident response: Salesforce Health Check integrated with client's SIEM where required

### Financial Services Regs (FSC)
- Model risk governance: Agentforce decisions logged with confidence score and input data; human override always available
- Explainability: Trust Layer surfaces the grounding data that drove each agent recommendation
- KYC/AML: workflow designed with full audit trail from data input to compliance decision

### Life Sciences (Sunshine Act / PDMA)
- Transfers of value: speaker programs, samples, meals tracked in Life Sciences Cloud as compliance objects
- PDMA sample accountability: chain of custody from warehouse to HCP; lot number tracking
- Commercial/medical firewall: enforced at sharing rule and permission set level; cannot be bypassed by end users
