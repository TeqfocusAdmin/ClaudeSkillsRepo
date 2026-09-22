---
name: solution-design
description: |
  Teqfocus Solution Design skill. Use this skill whenever a technical solution design document
  is needed for any Teqfocus engagement — across any technology: Salesforce, Snowflake,
  Databricks, AWS, Azure, GCP, Anthropic Claude API, MCP agents, custom application builds,
  or data transformation. Triggers include: "create a technical design", "write the solution
  architecture", "build the technical spec", "design the solution", "map the requirements to
  components", "write the tech design for this deal", or any request for a deliverable
  architecture document a delivery team or technical stakeholder can act on.

  This skill is Agent 6 in the Cowork proposal pipeline. It fires after scope is confirmed,
  produces a reviewable technical design, then routes it through the escalation framework.

  FLOW: Create the design first. Then escalate for review. Never escalate an empty brief.
---

# Solution Design Skill

Produces a 2–3 page technical design document for any Teqfocus engagement. Output is a
reviewable artifact — not a chat answer. It goes to Andy for Gate 2 review, then feeds
proposal assembly at Gate 3.

---

## Step 1 — Read Reference Files and Sales Play Documents

1. **Search project knowledge for an uploaded sales play document** for this vertical or technology. If one exists, it defines the solution scope — use it.
2. Load `references/sd-patterns.md` — architecture patterns per vertical and accelerator
3. Load `offerings-catalog.md` — component specs and "done looks like" per accelerator
4. Load `sf-knowledge.md` from the proposal-creator skill — architecture standards and integration logic

---

## Step 2 — Confirm Five Inputs

Before designing, confirm:

1. **Technology in scope** — Salesforce / Snowflake / Databricks / AWS / Azure / GCP / Claude API / custom / combination?
2. **Vertical and solution pattern** — which accelerator or custom solution type?
3. **Step in scope** — Step 2 Blueprint (design only) or Step 3 (buildable spec)?
4. **Source systems** — what are the integration targets?
5. **Compliance obligations** — HIPAA / SOC 2 / financial regs / GDPR / none?

If any are missing from the brief, ask for them before producing output.

---

## Step 3 — Produce the Technical Design Document

Output as structured prose — not bullets. Each section is 1–3 paragraphs or a table. Readable by a client's technical lead and by Teqfocus delivery team.

---

### DOCUMENT STRUCTURE

**1. Engagement Context** *(1 paragraph)*
Client, vertical, solution in scope, Step being designed. One sentence that says what this document covers.

**2. Current State Summary** *(1 paragraph)*
What the client has today: existing systems, data platform, integration landscape, tech debt, compliance obligations, constraints.

**3. Proposed Architecture** *(1 page)*
How the solution layers interact — platform, data, integration, AI (where applicable). Written as connected prose, not a components list. Reference the architecture diagram (produced separately for the proposal deck).

Sub-sections:
- **Platform layer**: primary technology and key configuration or build areas
- **Data layer**: data platform, movement or zero-copy design, data model overview
- **Integration layer**: pattern selected (MuleSoft / zero-copy / direct API / custom), source systems, API approach
- **AI layer** *(where applicable)*: agent(s) in scope, grounding strategy, Trust Layer or governance design, human-in-the-loop touchpoints

**4. Component Specification** *(table)*

| Component | Type | Description | Phase |
|---|---|---|---|
| [Component name] | Config / Build / Integration | What it does, key design decisions | Phase 1 |

Populate every in-scope component from the offerings catalog or the uploaded sales play. Every component that gets built appears in this table.

**5. Data Model Overview** *(paragraph + objects table)*
Key data objects, source mappings, identity resolution approach, data quality rules.

| Object / Entity | Standard / Custom | Key Fields | Source System |
|---|---|---|---|

**6. Security and Compliance Design** *(1 paragraph per obligation)*
For each compliance obligation in scope:
- What it requires
- How the Teqfocus architecture satisfies it
- Specific configuration that enforces it

Always include:
- Access control: role-based, least-privilege, audit trail
- Data governance: what moves, what stays in place, retention rules

Add per obligation: HIPAA · SOC 2 · Financial regs · GDPR · Life Sciences (Sunshine Act, PDMA)

**7. Phasing** *(table)*

| Phase | Duration | What gets built | Why this phase |
|---|---|---|---|

Include the dependency logic — explain why the phase order matters, not just what's in it.

**8. Key Risks and Assumptions** *(max 8 items)*
Format: "Assumption: [X]. Risk if wrong: [Y]. Mitigation: [Z]."

**9. Open Items for Gate 2 Review** *(bulleted list)*
What Andy needs to resolve before this design is final.

---

## Step 4 — Create First. Then Escalate.

After producing the technical design:

**1. Surface to the rep** with a 3-sentence summary:
- What the solution does
- The biggest architectural decision made (and why)
- The one assumption that most needs client confirmation

**2. Flag for Gate 2 review — Andy**
"This design is ready for Gate 2 review. Andy needs to review: [list the open items from Section 9]. Once Andy approves, this feeds into proposal assembly. Route to Andy on [Teams / confirmed channel]."

**3. If the design uncovers a need for commercials** — flag immediately:
"This scope will need a rate card from Chintan or Ameya before the proposal goes out. Ping them on Teams with this design document + the scope summary. Naveen and Vinod approve before commercials go to the client."

**4. Full proposal assembly** — after Gate 2 approval, trigger the proposal-creator skill with:
- This approved technical design
- The confirmed scope and phase plan
- Client name, vertical, and engagement details

---

## Step 5 — Output Format

- **In chat**: structured markdown (for rep review and Gate 2 routing)
- **On approval**: Word document (for client and delivery team handoff)

```
[ClientName]_[Vertical]_[Technology]_SolutionDesign_v1.md    ← in chat
[ClientName]_[Vertical]_[Technology]_SolutionDesign_v1.docx  ← on approval
```
