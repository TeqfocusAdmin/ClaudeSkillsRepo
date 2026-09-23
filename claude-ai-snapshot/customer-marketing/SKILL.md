---
name: customer-marketing
description: >
  Customer marketing skill for Teqfocus. Use this skill whenever the user wants
  to create assets for existing clients — case studies, QBR narratives, expansion
  campaigns, upsell/cross-sell sequences, renewal framing, or customer success
  stories. Trigger when the user mentions: case study, customer story, QBR, upsell,
  cross-sell, expansion, renewal, existing client, customer success, turning a win
  into content, or "we just delivered something good for [client]." This skill
  serves two audiences simultaneously — the existing client (retention/expansion)
  and the future prospect (proof). Always use this skill for client-facing and
  client-derived assets.
---

# Teqfocus Customer Marketing Skill

This skill turns Teqfocus delivery into pipeline. Every successful engagement
produces two things: a happy client and a proof asset that wins the next deal.
This skill governs both.

## How to Use This Skill

1. **Read this SKILL.md fully** before producing any customer asset
2. **Identify the output type** → load the relevant reference file
3. **Confirm client approval status** before including company name / metrics
4. **Deliver complete, ready-to-use assets** — case studies, expansion emails,
   QBR narratives — all fully written

## Reference Files

| Output Type | Reference File |
|---|---|
| Full Case Study | `references/case-study.md` |
| Case Study Sell Sheet (1-page) | `references/sell-sheet.md` |
| Expansion Campaign | `references/expansion-campaign.md` |
| QBR Narrative | `references/qbr-narrative.md` |
| Customer Success Story (LinkedIn) | `references/success-story-linkedin.md` |

---

## Section 1: The Customer Marketing Flywheel

```
DELIVERY → CASE STUDY → PROOF ASSET → NEW DEALS
         ↘              ↗
          EXPANSION CAMPAIGN
```

Every engagement Teqfocus delivers should produce:
1. A case study (for external use — prospect proof)
2. A sell sheet (for sales — 1-page, immediately usable)
3. An expansion campaign (for the client — next phase of value)
4. A LinkedIn story post (for social proof)

These four assets, built consistently, compound over time into the strongest
proof library in the Salesforce/data SI ecosystem.

---

## Section 2: Case Study Production

### From Raw Notes to Published Case Study

**Inputs needed:**
- Client name + industry (and approval level: name OK / category only / fully anonymous)
- The specific problem they came to Teqfocus with
- What Teqfocus built (technologies, approach, timeline)
- The measurable outcomes (with verification status)
- A client quote if available and approved

**The 3-Part Structure (fixed — every case study):**

```
PART 1 — THE CHALLENGE
What was the client dealing with that brought them to Teqfocus?
• Industry context + company-specific situation
• 2–3 specific pain points (operational, technical, business impact)
• What they had tried that hadn't worked (if known)
• Why status quo was not an option

PART 2 — THE SOLUTION
What did Teqfocus build and how?
• Architecture approach — specific, not generic
• Technologies and platforms deployed (named, with purpose)
• Timeline and delivery model (phased? rapid? AMS follow-on?)
• What made this approach specific to their situation (not "our standard delivery")

PART 3 — BUSINESS OUTCOMES
What changed for the client as a result?
• 2–4 specific, verified metrics (flag with [VERIFY] if unconfirmed)
• Business impact beyond the metrics (adoption, team capability, strategic positioning)
• Client quote if available
• What's next (follow-on phase, AMS, expansion — if shareable)
```

**Case study voice rules:**
- Written from the client's perspective — what THEY experienced, not what Teqfocus did
- The hero of the case study is the client and their team — Teqfocus is the enabler
- Every metric must be verified or flagged [VERIFY]
- If client name can't be used: "[Leading Healthcare System]" or "[Fortune 500 Telecom]"
- No Teqfocus self-congratulation — let outcomes speak

**Length:** 600–900 words for full case study / 200–300 words for sell sheet

---

## Section 3: Expansion Campaign Design

When a client engagement is complete (or nearing completion), design an
expansion campaign targeting the next logical phase of work.

### Expansion Campaign Intake
- Client name + current engagement
- What was delivered
- The natural adjacent need (next service line, next use case, next business unit)
- The right contact for the expansion conversation (may differ from original buyer)
- Timeline: Is the client in a good position to hear about expansion right now?

### Expansion Campaign Structure

**Asset 1: Expansion Proposal Email**
```
Sender: Account owner / AE
Tone: Trusted advisor, not salesperson
Structure:
  Para 1: Acknowledge what's been built and what it's doing for them
  Para 2: The natural next question — what this unlocks or what's still on the table
  Para 3: A specific recommendation — not a menu of options
  CTA: "Worth 30 minutes to walk through what Phase 2 would look like?"
Subject: "[Client name] — what [outcome] unlocks next"
```

**Asset 2: Expansion One-Pager**
```
Section 1: What was delivered in Phase 1 (outcomes + metrics)
Section 2: The gap it revealed or the next logical step
Section 3: What Phase 2 would look like — specific, scoped, outcome-linked
Section 4: Why now — the business case for moving forward
CTA: Schedule a scoping conversation
```

**Asset 3: Follow-Up Sequence (if no response to Proposal Email)**
```
Email 2 (Day 7): A specific insight or trigger that makes Phase 2 timely
Email 3 (Day 14): A peer proof — similar client doing the same next phase
```

---

## Section 4: QBR Narrative Design

A QBR with Teqfocus should feel like a strategy session, not a status report.

### QBR Narrative Structure

**The Pre-QBR Email (sent 3–5 days before)**
```
Subject: "[Client Name] QBR — agenda + what we'll cover"
Body:
  - Set the frame: "This QBR is about [strategic theme], not just delivery status"
  - Share the 3 agenda items
  - Ask: "Is there anything specific on your agenda you'd like us to prepare for?"
```

**The QBR Meeting Narrative Arc**
```
Opening (5 min): Frame the strategic context — what's changed since last quarter
                 that makes this conversation important

Value Recap (10 min): What was delivered → the business impact → client team wins
                      Lead with outcomes, not deliverables

Open Challenges (10 min): What's not working or what's harder than expected
                           Proactively name problems — don't wait to be asked

Strategic Recommendation (10 min): One clear recommendation for next quarter
                                    Specific, scoped, outcome-linked

Expansion Discussion (10 min): The natural next phase — framed as client opportunity
                               not Teqfocus pipeline

Close (5 min): Agreed next steps — owned by name, not by "the team"
```

**QBR Leave-Behind (1-page)**
```
Section 1: What we did this quarter — 3 bullet outcomes
Section 2: What we recommended for next quarter — 1 specific recommendation
Section 3: Proposed engagement for next phase — brief, not a full proposal
```

---

## Section 5: LinkedIn Customer Success Post

When a case study is approved for public use:

```
Format: Proof post (see linkedin-campaigns skill)
Hook: The outcome — specific metric or transformation result
Body: Challenge → what was built → outcome (2–3 sentences per section)
Named customer: Use client name if approved
Attribution: "[Client Name] + Teqfocus — [brief description of engagement]"
CTA: "Full case study → [link]" or tag the client contact if appropriate
Length: 150–250 words
```

**Client tagging rules:**
- Only tag the client company page if they have approved it
- Never tag individual client contacts without their explicit permission
- If unsure: don't tag — name the company without tagging

---

## Section 6: Expansion Trigger Signals

Watch for these signals in active accounts — each is an expansion conversation trigger:

| Signal | Expansion play |
|---|---|
| New executive hired (CIO, CDO, VP Sales) | Re-engage with fresh perspective pitch |
| Company announces AI initiative (PR, LinkedIn) | "Data readiness for that initiative" conversation |
| Salesforce license expansion (AE shares) | Data Cloud or additional cloud add-on |
| Poor Salesforce adoption post-go-live | Managed services or optimization engagement |
| M&A activity | Org consolidation or new entity setup |
| New budget cycle announcement | QBR + roadmap conversation for next fiscal |
| Client posts about a problem Teqfocus solves | Direct outreach with specific solution reference |
| Project team asks capability question outside current scope | Natural expansion to adjacent service line |

---

## Section 7: QBR Preparation Checklist

Before every Quarterly Business Review with an active client:

**Data to pull (1 week before):**
- [ ] Project milestones achieved vs. planned
- [ ] Key metrics delivered vs. targets (use verified numbers only)
- [ ] Open issues or risks on the engagement
- [ ] Upcoming milestones for next 90 days
- [ ] AE notes on any account relationship dynamics

**Narrative to prepare:**
- [ ] What changed for the client since last QBR?
- [ ] What's the value story — in their language, not Teqfocus's?
- [ ] What's the next opportunity on the roadmap?
- [ ] What does continued partnership look like?

**QBR meeting structure:**
1. Their priorities — ask before presenting (5 min)
2. What we delivered — specific outcomes, not activities (10 min)
3. What's next — roadmap and recommendation (10 min)
4. Open discussion — questions, concerns, relationship (10 min)

**What to leave behind:**
- 1-page executive summary (use exec-briefing reference from teqfocus-gtm)
- Verified metric summary with [VERIFY] flagged on any uncertain number
- Specific next engagement proposal or options

---

## Section 8: Reference Program Structure

Building a pipeline of willing client references:

**Who to ask:**
- Clients who proactively praised the engagement in writing or conversation
- Clients with strong CSAT scores (4.5+)
- Clients where Teqfocus delivered a measurable, specific outcome

**Types of reference:**
1. **Phone reference** — prospect calls directly (highest value, use sparingly)
2. **Written case study** — approved for public use (see customer-reference reference in teqfocus-gtm)
3. **G2/AppExchange review** — public, AI-citable
4. **Named quote** — for use in proposals and one-pagers (approved)
5. **Category reference** — "a healthcare payer we work with" (no name, still valuable)

**Reference fatigue rule:**
Never use the same client as a live reference more than 2× per quarter.
Rotate references. Protect the relationship.
