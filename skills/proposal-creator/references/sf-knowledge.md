# Knowledge Base — Teqfocus Salesforce Proposal Creator

---

## 1. About Teqfocus

Salesforce Summit Partner and Premier Snowflake Services Partner. Delivers Salesforce transformation across Healthcare, Life Sciences, Insurance, Financial Services, SaaS, and HiTech — with vertical accelerators and compliance patterns for each.

Differentiator: the same in-house architecture team designs the Salesforce layer and the data layer. Zero-copy shares between Snowflake and Data 360 are the architectural default, not a subcontracted handoff.

Pricing model: fixed-price discovery, milestone-based build phases with clear acceptance criteria, tiered AMS post go-live. No open-ended time-and-materials on an unbounded backlog.

---

## 2. Standard Delivery Team — Salesforce Engagements

| Role | Responsibility |
|---|---|
| Solution Architect | Overall architecture, client-facing technical lead, ADRs, integration design, Salesforce org governance |
| Salesforce Consultant / Functional Lead | Business process design, configuration, user stories, UAT coordination |
| Salesforce Developer | Custom development (Apex, LWC, Flow), complex automation, integrations |
| Data Engineer | Data 360 / Snowflake integration, zero-copy contract, data model, migration scripts |
| Integration Specialist | MuleSoft flows, API design, middleware configuration, source system connectivity |
| BA (Business Analyst) | Requirements gathering, process documentation, acceptance criteria |
| QA Engineer | Test planning, functional testing, regression, UAT support |
| PM (Project Manager) | Delivery management, client comms, risk tracking, milestone reporting |

**Team composition by Step:**

| Step | Typical Team |
|---|---|
| Step 1 — Assessment | 1 SA + 1 Consultant + 1 BA (lean, 2–3 people) |
| Step 2 — Blueprint | 1 SA + 1 Consultant + 1 Data Engineer + 1 BA |
| Step 3 — Accelerator | 1 SA + 1–2 Consultants + 1–2 Developers + 1 Data Engineer + 1 BA + 1 QA + 1 PM |
| Step 4 — Factory | Dedicated pod: 1 SA + 2 Consultants + 2 Developers + 1 Data Engineer + 1 PM (ongoing) |

---

## 3. Hour Benchmarks — Salesforce Engagements

### Step 1 — Stack-Rationalization & Readiness Assessment (1–2 weeks, ~80–120h)

| Activity | Hours |
|---|---|
| Current-state discovery and stakeholder interviews | 20–30h |
| Salesforce org health analysis | 15–20h |
| Data landscape and integration mapping | 15–20h |
| Use case prioritization and roadmap | 15–20h |
| Assessment report and presentation | 15–20h |
| **Total** | **80–110h** |

---

### Step 2 — Trusted-Context Blueprint (4–6 weeks, ~300–450h)

| Activity | Hours |
|---|---|
| Architecture design (Salesforce + Data layers) | 60–80h |
| Zero-copy data contract design | 40–60h |
| Integration architecture and API design | 40–60h |
| AgentOps framework design | 30–40h |
| Security and compliance architecture (Trust Layer, HIPAA/SOC 2) | 30–40h |
| Data model design | 30–40h |
| Accelerator selection and scoping | 20–30h |
| Blueprint document and review | 20–30h |
| PM and governance | 30–50h |
| **Total** | **300–430h** |

---

### Step 3 — Industry Workflow Accelerator (6–10 weeks, ~600–900h)

**Base (all accelerators):**

| Activity | Hours |
|---|---|
| Environment setup and configuration | 40–60h |
| Core Salesforce cloud configuration | 80–120h |
| Custom development (Apex / LWC / Flow) | 80–120h |
| Agentforce agent configuration and grounding | 60–80h |
| Data 360 / Snowflake integration | 60–80h |
| Integration build (MuleSoft or direct API) | 60–100h |
| Data migration | 80–120h |
| Testing (unit, integration, UAT) | 60–80h |
| Training and enablement | 40–60h |
| Cutover and hypercare | 30–40h |
| PM and governance | 60–80h |
| **Base total** | **650–940h** |

**Accelerator-specific additions:**

| Accelerator | Additional scope | Add hours |
|---|---|---|
| Prior Authorization Acceleration | UM module configuration, clinical decision rules, HIPAA audit logging | +80–100h |
| Patient Engagement | Health Cloud care plan configuration, EHR integration (Epic/Cerner), care gap rules | +100–120h |
| Underwriting Assist | FSC Insurance configuration, submission workflow, risk scoring rules | +80–100h |
| Claims Automation | STP rules engine, adjuster queue, document ingestion pipeline | +100–120h |
| HCP Engagement | Life Sciences Cloud compliance configuration, sample management, call planning | +80–100h |
| Deal Intelligence & Renewal Assist | Revenue Cloud Advanced, product usage data integration, churn model | +80–100h |

---

### Step 4 — Pilot-to-Production Factory (annual retainer)

Scoped as a monthly retainer covering: 2–4 new workflow launches per quarter, AgentOps monitoring and optimization, AI champion network support, shadow AI governance intake, platform upgrades, ongoing AMS. Scope confirmed with Chintan/Ameya.

---

## 4. The 7 Commonly Missed Items

Always check these. They are absent from almost every first-pass estimate:

| Item | Why it's missed | Typical hours |
|---|---|---|
| Data migration (extract, transform, load, validation) | Assumed the client will "handle it" | 80–120h |
| Org health remediation (tech debt, permission sets, sharing rules) | Not visible until org access is granted | 40–80h |
| Integration testing across all source systems | Estimated as unit testing only | 60–80h |
| User training and enablement | Added as a line item but under-scoped | 40–60h |
| Cutover planning and hypercare | Treated as a deployment event, not a project | 30–40h |
| Change management and adoption planning | Never in scope until the go-live fails | 20–40h |
| License and environment provisioning | "Someone else handles this" | 20–30h |

---

## 5. Standard Delivery Phases

Every Salesforce proposal follows this phase structure:

| Phase | Duration | Exit criteria |
|---|---|---|
| **Phase 0 — Discovery** | 1–2 weeks | Signed-off requirements, confirmed scope, architecture decision |
| **Phase 1 — Design & Build** | 4–8 weeks | All configured, developed, and integrated; internal QA passed |
| **Phase 2 — UAT & Deploy** | 2–3 weeks | UAT sign-off, cutover complete, go-live confirmed |
| **Phase 3 — Hypercare** | 2–4 weeks | Defect resolution, adoption monitoring, KPIs tracked |
| **AMS (optional)** | Ongoing | SLA-based managed services, monthly retainer |

For Step 3 accelerator proposals: Phase 0 is the Step 2 Blueprint (already delivered). Begin at Phase 1.

---

## 6. Commercial Terms — Standard Structure

Payment milestones (standard, adjust per deal with Vinod/Naveen approval):

| Milestone | Payment |
|---|---|
| Contract signature | 30% |
| Phase 1 completion (build sign-off) | 40% |
| Go-live / project closure | 30% |

For Step 1 Assessment: 50% on kickoff, 50% on report delivery.
For Step 4 Factory: monthly retainer, invoiced on the 1st of each month, net 30.

**Never publish specific dollar amounts in proposals.** Reference "commercial schedule" or "rate schedule (Appendix A)" — Naveen and Vinod approve before it goes out.

---

## 7. Architecture Standards — Always Include

These are non-negotiable Teqfocus defaults on every Salesforce engagement:

| Standard | Why |
|---|---|
| Einstein Trust Layer | Governs all AI actions — masked data, zero retention, audit trail. Required for regulated industries; recommended for all. |
| Zero-copy Snowflake ↔ Data 360 | No data duplication. Live Snowflake data accessed by Agentforce agents without moving it to Salesforce. Default when prospect has Snowflake. |
| Human-in-the-loop on AI decisions | All Agentforce actions in regulated workflows require human review before commit. Designed in from architecture phase. |
| AgentOps framework | Observe / Evaluate / Govern / Optimize. Monitoring and drift detection from day 1 of production. |
| Sandbox-first delivery | All development in sandbox, promoted to production through a documented change set process. Never develop in production. |
| Role-based access with least privilege | Permission sets designed by function, not role. Reviewed at Phase 0 exit. |

---

## 8. Integration Decision Logic

| Scenario | Integration pattern |
|---|---|
| 3+ source systems with complex transformation | MuleSoft |
| Prospect already has Snowflake as the data warehouse | Zero-copy Snowflake ↔ Data 360 |
| Single point-to-point, low volume, no transformation | Salesforce direct REST/SOAP API |
| EHR integration (Epic, Oracle Health/Cerner) | MuleSoft + HL7 FHIR adaptor |
| Real-time event streaming | MuleSoft Anypoint or Salesforce Platform Events |
| Existing MuleSoft instance in the org | Extend existing — do not introduce a competing middleware |

---

## 9. Salesforce Product Naming (2025–2026)

Use current names in all proposals:

| Old name | Current name |
|---|---|
| Data Cloud | Data 360 |
| Service Cloud Einstein | Agentforce Service |
| Marketing Cloud Growth/Advanced | Agentforce Marketing |
| Einstein AI | Agentforce AI |
| Tableau CRM / CRM Analytics | Tableau Next |
| CPQ | Revenue Cloud Advanced (CPQ end-of-sale; migration path to 2028) |
| — | Agentforce IT Service (new Salesforce ITSM) |
