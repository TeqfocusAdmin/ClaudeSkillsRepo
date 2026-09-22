---
name: campaign-designer
description: >
  Campaign architecture skill for Teqfocus. Use this skill whenever the user
  wants to design a multi-touch, multi-channel campaign arc — deciding which
  channels to use, in what sequence, with what timing, and who sends what.
  Trigger when the user mentions: campaign plan, campaign arc, outreach sequence
  design, multi-touch campaign, which channels to use, campaign strategy, A/B
  variants, sender strategy, or "how should we approach this account/campaign."
  This skill designs the campaign blueprint — other skills (demand-gen,
  linkedin-campaigns, events-engine) produce the individual assets. Always use
  this skill before building assets for any complex or multi-channel campaign.
---

# Teqfocus Campaign Designer Skill

This skill designs the strategic architecture of every Teqfocus campaign.
It answers: what channels, what sequence, what timing, who sends, and what
variants to test — before any copy is written.

## How to Use This Skill

1. **Read intake** — confirm campaign type, audience, and goal (Section 2)
2. **Select the campaign blueprint** from the library (Section 3)
3. **Design the arc** — channel sequence + timing + sender assignment (Section 4)
4. **Define A/B variants** where relevant (Section 5)
5. **Output the Campaign Brief** that feeds downstream skills

## Reference Files

| Output | Reference File |
|---|---|
| ABM Campaign Blueprint | `references/abm-blueprint.md` |
| Outbound Campaign Blueprint | `references/outbound-blueprint.md` |
| Event Campaign Blueprint | `references/event-blueprint.md` |
| Lifecycle Campaign Blueprint | `references/lifecycle-blueprint.md` |

---

## Section 1: Campaign Design Principles

1. **Channel sequencing is strategy.** Email + LinkedIn in the wrong order is
   worse than one channel done well. Every channel has a role in the arc.

2. **Sender tier determines tone.** An SDR email and an executive email are
   different assets, not the same email with a different signature.

3. **Every touch must earn the next.** If Touch 2 doesn't reference Touch 1,
   it's a new campaign — not a sequence. Build coherence into the arc.

4. **Timing is not arbitrary.** The gap between touches is a strategic decision
   based on buyer behavior, not calendar convenience.

5. **One campaign, three channels maximum.** Email + LinkedIn + microsite.
   Adding more channels without more relevance creates noise, not pipeline.

---

## Section 2: Campaign Intake

Before designing any campaign, confirm:

| Input | Description |
|---|---|
| Campaign type | ABM / Outbound / Event / Lifecycle / Customer |
| Target | Named account / Industry segment / Persona segment |
| Goal | Meeting booked / Event RSVP / Content engagement / Expansion |
| Sender tier | SDR / AE / Exec / Multiple (see Section 4) |
| Timeline | How many weeks is this campaign designed for? |
| Account intelligence | Has an ABM brief been run? (required for ABM type) |
| Assets available | Microsite live? Case study approved? Event details confirmed? |

---

## Section 3: Campaign Type Blueprints

### Type A — ABM Campaign (Named Account)
```
Purpose: Drive a meeting with a specific target account
Duration: 4–6 weeks
Channels: Email (primary) + LinkedIn (parallel) + Microsite (anchor)
Sender:   AE or Exec leads; SDR supports on volume follow-up

WEEK 1:   Microsite goes live (developer deploys)
          Email Touch 1 sent by AE — Observation open (no Teqfocus mention)
          LinkedIn Connection Request sent same day

WEEK 2:   LinkedIn Message 1 (if connected) — microsite link + question
          Email Touch 2 — Problem frame + microsite link

WEEK 3:   Email Touch 3 — Proof + named case study + meeting ask
          LinkedIn Message 2 — follow-up if no email reply

WEEK 4:   Email Touch 4 — Differentiator + specific CTA
          (If no response: SDR phone call attempt)

WEEK 5–6: Email Touch 5 — Break-up
          LinkedIn Message 3 — final touch
```

### Type B — Outbound Prospecting (Contact-Level)
```
Purpose: Book a first meeting with a cold or warm contact
Duration: 3–4 weeks
Channels: Email (primary) + LinkedIn (parallel) + Phone (optional)
Sender:   SDR for cold; AE for warm/referred

WEEK 1:   Email Touch 1 — Personalized observation open
          LinkedIn Connection Request

WEEK 2:   Email Touch 2 — Problem frame
          LinkedIn Message 1 (if connected)
          (SDR) Phone attempt Day 8

WEEK 3:   Email Touch 3 — Proof + meeting ask
          LinkedIn Message 2

WEEK 4:   Email Touch 4 — Break-up
          (AE) Personal follow-up if SDR got engagement but no meeting
```

### Type C — Event Campaign (CXO Dinner / Dreamforce / Conference)
```
Purpose: Fill event seats with qualified senior buyers
Duration: 6–8 weeks pre-event + 2 weeks post
Channels: Email + LinkedIn + Personal invite (AE/Exec)
Sender:   Exec or named senior person for VIP invites; SDR for general

PRE-EVENT:
  Week 1–2:  Event microsite live
             Email Invite 1 — Save the date (theme hook, no logistics)
             LinkedIn post (thought leadership angle on event theme)
  Week 3–4:  Email Invite 2 — Details + speaker/topic + social proof
             SDR/AE personal LinkedIn invites to named targets
  Week 5–6:  Email Invite 3 — Last chance + capacity framing
             Personal phone/email from exec to VIP targets

EVENT WEEK: Day-of reminder email

POST-EVENT (within 48h):
  Attendee follow-up sequence (3 touches)
  No-show follow-up sequence (2 touches)
  VIP 1:1 personal follow-up (exec-written)
```

### Type D — Lifecycle / Nurture Campaign
```
Purpose: Move a prospect from one funnel stage to the next
Duration: 3–6 weeks per stage
Channels: Email (primary) + LinkedIn organic (supporting)
Sender:   Marketing for broad; AE for late-stage

AWARENESS → CONSIDERATION:
  Email 1: Industry insight (no pitch)
  Email 2: Framework / how to think about the problem
  LinkedIn: 2 organic posts on the same theme (company page)
  Email 3: Case study reference + soft CTA

CONSIDERATION → DECISION:
  Email 1: Competitive differentiation framing
  Email 2: Specific outcome story from named customer
  Email 3: Low-risk first-step proposal (workshop / review)
```

---

## Section 4: Sender Tier Strategy

Every campaign asset must be assigned a sender. Different senders = different tone.

| Sender | Volume | Tone | When to Use |
|---|---|---|---|
| **SDR / BDR** | High (50–200 contacts) | Research-personalized but templated | Cold outbound, Tier 2/3 accounts, event general invites |
| **AE / Account Owner** | Medium (10–50 contacts) | Personally written, account-specific | Tier 1 ABM, warm follow-up, post-event VIP |
| **Exec / GTM Leader** | Low (1–10 contacts) | Executive peer-to-peer | CXO targets, stuck deals, VIP event invites, partner intros |

**The escalation rule:** Start with the appropriate tier. If a contact engages
(opens, clicks, replies) but doesn't book — escalate one tier.
SDR engagement + no meeting → AE personal follow-up.
AE engagement + no meeting → Exec 1:1 note.

**Multi-sender campaigns:** For Tier 1 ABM accounts, design a coordinated
campaign where:
- SDR handles early email touches and LinkedIn volume
- AE owns Touch 3 onwards (proof + meeting ask)
- Exec sends the microsite launch email and VIP event invite

---

## Section 5: A/B Variant Design

For any campaign with 20+ contacts, define at least one A/B test.

### What to Test (Priority Order)
1. **Subject line** — highest leverage, easiest to test
2. **Email 1 hook angle** — industry observation vs. named problem vs. question
3. **CTA type** — named meeting type vs. open-ended question
4. **Sender name** — AE name vs. Exec name (for high-value segments)

### Variant Naming Convention
```
Campaign: [Account/Segment Name]
Variant A: [Control — default approach]
Variant B: [Test — single variable changed, clearly named]

Example:
  Variant A subject: "The data problem blocking most healthcare AI rollouts"
  Variant B subject: "Apollo Hospitals — a different perspective"
  Test variable: Generic industry hook vs. named account hook
```

### When NOT to A/B Test
- Tier 1 named accounts (too small a sample)
- Event campaigns with <50 invitees
- Executive-sender campaigns (too personal — testing undermines authenticity)

---

## Section 6: Campaign Brief Output Format

After designing a campaign, output this brief to hand to downstream skills:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TEQFOCUS CAMPAIGN BRIEF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CAMPAIGN NAME:   [Name]
TYPE:            [ABM / Outbound / Event / Lifecycle]
TARGET:          [Named account / Segment]
GOAL:            [Meeting / RSVP / Engagement]
TIMELINE:        [Start → End]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ARC SUMMARY:
[Week-by-week: channel + touch + sender]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ASSETS NEEDED:
[ ] Microsite (abm-microsite skill)
[ ] Email sequence (demand-gen skill)
[ ] LinkedIn sequence (linkedin-campaigns skill)
[ ] Sales asset: [type] (sales-enablement skill)
[ ] Event assets (events-engine skill)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SENDER ASSIGNMENTS:
Touch 1–2: [Sender tier]
Touch 3–4: [Sender tier]
Touch 5+:  [Sender tier]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
A/B TEST:
Variable: [What's being tested]
Variant A: [Control]
Variant B: [Test]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ACCOUNT INTELLIGENCE SOURCE:
[Link to ABM brief or "Tier 3 — no brief needed"]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Section 6: Channel Selection Framework

Structure every Teqfocus campaign across three channel types:

### Owned Channels (full control — always anchor here)
- Email sequences via HubSpot
- teqfocus.com pages and ABM microsites
- LinkedIn company page and personal profiles
- TeqTalk podcast and newsletter

**Rule:** Every campaign must drive back to an owned channel.
Borrowed and paid channels are amplifiers — owned channels convert.

### Earned / Borrowed Channels (amplify owned)
- Salesforce partner co-marketing (leverage their audience)
- Snowflake partner ecosystem
- Salesforce AppExchange listing traffic
- LinkedIn organic reach from Andy + AE advocacy posts
- CXO dinner community (East Bay CXO)

**Rule:** Use borrowed channels to reach new audiences.
Always capture contact info to convert borrowed attention into owned relationships.

### Paid Channels (not currently active — plan for future)
- LinkedIn Sponsored Content (when ready)
- Google Ads (branded + competitor terms)
- Retargeting (website visitors)

**Current Teqfocus status:** Primarily owned + earned. Paid is not active.
Do not build campaign plans that depend on paid until confirmed with team.

---

## Section 7: Multi-Touch Attribution Model

For every campaign, assign touches to understand what drove pipeline:

**Attribution model:** First touch + last touch + assist credit

| Touch type | Attribution |
|---|---|
| First touch (how they found Teqfocus) | 40% credit |
| Last touch (what converted them) | 40% credit |
| Assist touches (what kept them warm) | 20% shared credit |

**Track in HubSpot using UTM parameters on every campaign link.**
See analytics-tracking skill for full UTM system and setup.

**Minimum tracking per campaign:**
- Source of every inbound lead
- Which asset/page triggered the conversion
- Time from first touch to meeting booked
- Number of touches before meeting booked (average across pipeline)

---

## Section 8: Campaign Launch Momentum Framework

Structure campaign launch in three phases to build compounding momentum:

**Pre-launch (week before):** Warm the audience
- Teaser content on LinkedIn (Andy or Avi personal posts)
- Internal briefing to AEs — what's coming, what to say
- Partner notification if co-marketing involved

**Launch week:** Maximum concentration
- Day 1: Announcement post (company page + CEO personal)
- Day 2: Email to relevant segment
- Day 3: Employee advocacy posts (AEs, practice leads)
- Day 5: Partner amplification (Salesforce AE share)

**Post-launch (weeks 2–4):** Sustain and convert
- Week 2: Deep-dive content (blog, carousel, video)
- Week 3: Case study or proof reinforcement
- Week 4: CTA amplification — direct push to book

---

## Audience Execution — Clay-Engine Integration

This skill = defines audiences and campaign arcs (strategy layer).
**clay-engine** = builds, enriches, and syncs those audiences (execution layer).

| Campaign-designer decides | Clay-engine executes |
|---|---|
| Audience definition (ICP, tier, vertical) | `clay-engine/abm.md` — enrichment + tier assignment |
| LinkedIn Ads audience | `clay-engine/ads-audiences.md` — LinkedIn/Meta sync |
| Signal-based trigger strategy | `clay-engine/abm.md` — intent signal scoring |
| Attribution model | `analytics-tracking` — UTM + HubSpot attribution setup |
