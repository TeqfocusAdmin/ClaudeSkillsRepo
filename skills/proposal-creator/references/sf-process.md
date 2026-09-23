# Process & Tech Rules — Teqfocus Salesforce Proposal Creator

---

## WORD DOCUMENT BUILD

### Section instructions

**Cover**
Client name, engagement title, date, Teqfocus logo. Subtitle: "Confidential — Prepared for [Client]"

**Executive Summary**
3–4 paragraphs. Opens with the client's situation in their language. Names the proposed approach. States the measurable outcome the engagement will deliver. Closes with the commercial entry point (Step 1/2/3). Never opens with "We are pleased to present."

**Client Situation**
The problem as the client lives it. Use the vertical vocabulary from the presales agent (e.g. "prior auth turnaround" not "claims AI"). Reference any discovery call context. Show you understood before you proposed.

**Proposed Solution**
What Teqfocus will deliver. Name the accelerator pattern, the Salesforce clouds in scope, the data platform, the integration approach. One paragraph per major component. Include the architecture diagram reference (Figure 1).

**Scope and Phasing**
Phase table: Phase 0 through AMS. Duration, activities, and exit criteria per phase. Be specific — not "Phase 1: Build" but "Phase 1: Health Cloud configuration, Agentforce prior auth agent, zero-copy Data 360 integration."

**Effort Breakdown**
The confirmed estimate table. Roles, hours per phase, total. PM buffer line itemized separately. Reference "rate schedule in Appendix A" for commercial translation — never inline rates.

**Team and Credentials**
Standard team composition for this engagement type (from sf-knowledge.md). Teqfocus Summit Partner credential appears here once, naturally: "As a Salesforce Summit Partner and Premier Snowflake Services Partner, Teqfocus brings [specific relevant credential]." No named individuals unless specifically approved.

**Timeline**
Visual or table: phases with start/end weeks. Assumes [agreed start date TBD post-contract]. Do not commit to specific calendar dates in the proposal document.

**Deliverables**
Bulleted list per phase. Specific artifacts: configured org, integration spec, data model document, test results, training materials, go-live checklist, hypercare report.

**Client Responsibilities**
What the client must provide: named project sponsor, SME access, source system credentials, UAT participation, timely decision-making. Delays in client responsibilities extend timeline proportionally.

**Commercial Terms**
Payment milestones (% structure, not dollar amounts). Reference Appendix A for rate schedule. Payment terms: net 30. Reference governing MSA or note that standard Teqfocus MSA applies.

**Success Criteria**
3–5 measurable outcomes tied to the client's stated business objectives. Not platform metrics ("system goes live") — business metrics ("prior auth turnaround time reduced from X to Y within 90 days of go-live").

**Next Steps**
One action: "Schedule a 30-minute scope confirmation call with [Delivery Lead]." Single CTA. No options list.

---

## POWERPOINT BUILD

### Slide instructions

**Slide 1 — Title**
Client name, engagement title, date. Teqfocus logo. Clean. No taglines.

**Slide 2 — Client situation**
The problem in the client's language. 3 bullets maximum. Each one is something the client said or would say themselves — not what we think their problem is.

**Slide 3 — The Teqfocus approach**
How Teqfocus solves it. The positioning statement for this engagement. One paragraph, buyer-vocabulary, not vendor-vocabulary.

**Slide 4 — Solution architecture**
Visual: boxes-and-arrows showing Salesforce clouds, data platform, integrations, external systems. Must be an actual diagram — not a bulleted list of components. Label every box with the current Salesforce product name (Data 360, not Data Cloud).

**Slide 5 — Phasing and timeline**
Horizontal phase strip: Phase 0 → Phase 1 → Phase 2 → Hypercare → AMS. Duration under each phase. Key milestone markers.

**Slide 6 — Accelerator detail**
Specific to the engagement pattern. What the accelerator does, what it includes, what "done" looks like at the end of Step 3. Include the human-in-the-loop design explicitly for regulated industries.

**Slide 7 — Business value**
3–4 outcome statements tied to the client's specific objectives. Use the ROI framing from the CIO playbook: connect operational metrics to P&L impact. Not "faster prior auth" — "prior auth turnaround compression from X days to Y hours = $Z in avoided denials per quarter."

**Slide 8 — Why Teqfocus**
4 differentiators maximum:
- Salesforce Summit Partner + Premier Snowflake Services Partner (once, naturally)
- Same team designs Salesforce and data layers — no handoff
- Vertical accelerators: built and shipped before, not configured for the first time
- Fixed-price, milestone-based — no open-ended T&M

**Slide 9 — Team**
Standard team composition for this engagement (roles, not names). One line per role: "Solution Architect — designs overall architecture and leads client technical relationship."

**Slide 10 — Next steps**
One action. One owner. One date. "Schedule 30-minute scope confirmation — [Delivery Lead] — this week."

---

## DOCX-JS RULES (same as proposal-creator skill — apply identically)

- Use `docx` npm package, not python-docx
- All tables: use `TableRow` and `TableCell` with explicit `width: { size: X, type: WidthType.PERCENTAGE }`
- Never use `.addParagraph()` — deprecated. Use `children: [new Paragraph(...)]`
- All images: pre-convert to base64 before loop — never async-inside-forEach
- Section breaks: use `PageBreak` not manual newlines
- Validate with `python scripts/office/validate.py` before delivering

---

## PPTXGENJS RULES (same as proposal-creator skill — apply identically)

- Pre-render all icons and images before slide loop
- Never use async operations inside the slide generation loop
- All text boxes: explicit `x, y, w, h` in inches — no auto-sizing
- Color palette: Teqfocus purple #6B2FA0 (primary), navy #1B2A4A (secondary), white #FFFFFF
- Font: Calibri or Arial — never embed custom fonts
- Inspect all slide PNG renders before declaring success — check for blank cards, text overflow, overlapping elements

---

## POD ENGAGEMENT PROPOSAL STRUCTURE

*Use this structure for AI transformation proposals where the engagement model is FDE + Operator pods. This is the CEO's preferred proposal format — follow it for any enterprise AI transformation deal.*

### The 10-slide deck structure (pod model)

**Slide 1 — Cover**
Client name and champion names (named, specific). Engagement title. "Working Draft" framing until final. Teqfocus + client logos. Format line: "10-slide walkthrough · ~30 minutes"

**Slide 2 — As we understand it (client's team)**
Map the client's team: leadership, composition, capability areas. Show you've done the homework. Quote from discovery if possible. The message: "We understand your org before we propose anything."

**Slide 3 — Context recap (what we've discussed)**
Brief recap of previous conversations or context. The four-pod model introduced at high level. "Two of these fit your team's shape exactly. Let's talk about which."

**Slide 4 — Where Teqfocus lives in your org**
Show exactly where the FDE pod and Operator pod plug into the client's existing structure. Business side (client's domain) on top. Engineering side (platform/substrate) at the bottom. Teqfocus lives in the pairing zone between them. Highly visual — org map style.

**Slide 5 — The team (our proposal)**
2 FDE + 4 Operator from Teqfocus. Show the pairing: Teqfocus roles ⇄ client roles. FDE pod: Tech Lead + Senior FDE Engineer ⇄ client BSAs. Operator pod: PM + Tech Lead + ML Engineer + Product Engineer ⇄ client BPOs. Total: ~10 people in the pod.

**Slide 6 — Pick your vertical (use case selection)**
Present 3–4 vertical options. For each: why this could be first + a sample use case. "All [X] work. Pick where the pain — or the upside — is sharpest right now." Never recommend just one — let the client choose, but frame each choice.

**Slide 7 — Phase 1 (90 days)**
The four-stage model: Discover (wks 1–3) → Build (wks 4–7) → Deploy (wks 8–10) → Tune (wks 11–12). Bullet points per stage — 3 bullets maximum per column. End: "Week 1 starts with: kickoff workshop · access provisioning · NDA + SOC 2 · named pod assignments · standing meeting cadence."

**Slide 8 — 12-month roadmap**
Four quarters, one vertical per quarter: Land → Compound → Scale → Standing. Show the compound value: "~40% substrate reused" by Q2. "FDE shrinks per vertical." "You decide the order." Bottom line: "You don't pay 4× for 4 verticals."

**Slide 9 — Deliverables and outcomes**
Two columns: What we do (technical) → What your team gains (business outcomes). Do NOT list features — pair each technical deliverable with its business outcome. Close with: "You don't buy engineering output — you buy business outcomes delivered by engineering muscle inside your team."

**Slide 10 — Summary + next steps**
Three columns: Your decisions (numbered) · Our next steps (numbered) · Point of contact. Your decisions: Pick the first vertical · Name the horizontal leader · Identify BAs + POs · Confirm scoping window. Our next steps: Assign named pod leads · Schedule scoping window · Deliver signed SOW + KPI · Kickoff Phase 1 Week 3. Point of contact: Vinod Nair, vinod@teqfocus.com. Close: "No commitment to Phase 1 until the scoping deliverable is signed. Either party can stop after scoping."

### Voice rules for pod engagement proposals

- Sparse. Maximum 3 bullet points per section.
- Named. Use the client champion's actual name, not "the client."
- Direct. "Pick a vertical. We're ready in a week." — not "We look forward to the opportunity."
- Decision-oriented. Every slide ends with a choice or a statement of fact, never a question.
- No fluff. No "excited to present," no "holistic," no "leverage."
- Working Draft until final. Label it "Working Draft" until the client signs the scoping deliverable.
