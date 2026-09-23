# SOW Template — Teqfocus Standard Format

Reference: Asana SOW TS262069, signed March 20, 2026 by Angad Singh (CEO)

---

## TEQFOCUS STANDARD ENTITY DETAILS

Always use these exactly in every SOW:

```
Teqfocus Group Inc ("Service Provider" / "Vendor" / "Teqfocus")
a Delaware corporation
Registered office: 8 The Green, Ste A, Dover, Kent County, DE 19901

CEO / Authorized Signatory: Angad Singh
```

**Banking details (payment by bank transfer section):**
```
Beneficiary Name: Teqfocus Group Inc
Bank Name: Column N.A.
Account Number: 748983898845751
ABA Routing Number: 121145433
Bank Address: 1 Letterman Drive, Building A, Suite A4-700, San Francisco, CA 94129
```

**SOW numbering:** TS + 6 digits. Get the next sequential number from Naveen.

---

## THE 16-SECTION STRUCTURE

---

### SECTION 1 — Executive Summary: Engagement Overview

**For staff augmentation:**
"Under this Statement of Work, Teqfocus will provide staff augmentation services to support [Client]'s internal technology initiatives and development activities.

The engagement will involve providing qualified technical professionals to support [Client]'s internal teams in areas including:
• [Role 1 — capability area]
• [Role 2 — capability area]

The personnel provided under this engagement will work collaboratively with [Client]'s internal teams and stakeholders and will perform assigned activities according to [Client]'s project priorities.

This engagement is capacity-based staff augmentation rather than a fixed outcome delivery model."

**For fixed-outcome delivery:**
"Under this Statement of Work, Teqfocus will deliver [description of deliverables] for [Client].

The engagement will be delivered in [X] phases with defined milestones and acceptance criteria. This engagement follows a fixed-outcome delivery model with milestone-based payment."

**For pod engagements:**
"Under this Statement of Work, Teqfocus will deploy an FDE + Operator pod to support [Client]'s [domain] team in standing up AI-powered workflows across [vertical(s)].

The pod will consist of [X] Teqfocus engineers paired with [Client]'s Business Systems Analysts and Business Product Owners. The engagement begins with one vertical and expands per the 12-month roadmap agreed in the proposal."

---

### SECTION 2 — Objectives

List 4–6 bullet objectives. For staff aug:
• Provide experienced technical resources to augment [Client]'s internal [domain] teams
• Support ongoing [technology] development and operational initiatives
• Provide engineering support for [specific area] initiatives
• Enable faster execution of internal technical initiatives through extended engineering capacity
• Ensure flexible staffing support aligned with [Client]'s evolving project priorities

---

### SECTION 3 — Scope of Services

One sub-section (3.1, 3.2, etc.) per role. Each sub-section has:
- Role title as sub-heading
- "The [Role] may assist with:" followed by 5–8 bullet activities
- Use "may assist with" language for staff aug — not "will deliver"
- Use "will deliver" language for fixed-outcome

**Standard activities by role:**

*Salesforce Developer/Consultant:*
- Salesforce configuration and customization
- Development using Apex, LWC, and Flow
- Integration with third-party applications via REST/SOAP APIs
- Data migration activities between Salesforce and external systems
- Salesforce security configuration (roles, profiles, permission sets)
- Testing: unit, integration, regression
- Evaluation of Salesforce platform releases
- Technical support and troubleshooting

*AI/ML Engineer:*
- Development and experimentation with machine learning models
- Data preparation and preprocessing support
- Integration of ML models into application workflows
- Support for AI experimentation, model validation, and prototyping
- Collaboration with internal engineering and product teams
- Technical documentation where required

*Data Engineer:*
- Data pipeline design and implementation
- Data platform configuration (Snowflake, Databricks, AWS/Azure)
- Data quality rules and governance implementation
- ETL/ELT development
- Data model design and optimization
- Performance tuning and monitoring

*Salesforce CPQ Specialist:*
- CPQ configuration and customization
- Product configuration and pricing logic
- Quote generation workflows and approvals
- CPQ troubleshooting and issue resolution
- CPQ enhancements and optimizations
- Collaboration with internal Salesforce teams
- Configuration documentation

---

### SECTION 4 — Resource Allocation

One table per role type. Format exactly as:

| Role | Name | Location | Start Date | End Date |
|---|---|---|---|---|
| [Role title] | [Name or TBD] | [Offshore (India) / Nearshore (Canada) / Onshore (US)] | [Month DD, YYYY] | [Month DD, YYYY] |

After the table:
"The assigned resource shall maintain reasonable working hour overlap with the Client team, including availability until [X:XX PM Client Timezone] on standard business days.

Teqfocus may substitute resources with equivalent skillsets if reasonably required, subject to written consent by the Client."

---

### SECTION 5 — Engagement Model

**Staff augmentation:**
"This engagement will follow a staff augmentation model. Under this model:
• Work priorities will be according to Client's project priorities
• Activities will align with Client project requirements
• Resource utilization may vary based on Client requirements

Teqfocus will ensure that the resources possess the relevant experience and technical capability required for the engagement."

**Fixed-outcome:**
"This engagement follows a fixed-price, milestone-based delivery model. Teqfocus will deliver defined outcomes against agreed acceptance criteria. Payment is tied to milestone completion, not hours worked."

---

### SECTION 6 — Out of Scope

"Unless otherwise agreed in writing, the following are outside the scope of this SOW:
• Fixed delivery commitments or milestone-based outcomes [REMOVE for fixed-outcome SOWs]
• Managed services or ongoing operational support beyond allocated resources
• Enterprise-wide architecture consulting engagements
• Third-party software licensing or procurement
• Infrastructure provisioning or cloud hosting
• End-user training programs beyond knowledge sharing

Any additional work outside the scope may be handled through mutually agreed change orders."

Customize this list for each engagement. Remove items that are actually in scope.

---

### SECTION 7 — Client Responsibilities & Assumptions

"[Client] shall:
• Provide system access mutually agreed upon in advance and to the extent required for the resources to perform assigned work
• Identify internal stakeholders for coordination
• Provide project priorities and task assignments
• Provide development environments and tooling access mutually agreed upon in advance
• Facilitate timely feedback and approvals where required

Any delays related to client dependencies may impact timelines or utilization, and Teqfocus will promptly notify [Client] of any such delays."

---

### SECTION 8 — Change Management

"Any changes related to:
• Scope of work
• Resource allocation
• Engagement duration
• Additional roles or skillsets

shall be addressed through mutually agreed written amendments or change requests or statement of work as applicable."

---

### SECTION 9 — Commercials

One sub-section (9.1, 9.2, etc.) per role. Each sub-section has a table:

| Role | Location | Specification | Rate/Hour (USD) | Monthly Invoice (USD) |
|---|---|---|---|---|
| [Role] | [Location] | Actual | $[X].00 | $[X × 160].00 |
| [Role] | [Location] | Discounted | $[X].00 | $[X × 160].00 |

After the table:
"Duration of engagement: [X] months, [Start date] to [End date]."

After all role sub-sections:
"*** Billing & Invoicing will be based on actual hours worked and invoiced monthly unless otherwise agreed. **Billing will not exceed $[TOTAL CAP].** Under no circumstances shall the amount invoiced or paid hereunder exceed the above fee without [Client]'s prior written consent."

**Rate structure guidance (internal reference — do not include in SOW):**
- Offshore India: Actual ~$45–60/hr · Discounted ~$35–45/hr (depending on seniority)
- Nearshore Canada: Actual ~$85–120/hr · Discounted ~$55–75/hr (depending on seniority)
- Onshore US: Actual ~$150–200/hr · Discounted ~$100–150/hr (depending on seniority)
- Rates always subject to Naveen + Vinod approval before SOW is generated

---

### SECTION 10 — Payment Terms

"• Net 30 days payment terms from invoice date
• Invoices will be issued monthly based on hours logged
• Timesheets can be logged on client portal if applicable or Teqfocus can track & report this along with the invoice
• Additional requirements handled via Change Orders
• Client to process PO internally if applicable"

---

### SECTION 11 — Payment by Bank Transfer

"Beneficiary Name: Teqfocus Group Inc
Bank Name: Column N.A.
Account Number: 748983898845751
ABA Routing Number: 121145433
Bank Address:
1 Letterman Drive, Building A, Suite A4-700
San Francisco, CA 94129"

---

### SECTION 12 — Communication & Governance

"12.1. For the purpose of this engagement:
• Email communication will be considered official communication
• Teams may conduct periodic check-ins or coordination meetings as required
• Resource activities will be aligned with Client's internal sprint cycles or planning processes

12.2. Resource Engagement Notification
Teqfocus will provide the Client with no less than thirty (30) calendar days prior written notice before the scheduled end date of any resource engagement under this SOW.

Such notification will allow the Client to determine whether the resource engagement should be extended, modified, or concluded in accordance with the applicable terms of the Vendor Services Agreement."

---

### SECTION 13 — Extension

"Any continuation or extension of the engagement beyond the scheduled end date shall be mutually agreed in writing by the Parties."

---

### SECTION 14 — Location

"Services will primarily be performed remotely, unless otherwise mutually agreed, and from a location that must be approved in writing by Client in advance."

---

### SECTION 15 — Acceptance

**15.1 Vendor Device Requirements**
Include this section only if the client's vendor agreement specifies device requirements. If the client does not mandate specific device specs, omit this sub-section entirely or replace with:

"Engineering resources assigned under this SOW shall use devices that comply with reasonable security standards including encryption, endpoint protection, and access controls. Specific device requirements, if any, will be agreed in writing prior to engagement start."

---

### SECTION 16 — Security & Compliance

"Teqfocus will:
• Comply with Client security and data handling policies provided in writing
• Ensure reasonable security practices for development activities
• Maintain confidentiality of client systems and data
• Share standard security documentation if required under NDA"

---

## SIGNATURE BLOCK

```
AGREED & ACCEPTED AS OF THE DATE FULLY EXECUTED

[CLIENT NAME]                           TEQFOCUS GROUP, INC

Authorized Signature: ___________       Authorized Signature: ___________
Name: ___________________________       Name:  Angad Singh
Title: __________________________       Title: CEO
Date: ___________________________       Date:  ___________________________
```

---

## WHAT NEEDS NAVEEN + VINOD APPROVAL BEFORE SOW IS GENERATED

- Actual and discounted rates per role per location
- Total billing cap
- Duration of engagement
- Any rate exceptions or custom terms

## WHAT NEEDS ANGAD'S REVIEW + SIGNATURE BEFORE SOW GOES TO CLIENT

- The complete SOW document
- Any non-standard clauses (subcontracting, IP assignment, indemnification)
- Any MSA or VSA that governs the SOW (if client provides their own agreement)
- Any SOW where the billing cap exceeds $100K
