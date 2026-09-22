---
name: teqtalk-catalogue-recut
description: >
  TeqTalk back-catalogue activation skill. Use when a list of 5+ past episodes is
  provided. Mines the archive for underperforming episodes with strong content that
  can be unlocked with new titles and thumbnails. Produces: priority ranking of
  episodes to recut, new title and thumbnail direction for each, 2 new clip cuts per
  episode, and a relaunch schedule. Based on the principle that updating titles and
  thumbnails on old videos can move a 2,000-view episode to 40,000+ views. Runs a
  4-iteration refinement loop on titles.
---

# Skill: teqtalk-catalogue-recut
## Stage 6 — Back-Catalogue Activation

Read: `framework/TITLE_FORMULA.md` · `framework/THUMBNAIL_FORMULA.md` · `framework/METRICS_COCKPIT.md`

---

## What This Skill Produces

A prioritised recut plan for past TeqTalk episodes. New titles. New thumbnails. 2 new clips per episode. A relaunch schedule. Zero new recording required.

**The research basis:** Podcast producers who updated back-catalogue titles and thumbnails with new formulas saw 2,000-view videos jump to 40,000+ views. The content was always good. The packaging wasn't. This skill re-packages existing gold.

---

## Input Required

```
EPISODE LIST: [Title, YouTube URL, current views, publish date for each]
TIME AVAILABLE FOR RECUTS: [Hours per week]
PRIORITY: [Traffic volume / Subscriber conversion / Specific industry focus]
```

---

## The Prioritisation Framework

Score each episode on 3 variables:

| Variable | Score 1 | Score 2 | Score 3 |
|---|---|---|---|
| Content quality | Generic topic | Strong topic | Unique, timely topic |
| Current CTR vs potential | Above 6% (already working) | 4–6% (fixable) | Below 4% (high opportunity) |
| Guest seniority | Mid-level | Senior | C-suite / well-known |

**Priority = Content quality 3 + CTR potential 3 + Guest seniority 2+ = recut first**

---

## The 4-Iteration Loop (titles only)

### Pass 1 — New titles for all prioritised episodes
### Pass 2 — Score all against title formula
### Pass 3 — CXO audience filter
### Pass 4 — SEO alignment (ensure search terms are captured in new titles)

---

## Output Structure

```
══════════════════════════════════════
CATALOGUE RECUT PLAN
[X] episodes reviewed | [Y] priority recuts identified
══════════════════════════════════════

PRIORITY TIER 1 — RECUT IMMEDIATELY
(Highest content quality + worst current CTR)

EPISODE: [Title + URL + current views + publish date]
Priority score: [X/9]
Why this episode: [Content quality + opportunity analysis]

NEW TITLE OPTIONS (scored):
1. "[Title]" — Score: [X/12]
2. "[Title]" — Score: [X/12]
Recommended: [Title N] — [Reason]

THUMBNAIL DIRECTION:
[Brief direction — Type A/B/C + expression + text overlay]

NEW CLIPS TO CUT:
Clip 1: [Timestamp + brief + suggested title]
Clip 2: [Timestamp + brief + suggested title]

RELAUNCH STRATEGY:
Publish clips on: [Day 1 and Day 4 of relaunch week]
LinkedIn post: [Use asset-pack Post format — frame as "In case you missed..."]
YouTube Community post: Link to episode with the new angle

──────────────────────────────────────
[REPEAT FOR ALL PRIORITY TIER 1 EPISODES]

══════════════════════════════════════
PRIORITY TIER 2 — RECUT THIS MONTH
[Shorter format — title, thumbnail direction, 1 new clip each]

PRIORITY TIER 3 — MONITOR
[Low priority — note for future]

══════════════════════════════════════
RELAUNCH SCHEDULE

Week 1: [Episode A recut + clip deployment]
Week 2: [Episode B recut + clip deployment]
[Continue]

EXPECTED IMPACT: [View projection based on title/thumbnail improvement data]
══════════════════════════════════════
```

---
---
name: teqtalk-master
description: >
  TeqTalk master coordination skill. Use for any TeqTalk-related task that doesn't
  clearly match one of the 16 specific skills — or when coordinating multiple skills
  in a single session. Also use when the user asks "what skill should I use?" or
  "how do I run the production system?" This skill reads the full system context
  and routes to the correct skill, or orchestrates multiple skills in the right
  sequence for the task described. Always reads TEQTALK_SYSTEM.md before responding.
---

# Skill: teqtalk-master
## Master Coordination + Routing

Read: `instructions/TEQTALK_SYSTEM.md` · All framework documents as needed

---

## What This Skill Does

Routes any TeqTalk task to the correct skill. Coordinates multi-skill sequences. Answers questions about the production system. Never produces content from memory — always confirms which skill is appropriate first.

---

## Routing Logic

| User says... | Route to skill |
|---|---|
| "I have a new guest — [Name]" | teqtalk-guest-brief |
| "Recording done, here's the transcript" | teqtalk-riverside-brief + teqtalk-transcript-trim (run in sequence) |
| "Need a trailer for the episode" | teqtalk-trailer-arc |
| "What clips should I cut?" | teqtalk-clip-engine |
| "Create all the social content" | teqtalk-asset-pack |
| "What should the title be?" | teqtalk-title-formula |
| "What thumbnail should I use?" | teqtalk-thumbnail-formula |
| "Ready to publish" | teqtalk-platform-publishing |
| "Set up YouTube ads" | teqtalk-youtube-ads |
| "How did the episode perform?" | teqtalk-performance-review |
| "Which old episodes should I recut?" | teqtalk-catalogue-recut |
| "Run the full production for this episode" | Run sequence: 08 → 07 → 09 → 10 → 11 → 12 → 13 |

---

## Full Episode Production Sequence

When a new transcript is provided and all production is needed:

```
Step 1: teqtalk-transcript-trim (flags 7 clips + extracts asset anchors)
Step 2: teqtalk-trailer-arc (builds 90s trailer — Jas approves)
Step 3: teqtalk-clip-engine (7 clips — Jas approves titles)
Step 4: teqtalk-title-formula (5 title options — Jas selects)
Step 5: teqtalk-thumbnail-formula (3 variants — Jas reviews)
Step 6: teqtalk-asset-pack (all 9 assets — runs to completion)
Step 7: teqtalk-platform-publishing (all platform copy)
Step 8: teqtalk-animation-handoff (animator brief)
[After publish:]
Step 9: teqtalk-youtube-ads (Jas approves before spend)
Step 10: teqtalk-performance-review (Day 7 + Day 30)
```

---

## System Health Check

When user asks "how is the system doing?" or "are we on track for 1M subs?":

Pull from `framework/METRICS_COCKPIT.md` and produce:
- Current subscriber velocity vs target
- CTR trend across last 5 episodes
- Best performing clip type
- Back-catalogue opportunity size
- Top 3 actions to accelerate growth

---

*TeqTalk Master Skill v2.0 — The coordination layer for the full 17-skill system.*
