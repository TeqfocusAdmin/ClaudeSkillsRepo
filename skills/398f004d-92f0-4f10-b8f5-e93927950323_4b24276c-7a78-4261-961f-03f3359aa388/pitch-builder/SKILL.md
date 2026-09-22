---
name: pitch-builder
description: |
  Teqfocus Pitch Builder skill. Use this skill whenever a rep, AE, or GTM leader needs 
  to produce a structured discussion deck, proposal narrative, or first-call pitch asset 
  for a named prospect. Triggers: "build me a deck for [company]", "create a pitch for 
  [prospect]", "draft a proposal for [account]", "what should the slides look like for 
  [company]", "write up the Workday-style pitch for [prospect]", "I have a meeting with 
  [company] — build me something to show them." This skill enforces CEO pitch architecture 
  across all output: offering integrity gate, no dollar figures, two-decision structure, 
  org-mirror-first, prospect-picks-order, and technical-work-to-business-outcome pairing. 
  Always loads before producing any pitch or proposal asset. Routes to presales-agent skill 
  for offering match before building slide content. Routes to proposal-creator for full 
  SOW-grade proposals.
---

# Teqfocus Pitch Builder Skill

Produces structured, CEO-architecture-aligned pitch assets for named prospects.
All outputs enforce the Offering Integrity Gate and the 8 Pitch Architecture Rules.

---

## Before You Build — Two Required Inputs

Do not produce a pitch without both:

1. **Prospect org context** — team size, roles, capability areas, platforms in use, stated pain. Ask the rep if missing.
2. **Library offering match** — run the presales-agent offering match first. The offering named in the pitch must trace to the library. If no match: stop and route to Vinod before building.

If either is missing, ask for it. Do not fabricate prospect context. Do not invent an offering.

---

## Step 1 — Gather Minimum Required Context

Ask the rep for the following. Accept partial — fill gaps with stated assumptions.

```
PROSPECT NAME:
PROSPECT TEAM: [size, roles, how organized]
CAPABILITY AREAS: [what workflows they own]
PLATFORMS IN USE: [Salesforce, Snowflake, Databricks, internal tools, etc.]
STATED PAIN: [what they told you is broken or slow]
ENTRY CONVERSATION SO FAR: [what has been discussed — blank if cold]
ENGAGEMENT MODEL FIT: [Step 1–4 / Pod Model / Staff Aug — confirm against library]
SLIDE COUNT REQUESTED: [default: 8–10]
```

---

## Step 2 — Confirm the Offering Match

Before writing slide content, state the offering match explicitly:

```
OFFERING MATCH:
  Named offering: [exact ACC number, Step, or pod model name]
  Source file: [offerings-catalog.md / [sales play filename]]
  Why it fits in one sentence: [...]

If no match found: "No offering in the library matches this pattern.
Confirm scope with Vinod before building the deck."
```

Do not proceed past this step without a confirmed offering match.

---

## Step 3 — Build the Slide Narrative

Use the 10-slide CEO architecture. Adapt for shorter decks (8 slides = collapse slides 7+8 or 3+4).

Every slide has one job. One idea per slide. No exceptions.

---

### Slide 1 — Cover

```
FORMAT:
  Headline: [Engagement framing in ≤10 words]
  Sub: [Audience · Scope · Motion · First Outcome]
  Slide label: "DISCUSSION DECK" or "PROPOSAL"

CEO PATTERN (Workday deck):
  "Standing up the AI Operator Pod."
  FOR: Charles + Taylor · GTM Operations
  PROPOSAL · FDE + Operator engagement · vertical entry
  TODAY · 10-slide walkthrough · ~30 minutes

RULE: Name the motion and the first outcome on the cover. Prospect knows what they're walking into.
```

---

### Slide 2 — Their Team (Mirror First)

```
FORMAT:
  Section label: "AS WE UNDERSTAND IT"
  Org size + leadership names (use what the rep provided)
  Team composition: role types + what each owns
  Capability areas: what workflows/domains they cover

CEO PATTERN (Workday deck):
  "60 PEOPLE · BUSINESS PRODUCT OWNERS · CAPABILITY-ORGANIZED"
  Leadership: Charles (Org Leader), Taylor (Horizontal AI Lead)
  Capability areas: Customer Success · Customer Service · Q2C · Companions / Sana

RULE: This slide earns trust. Let them correct it.
Do NOT start pitching on slide 2. This is a mirror, not a pitch.
```

---

### Slide 3 — The Framework Recap

```
FORMAT:
  Quick recap of the model you're proposing (pod / Step 1–4 / staff aug)
  Name all components — but narrow on the next slide

CEO PATTERN (Workday deck):
  Four-pod model recap (B · F · O · S) — then:
  "Two of these fit your team's shape exactly. Let's talk about which."

RULE: Surface the full model. Create the setup for slide 4 to narrow.
```

---

### Slide 4 — Where Teqfocus Lives in Their Org

```
FORMAT:
  Visual: their org on one side, Teqfocus pod on the other, pairing zone in the middle
  Label: what they bring, what we bring, what the pairing produces

CEO PATTERN (Workday deck):
  Business side (their 60 people) ↑ pairs with ↑ Teqfocus FDE + Operator
  Engineering/platform side lives separately (Builder + Support)

RULE: The pairing model removes "another vendor" objection.
We live inside their org structure — not alongside it.
```

---

### Slide 5 — The Team

```
FORMAT:
  What Teqfocus brings: named roles + what each does
  What they pair with: their roles + what each does
  Total pod size stated

CEO PATTERN (Workday deck):
  "2 FDE + 4 Operator from us — paired with your BAs + POs."
  Table: FDE Tech Lead · Senior FDE Engineer paired with BSAs
  Table: PM · Tech Lead · ML Engineer · Product Engineer paired with BPOs

RULE: Make the pairing concrete. Named roles on both sides.
No headcount numbers. No billing rates. No dollar values.
```

---

### Slide 6 — Options (They Pick)

```
FORMAT:
  Present 2–4 entry options (verticals, use cases, or workstreams)
  Each option: why this could be first + sample use case
  Closing line: "All of these work. Pick where the pain is sharpest."

CEO PATTERN (Workday deck):
  4 verticals presented as numbered options
  Each: Horizontal lead TBD + WHY THIS COULD BE FIRST + SAMPLE USE CASE
  "All four work. Pick where the pain — or the upside — is sharpest right now."

RULE: Never prescribe. Present and let them choose.
This removes the "why this one?" objection before it's raised.
```

---

### Slide 7 — Phase 1 (90 Days)

```
FORMAT:
  4-phase breakdown: Discover → Build → Deploy → Tune
  Each phase: weeks + 3 bullet actions
  Phase 1 starts with: named week-1 actions

CEO PATTERN (Workday deck):
  Weeks 1–3: Discover · Weeks 4–7: Build · Weeks 8–10: Deploy · Weeks 11–12: Tune
  Week 1 starts with: kickoff workshop · access provisioning · NDA + SOC 2 · named pod · standing cadence

RULE: 90 days. Live in production. KPI moving. That's the promise.
Do not promise timelines for Steps 2–4 here.
```

---

### Slide 8 — 12-Month Roadmap

```
FORMAT:
  4-quarter breakdown: Land → Compound → Scale → Standing
  Each quarter: which vertical/use case + what stabilizes + compound value signal
  Compound value statement at the bottom

CEO PATTERN (Workday deck):
  "You don't pay 4× for 4 verticals. Operator pod compounds. FDE shrinks per vertical. You pick the order."
  Q1: Land (CS) · Q2: Compound (Customer Service, ~40% substrate reuse) · Q3: Scale · Q4: Standing

RULE: The compound value argument is the 12-month close.
Make it quantifiable: "~40% substrate reuse from first vertical."
```

---

### Slide 9 — What We Do → What You Gain

```
FORMAT:
  Two columns: WHAT WE DO (technical deliverables) → WHAT YOUR TEAM GAINS (business outcomes)
  6–8 paired rows
  Footer: "YOU DON'T BUY [ENGINEERING OUTPUT] — you buy [BUSINESS OUTCOMES]."

CEO PATTERN (Workday deck):
  What we do: Use case skills · Eval harness · Observability · Governance · Weekly tuning · Pair + train
  What they gain: Spec-to-ship cycle drops · Spec quality up · Patterns flow · Capacity unlock · Restructure optionality · Permanent muscle

RULE: Every technical line has a business outcome line. No orphan deliverables.
Pull deliverables from the named offering in the library — not from memory.
```

---

### Slide 10 — Close

```
FORMAT:
  What we proposed (2–3 sentence summary)
  Your decisions (numbered, 3–4 items — what they bring/decide)
  Our next steps (numbered, 3–4 items — what we bring)
  Single point of contact: name + email
  No-commitment statement at the bottom

CEO PATTERN (Workday deck):
  "2 FDE + 4 Operator · starts on one vertical (you pick) · no commitment until scoping is signed."
  Their decisions: pick vertical · name horizontal leader · identify BAs + POs · confirm scoping dates
  Our next steps: assign pod leads · schedule scoping window · deliver Phase 1 SOW + KPI · kickoff Week 3
  "NO COMMITMENT TO PHASE 1 UNTIL THE SCOPING DELIVERABLE IS SIGNED. Either party can stop after scoping."

RULE: One decision for them to make. One specific next step.
The no-commitment statement is always present. It removes the biggest objection.
Single point of contact — not a team, not a generic email.
```

---

## Step 4 — Pitch Asset Self-Check

Run before delivering any deck content to the rep.

```
OFFERING CHECK
[ ] Every offering named traces to a named ACC, Step, or sales play. Source file cited.
[ ] No invented capabilities. No generalizations beyond the library.

COMMERCIAL CHECK
[ ] Zero dollar figures in any slide
[ ] Two-decision structure present (scoping window → Phase 1 SOW)
[ ] No-commitment statement on the close slide

PITCH ARCHITECTURE CHECK
[ ] Slide 2 mirrors prospect org before any pitch content
[ ] Slide 6 presents options — prospect picks, not Teqfocus
[ ] Slide 9 pairs every technical deliverable with a business outcome
[ ] Slide 10 has one CTA, single POC, no-commitment statement

LANGUAGE CHECK
[ ] No banned words (leverage · synergy · holistic · best-in-class · cutting-edge · robust · end-to-end solutions)
[ ] No "excited to share" · "proud to announce" · "unlock value"
[ ] Buyer vocabulary throughout — not vendor vocabulary
[ ] No metrics from memory — all [VERIFY] flagged
[ ] Summit credential — max once, naturally placed

TRUST SIGNAL
"Solid — send as is." / "Needs [VERIFY]." / "Close — confirm with Avi Kumar." / "Outside scope — route to [owner]."
```

---

## Routing — When to Stop and Hand Off

| Situation | Action |
|---|---|
| No offering match for the prospect's pattern | Stop. "Confirm scope with Vinod before building." |
| Rep asks to include dollar figures | Refuse. Route to Chintan/Ameya → Naveen → Vinod |
| Rep asks for a formal SOW or signed proposal | Route to sow-generator skill → Angad signs |
| Full RFP or multi-stakeholder formal process | Route to Cowork pipeline → Andy → Vinod |
| Technical architecture design needed | Route to solution-design skill → Andy Gate 2 |

---

## Output Format

For chat-grade pitch outlines (most queries): produce the slide-by-slide narrative in markdown.
For full deck production: route to the PPTX skill + teqfocus-design skill for branded output.
File naming: `[ProspectName]_[EngagementModel]_Discussion_Deck_[Date].md`
