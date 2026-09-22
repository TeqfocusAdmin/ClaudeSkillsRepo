---
name: proposal-creator
description: |
  Full-stack proposal creation skill for Teqfocus. Use this skill whenever the user wants to
  create ANY sales or proposal artifact for a client engagement — across any technology:
  Salesforce (Health Cloud, Agentforce, Data 360, Revenue Cloud, FSC, Life Sciences Cloud),
  Snowflake, Databricks, AWS, Azure, GCP, Anthropic Claude API / MCP agent builds, custom
  application development, or data transformation. Triggers include: "create a proposal",
  "write an estimate", "build a deck", "make a presentation", "review this RFP", "audit this
  estimate", "generate a proposal for [client]", "create a pitch deck", "scope this
  engagement", "estimate this project", or any request involving a client brief, RFP, SOW,
  or vendor brief. Always use this skill before attempting to write any proposal, estimate,
  or presentation — do not attempt from memory alone.
---

# Proposal Creator Skill

Produces a complete, client-ready proposal package for any Teqfocus engagement:

1. **Bottoms-up effort estimate** — phased, role-based, with gap analysis
2. **Phased Word proposal document** (.docx) — full commercial proposal
3. **Executive PowerPoint deck** (.pptx) — 10 slides for a live meeting or RFP submission

---

## Step 1 — Read Reference Files and Sales Play Documents

Before doing anything:

1. **Search the project knowledge folder for a sales play document** matching the vertical or technology in scope. If one exists, it is the primary source for offering scope, pricing assumptions, and delivery model. It overrides the reference files below for those areas.

2. Load the reference files:
```
references/knowledge.md     — Teqfocus context, team models, hour benchmarks by engagement type
references/process.md       — Workflow, section-by-section document build instructions
references/tech-rules.md    — docx-js and pptxgenjs rules, formatting standards
```

3. Load `offerings-catalog.md` — for accelerator component specs and "done looks like" descriptions.

---

## Step 2 — Identify Engagement Type

Before estimating, confirm:

| Question | Why it matters |
|---|---|
| What technology is in scope? | Determines team model, hour benchmarks, reference architecture |
| Which Step in the ladder? (1/2/3/4) | Determines phase structure and commercial framing |
| Which accelerator or solution pattern? | Determines component list and "done looks like" |
| Is there an uploaded sales play? | If yes, it drives scope — use it |

---

## Step 3 — Ask 3 Clarifying Questions

Before producing any output:

1. **Engagement type**: Which Step and which technology / accelerator pattern?
2. **Timeline preference**: Standard duration for the step, or compressed?
3. **Client and engagement name**: For document headers and file naming

---

## Step 4 — Bottoms-Up Estimate

Build the estimate using hour benchmarks from `references/knowledge.md` for the identified engagement type.

**For ALL engagement types — check these 7 items:**

| Item | Why it's missed | Typical hours |
|---|---|---|
| Data migration or data preparation | Assumed client handles it | 80–120h |
| Environment setup and provisioning | "Someone else handles this" | 20–40h |
| Integration testing across all systems | Estimated as unit testing only | 60–80h |
| User training and enablement | Added but under-scoped | 40–60h |
| Cutover planning and hypercare | Treated as a deployment event | 30–40h |
| Change management and adoption | Never in scope until go-live fails | 20–40h |
| Security, compliance, and governance design | Retrofitted after build | 40–80h |

**PM buffer must be ≥ 15% of total. Correct if below.**

Present as markdown table. Wait for confirmation before building documents.

---

## Step 5 — Build Word Proposal Document

See `references/process.md` for section instructions.

**Required sections:**
Cover → Executive Summary → Client Situation → Proposed Solution → Scope and Phasing →
Effort Breakdown → Team and Credentials → Timeline → Deliverables →
Client Responsibilities → Commercial Terms → Success Criteria → Next Steps

**Commercial terms standard:**
- Payment milestones: 30% on contract, 40% on Phase 1 completion, 30% on go-live
- Step 1 Assessment: 50% on kickoff, 50% on report delivery
- Never publish dollar amounts — reference "commercial schedule (Appendix A)"

---

## Step 6 — Build Executive Deck (10 slides)

1. Title
2. Client situation — the problem in the client's language
3. The Teqfocus approach
4. Solution architecture — visual
5. Phasing and timeline
6. Solution / accelerator detail
7. Business value — outcomes tied to client objectives
8. Why Teqfocus — credentials + relevant proof point (Summit Partner where relevant)
9. Team — roles, not names
10. Next steps — one specific CTA

---

## Step 7 — Create-First, Then Escalate

After producing the estimate and proposal draft:

1. **Surface to the rep** with a summary of the estimate and top 3 risks
2. **Flag for Gate review** per the escalation framework:
   - Gate 1 — Andy: scope matrix, ROI, UI mockup (if applicable)
   - Gate 2 — Andy: technical design (trigger the solution-design skill if not already done)
   - Gate 3 — Vinod: final proposal + commercials
3. **Commercials lock only after Naveen + Vinod approval** — the proposal document goes out with a placeholder commercial schedule until they confirm

---

## Step 8 — QA Checklist

**Estimate**
- [ ] All requirements have hours allocated
- [ ] 7 commonly-missing items addressed
- [ ] PM buffer ≥ 15%

**Word document**
- [ ] All 13 sections present
- [ ] No dollar amounts inline — reference Appendix A
- [ ] Teqfocus credential appears once, naturally

**Deck**
- [ ] All 10 slides present
- [ ] Solution architecture slide has a visual
- [ ] Business value connects to client's stated objectives

---

## Output File Naming

```
[ClientName]_[Vertical]_[Technology]_Proposal.docx
[ClientName]_[Vertical]_[Technology]_Deck.pptx
[ClientName]_[Vertical]_Revised_Estimate.docx
```
