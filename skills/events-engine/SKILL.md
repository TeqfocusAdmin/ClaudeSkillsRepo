---
name: events-engine
description: >
  Event campaign skill for Teqfocus. Use this skill whenever the user wants to
  design or produce any asset for a Teqfocus event — CXO Executive Dinners,
  Dreamforce 2025 meetups, Snowflake Summit 2026, third-party conference presence,
  webinars, or virtual events. Trigger when the user mentions: event campaign,
  event invite, CXO dinner, Happy Hour, Lunch and Learn, Executive Dinner,
  Dreamforce, Snowflake Summit, conference, webinar, RSVP campaign, event follow-up,
  pre-event campaign, or post-event sequence. This skill covers the full event
  campaign arc: pre-event invite campaign → event assets → post-event follow-up.
  Always use this skill for Teqfocus event work — do not attempt from demand-gen
  or content-strategist alone.
---

# Teqfocus Events Engine Skill

This skill governs all event campaign design and asset production for Teqfocus.
Teqfocus runs and participates in high-value, executive-level events — CXO dinners,
Dreamforce meetups, Snowflake Summit presence, and webinars. Every event campaign
must reflect this: we invite senior people to conversations worth having, not to
vendor pitches.

## How to Use This Skill

1. **Read this SKILL.md fully** before producing any event asset
2. **Identify the event type** → load the relevant reference file
3. **Confirm the intake** (Section 2) — ask if anything is missing
4. **Produce the full campaign arc** — pre, during, and post
5. **Flag any assets that need to be built by abm-microsite skill**

## Reference Files

| Event Type | Reference File |
|---|---|
| CXO Executive Dinner | `references/cxo-dinner.md` |
| Dreamforce 2025 Campaign | `references/dreamforce.md` |
| Snowflake Summit 2026 Campaign | `references/snowflake-summit.md` |
| Third-Party Conference Presence | `references/conference.md` |
| Webinar / Virtual Event | `references/webinar.md` |
| Post-Event Follow-Up (all types) | `references/post-event.md` |

---

## Section 1: Teqfocus Event Philosophy

Teqfocus events are not trade show booths. They are not vendor pitches.
They are executive peer-to-peer conversations hosted by Teqfocus.

**The 3 things that make a Teqfocus event work:**
1. **The room:** The right people — CIOs, CDOs, VP Sales from target accounts
2. **The conversation:** A theme sharp enough that people remember the discussion,
   not the sponsor
3. **The follow-up:** A reason to continue the conversation that started in the room

**What Teqfocus events are NOT:**
- Product demos or platform showcases
- "Teqfocus presents" talking-head presentations
- Generic networking happy hours with a Teqfocus banner
- Vendor booth presence at a conference

**What every event campaign asset must do:**
- Make the invite feel exclusive and earned — not mass-distributed
- Lead with the theme/conversation — not Teqfocus's name
- Give the recipient a reason to RSVP that is about THEM, not about Teqfocus

---

## Section 2: Event Campaign Intake

| Input | Required? |
|---|---|
| Event type | ✅ |
| Event name / theme | ✅ |
| Date + location (or virtual) | ✅ |
| Target audience: personas + industries | ✅ |
| Capacity + invite-only or open | ✅ |
| Speakers / guests of honor | Optional |
| Partner involvement (Salesforce, Snowflake) | Optional |
| RSVP link / event microsite URL | ✅ |
| Named VIP targets for personal invites | Optional |
| Pre-event timeline (weeks before) | ✅ |

---

## Section 3: Event Types — Quick Reference

### CXO Executive Dinner
```
Format:     Invite-only, 15–25 guests, sit-down dinner
Audience:   CIOs, CDOs, VPs at Tier 1 target accounts
Theme:      A single sharp question or business challenge
Teqfocus role: Host and convener — not presenter
Campaign:   Personal invite-led (AE + Exec) with event microsite as anchor
Follow-up:  Highly personalized, 1:1 for all attendees
```

### Dreamforce 2025 (San Francisco)
```
Format:     Multiple Teqfocus-hosted side events during Dreamforce week
Types:      Happy Hour / Lunch & Learn / Executive Dinner / CXO Roundtable
Audience:   Salesforce ecosystem: customers, prospects, Salesforce AEs, partners
Theme:      AI operationalisation in enterprise — Teqfocus as the "how" answer
Campaign:   Multi-channel: Email + LinkedIn + Salesforce AE co-invite
Partner:    Coordinate with Salesforce AE team on shared account invites
Follow-up:  Segmented — by event type + engagement level
```

### Snowflake Summit 2026
```
Format:     Teqfocus presence at Snowflake's annual conference
Types:      Hosted dinner / Partner session / Booth presence
Audience:   Data leaders, CDOs, data engineering teams at target accounts
Theme:      From data platform to AI-ready architecture — the Teqfocus bridge
Campaign:   Email + LinkedIn + Snowflake partner co-marketing
Partner:    Coordinate with Snowflake partner team for co-hosted assets
Follow-up:  Data/AI-focused — CDO and data engineering personas
```

### Third-Party Conference Presence
```
Format:     Teqfocus sponsorship, speaking slot, or booth at industry conference
Types:      Varies by conference (healthcare, telecom, finserv, SaaS conferences)
Audience:   Conference attendees in target industry vertical
Campaign:   Pre-conference LinkedIn posts + targeted email to registered attendees
            (if list available) + post-conference follow-up
Follow-up:  Badge-scan follow-up + specific session reference
```

### Webinar / Virtual Event
```
Format:     Online, typically 45–60 minutes
Types:      Teqfocus-only / Co-hosted with Salesforce or Snowflake / Guest speaker
Audience:   Persona-specific (CDO webinar vs. CIO webinar)
Campaign:   Email invite sequence + LinkedIn organic + paid LinkedIn (optional)
Follow-up:  Attendee vs. no-show segmented sequences + recording link
```

---

## Section 4: Full Campaign Arc Template

Every event gets all three phases — pre, during, post.

### PRE-EVENT CAMPAIGN

**Phase 1: Awareness (6–8 weeks out)**
```
Asset 1:  Event microsite (→ hand to abm-microsite skill)
          URL: teqfocus.com/abm/[event-slug]

Asset 2:  Email Invite 1 — Save the Date
          Sender: AE or named senior person
          Hook: Theme/question, not event logistics
          CTA: "Reserve your seat" → microsite RSVP
          Subject formula: "An evening on [theme] — [City, Date]"

Asset 3:  LinkedIn Post (company page)
          Thought leadership angle on the event theme
          NOT "Join us for our event"
          CTA: "We're hosting a conversation on this — details →"

Asset 4:  LinkedIn Post (personal profile — AE or Exec)
          Why this conversation matters right now
          First-person observation on the theme
```

**Phase 2: Momentum (3–4 weeks out)**
```
Asset 5:  Email Invite 2 — Depth + Social Proof
          Sender: Same as Invite 1
          Add: Speaker/topic detail, who else is attending (if appropriate)
          CTA: RSVP link — create urgency (limited seats)
          Subject formula: "Who's coming to [event name] — [detail]"

Asset 6:  SDR/AE Personal LinkedIn DM
          To named target accounts not yet responded
          References the theme, not Teqfocus
          Max 3 sentences + RSVP link

Asset 7:  Partner Co-Invite (if Dreamforce or Snowflake Summit)
          Email template for Salesforce AE or Snowflake SE to forward
          to their joint accounts — positions Teqfocus as the convener
```

**Phase 3: Close (1–2 weeks out)**
```
Asset 8:  Email Invite 3 — Last Chance
          Sender: AE or Exec
          Capacity/exclusivity angle — not pressure
          Subject formula: "Last few seats — [event name]"

Asset 9:  Personal Phone/Email from Exec to VIP targets
          Not a template — a genuine personal note (Claude writes a
          personalized version per VIP, to be reviewed by exec)
```

**Event Week**
```
Asset 10: Day-before reminder email
          Subject: "Tomorrow — [event name] — [time + location]"
          Body: Logistics only (2 sentences) + what to expect

Asset 11: Day-of LinkedIn post (company page)
          Behind-the-scenes / "Tonight we're hosting..." angle
          Builds FOMO for those who aren't coming
```

### POST-EVENT CAMPAIGN

**Segment A — Attended (within 24 hours)**
```
Email 1 (Day 1): Personalized thank you
  Sender: AE who managed the relationship
  Reference: One specific thing from the conversation in the room
  CTA: Continue the conversation — meeting ask or resource

Email 2 (Day 5): Follow-up value
  A resource, case study, or insight that extends the event theme
  Connects to what was discussed — not generic content

Email 3 (Day 10): Meeting ask
  Specific CTA tied to their role and what came up in conversation
  Named meeting type: architecture review, data readiness session, etc.
```

**Segment B — Registered, Did Not Attend (within 48 hours)**
```
Email 1 (Day 2): "You missed it" — key insight summary
  2–3 sentences on what the conversation covered
  What attendees are taking away
  CTA: Book a 1:1 to cover the same ground

Email 2 (Day 8): Recording or recap resource (if available)
  Link to recap content
  Soft meeting ask
```

**Segment C — VIP / Tier 1 Account (personalized, not templated)**
```
Note from Exec or AE within 24 hours
  References the conversation specifically — 3–4 sentences
  Proposes a specific next step
  This is never templated — Claude writes a draft per VIP for review
```

---

## Section 5: Partner Event Assets

### Dreamforce — Salesforce AE Co-Invite Template
```
A short email for a Salesforce AE to send to a shared customer or prospect,
inviting them to a Teqfocus-hosted event at Dreamforce.

Tone: From the Salesforce AE, positioning Teqfocus as a trusted partner host
Length: 4 sentences max
Key message: "My colleagues at Teqfocus are hosting [event type] — given
what we've been discussing about [relevant topic], I thought you'd find it valuable."
```

### Snowflake Summit — Partner Co-Marketing Assets
```
LinkedIn post for joint Teqfocus + Snowflake presence
Email to shared prospects in Snowflake's network
Co-branded event page copy (→ abm-microsite skill with partner branding flag)
```

---

## Section 6: Event Campaign Naming Conventions

| Asset | Convention | Example |
|---|---|---|
| Event microsite slug | `[event-type]-[city]-[year]` | `cxo-dinner-mumbai-2025` |
| Event microsite slug (Dreamforce) | `dreamforce-[type]-2025` | `dreamforce-exec-dinner-2025` |
| Email campaign name | `[Event] — [Phase]` | `CXO Dinner Mumbai — Invite Phase 1` |
| LinkedIn post tag | `[Event Slug]` in post notes | For tracking which posts drove RSVPs |

---

## Section 7: East Bay CXO Newsletter

The East Bay CXO Newsletter is a short community newsletter for CXO dinner
attendees and invitees. Two purposes only: recap one moment from the last
dinner, announce the next one.

**Not** a thought leadership newsletter. **Not** a GTM campaign email.
A host keeping a community warm between conversations.

**Audience:** CIOs, CTOs, CDOs, VPs who have attended or been invited to
East Bay CXO dinners.

**Format:** 2 sections only — "From the Last Dinner" + "Coming Up: [Event]"

**Length:** 150–250 words total. Intentionally brief.

**Trigger:** Use `references/east-bay-cxo-newsletter.md` when asked to write
this newsletter.

### Intake:
```
EAST BAY CXO NEWSLETTER

MONTH:       [Month + Year]
LAST DINNER: [One key moment or insight — or "No prior event yet"]
NEXT EVENT:  [Name + theme + date + format + city]
CAPACITY:    [Seats / invite-only note]
RSVP:        [Link or "reply to email"]
```

---

## Section 8: VIP Invitation Sequence Timing

For Tier 1 CXO dinner invitations, the sequence below converts best:

**Week 3 before event:**
Touch 1 — AE personal LinkedIn DM (warm accounts only)
"[Name] — we're hosting a small CXO dinner in [city] on [date]. The topic is [specific theme]. Given [specific thing about their role/company], I thought you'd be a great fit. Would you be open to joining?"

**Week 2 before event:**
Touch 2 — Follow-up email from Andy Singh (if no response to DM)
Warmer tone, peer-to-peer: "I'll be there along with [N] other [CIOs/CDOs] from [relevant companies/industries]. The conversations are always off-the-record and honest."

**Week 1 before event:**
Touch 3 — Final confirmation or last-minute invitation for waitlist fills
Keep short: "Still 2 seats available for [date]. Worth an evening?"

**After RSVP:**
Confirmation email within 24 hours: date, time, location, what to expect, other attendees (if approved to share), who to contact with questions.

---

## Section 9: Event ROI Measurement

Track these metrics for every East Bay CXO dinner and major event:

**Immediate (within 1 week of event):**
- Total attendees vs target
- Tier 1 target accounts represented
- Salesforce/Snowflake partner contacts present
- Follow-up meetings booked (target: 1 per 5 attendees)

**Pipeline (within 90 days):**
- New opportunities created with event attendees
- Pipeline value influenced [VERIFY attribution in HubSpot]
- Deals closed where event was a recorded touch

**Community health (ongoing):**
- Return attendees from prior events
- Referrals from existing members to new attendees
- Newsletter open rate from community members

---

## Section 10: Post-Event Hot Lead Routing

Within 24 hours of every event, route attendees by engagement level:

**Tier A (direct AE conversation — same day):**
- Attendee who specifically asked for a follow-up meeting
- Attendee who shared a specific problem Teqfocus directly solves
- Attendee from a named Tier 1 target account

**Tier B (AE-personalized follow-up within 48 hours):**
- Attendee who engaged in conversation about Teqfocus's work
- Attendee from Tier 2 target account
- Attendee referred by a Salesforce/Snowflake AE

**Tier C (events-engine follow-up sequence within 72 hours):**
- All other attendees
- Standard post-event nurture: thank you + recap + upcoming event mention + CTA
