---
name: gtm-decision-frameworks
description: Structured decision-support frameworks for Teqfocus GTM calls that are judgment calls, not asset production. Use whenever the user needs to decide between options, diagnose why something failed, prioritize competing work, navigate a stakeholder conflict, or run a post-mortem, rather than draft a piece of content. Trigger on phrases like "should we kill this," "which wedge for this account," "help me decide between Tier X and Tier Y," "why did this deal stall," "what's our angle here," "run a post-mortem on," "we have too much competing for this week," or "walk me through the trade-offs." This is a governance/thinking tool, not a content skill, pairs with but does not replace campaign-designer, abm-intelligence, or the production skills. Always loads teqfocus-gtm context (wedges, tiers, CTAs, defaults) before running any framework here.
---

# GTM Decision Frameworks

Eleven structured thinking tools for Teqfocus GTM decisions, adapted from a general-purpose problem-solving prompt library. Unlike the source prompts, every framework here is pre-wired to Teqfocus's actual mechanics: the four competitive wedges, the three account tiers, the four approved CTAs, the Ship Gate bar, and the Revenue Retro cadence. Nothing here should read like a generic template with brackets left for the user to fill; fill them yourself from project knowledge before presenting the output.

## Before running any framework

1. Confirm which asset/decision type this is (see routing table in `01_GTM_Brain_SKILL_MANIFEST_v2.md`); if the answer is really "write me a thing," route to the production skill instead of running a framework.
2. Pull the relevant facts from project knowledge rather than asking the user to restate them: DEFAULTS.md for tier/CTA/persona defaults, REVENUE_RETRO.md for pipeline numbers, MEMORY.md for standing corrections, and the wedge table for competitive framing.
3. Never invent a number. `[VERIFY]` anything not sourced from a report or a cleared proof entry.
4. Output the framework's verdict in the "GTM Decision Output" format below, not as loose prose, so it can be dropped straight into a retro, a Slack update, or MEMORY.md.

## Output format (all frameworks)

```
DECISION: [one line, the actual question being answered]
FRAMEWORK USED: [name]
INPUTS: [facts pulled, with source, e.g. "REVENUE_RETRO.md, June" or [VERIFY]]
ANALYSIS: [2-5 lines, the actual reasoning, not a restatement of the question]
RECOMMENDATION: [one line, a real answer, not "it depends"]
CONFIDENCE: [high / medium / low, and why]
IF WRONG: [the one thing that would flip this recommendation]
```

---

## Tier 1: Use these often

### 1. Root Cause Analysis
**When:** A motion, asset type, or channel is underperforming and the instinct is to blame the market rather than the mechanism.
**Run it:** Trace the Five Whys against the actual funnel: MQL volume → SQL conversion → Opp creation → Contact Role attribution → Wedge used. Stop at the first Why with a file behind it (a missing UTM, a Ship Gate fail, an SLA miss), not a Why that dead-ends in "buyers are cautious this quarter." Cross-check against the Revenue Retro's "what did nothing" kill list before concluding.

### 2. Decision Framework
**When:** Choosing between two concrete options with a business goal on the line, tier assignment, wedge selection, channel investment, build vs. partner.
**Run it:** State the actual goal (usually: influenced pipeline against the FY2026 goal), state the real constraints (capacity, the Four Hard Rules, Ship Gate bar), evaluate both options against the wedge scoreboard and the tier's expected motion (1:1 / 1:few / 1:many), and recommend the stronger one with the trade-off named, not hedged.

### 6. Constraint Solver
**When:** Scoping an engagement, a campaign, or a piece of content under a hard constraint, budget, timeline, headcount, a client's tech stack.
**Run it:** List the real constraints (from the brief, DEFAULTS.md, or the client's stated environment). Generate options that are actually deliverable within them, ranked by feasibility versus effort, and name the trade-off honestly instead of the usual creative-agency habit of overpromising and re-scoping later.

### 9. Trade-off Navigator
**When:** Allocating capacity across projects/motions for the month, or choosing which CTA / persona / format to lead with on a single asset.
**Run it:** Pull the priorities that actually matter, this month's Revenue Retro decision, the wedge scoreboard, the FYTD number against the $20M goal, not a generic "what matters most" brainstorm. Score each option against those specific priorities and recommend the one that best serves the stated goal, being explicit about what gets deprioritized.

### 17. Stakeholder Conflict Resolution
**When:** A live deal has competing internal buyers, CIO wants speed, security wants a different architecture, procurement wants price, or an internal Teqfocus disagreement (Avi vs. Angad vs. Naveen/Vinod on commercials).
**Run it:** Name each stakeholder's stated want and underlying interest separately (a CFO who "wants a lower price" may actually want risk reduced, not cost cut). Propose the option that satisfies the underlying interests, even if it isn't the one anyone explicitly asked for, and flag what each side gives up.

### 20. Post-Mortem for Future Prevention
**When:** A deal closed-lost, an SLA was missed, or a launch underperformed, this IS the Revenue Retro's "what does the engine learn" step, formalized for a single event.
**Run it:** State what happened, what was expected, what decisions were made along the way, and where the warning signs were missed or ignored. End with 2-3 specific process changes, each one becomes either a MEMORY.md entry, a play change, or a routing decision. An output that doesn't change a file changed nothing, per REVENUE_RETRO.md doctrine.

---

## Tier 2: Situational

### 10. Information Gap Identifier
**When:** An account brief or campaign ask is thin and drafting now would mean guessing.
**Run it:** List what's actually known (from CRM, prior touches, 8-C signal capture) versus what's assumed. Rank gaps by how much they'd change the play, not by how easy they are to fill. Recommend the best decision available now given what we know, flagging where more research (abm-intelligence, clay-engine) would change the answer.

### 11. Failure Mode Mapping
**When:** Before a high-stakes ABM send, event launch, or first engagement with a new client, especially where the Four Hard Rules or Ship Gate chain could break silently.
**Run it:** Map each stage of the chain (signal → play → template → Ship Gate → Pardot send) for what could fail there, no UTM, no Campaign, no CRM record, no Opportunity, and what would catch it before it ships. Prioritize by how expensive the failure would be if it reached the client.

### 13. Prioritization Under Pressure
**When:** Multiple asset requests are competing for the same production slot this week.
**Run it:** Rank against the FYTD pipeline goal and this month's Revenue Retro decision, not against whoever asked loudest. Name what gets delayed or dropped explicitly rather than silently slipping it.

### 18. Complexity Reduction
**When:** A solution design or proposal scope has sprawled past the original brief.
**Run it:** Separate what's truly interdependent from what can be phased or sold separately. Give the simplified entry point (the smallest scoped engagement that still proves value) and the expansion path, rather than one large undifferentiated ask.

### 19. Second-Order Thinking
**When:** Choosing a competitive wedge or a claim for a specific account, especially where the wrong choice could cost more than it wins (e.g., leading with a wedge that reads as an attack on a partner-adjacent player).
**Run it:** State the immediate expected effect of the choice, then the second- and third-order consequences (how the prospect's other stakeholders, or a partner relationship, might react). Adjust the recommendation if the downstream cost outweighs the upside.

---

## Not included here

Devil's Advocate Review, Scenario Planning, Expert Perspective Simulation, Stuck Problem Reframe, Analogy-Based Problem Solving, Feedback Loop Diagnosis, First Principles Breakdown, Constraint Removal Thought Experiment, and Step-by-Step Plan Builder were left out. The first three fit `office-hours` or `deep-research` better (big strategic bets, not routine calls). The rest are either general creativity prompts with no specific Teqfocus hook yet, or already codified elsewhere (OPERATING_PROTOCOL.md covers the plan-builder job). Pull them in later if a real recurring use case shows up, don't force a hook that doesn't exist yet.
