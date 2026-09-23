---
name: teqtalk-transcript-trim
description: >
  TeqTalk production skill. Use when a full transcript is available. Produces: a
  trimmed transcript with timestamps preserved, 7 key moment flags with clip briefs,
  and sections marked for removal. Never edits the substance of what was said — only
  marks sections for cutting. Also identifies the single wow moment, the best pull
  quote, and the anchor insight for asset production. Runs a 4-iteration refinement loop.
---

# Skill: teqtalk-transcript-trim
## Stage 3 — Trailer + Transcript | Transcript Processing

Read: `framework/AUDIENCE_INTEL.md`

---

## What This Skill Produces

1. A trimmed transcript (filler sections marked **[CUT]**, kept sections clean)
2. 7 key moment flags with clip potential ratings
3. The single wow moment identification
4. Asset production anchors (the insights that drive the 9-asset pack)

---

## Input Required

```
FULL TRANSCRIPT: [Paste with timestamps]
EPISODE NUMBER + GUEST: [Details]
TARGET EPISODE LENGTH: [X minutes]
```

---

## The 7 Clip Types (one of each per episode, minimum)

| Clip type | What to find | Why it performs |
|---|---|---|
| The Wow Moment | The counterintuitive or surprising exchange | Drives shares from peers |
| The Framework | Guest explains a model or decision approach | High save rate, practical value |
| The Failure Story | Specific thing that went wrong and why | Most relatable for CXO audience |
| The Prediction | Guest makes a specific, accountable forecast | Debate-generating, high comments |
| The Challenge | Jas pushes back and guest responds | Shows depth and credibility |
| The Stat | A number with context and consequence | LinkedIn carousel fodder |
| The Human Moment | Personal story, admission, or lesson learned | High share rate, builds loyalty |

---

## The 4-Iteration Loop

### Pass 1 — Draft Trim
Mark all sections for cutting: pre-show chat, restarts, dead air >3 seconds, tangents that don't serve the episode, overly long setup before a point.

### Pass 2 — Clip Identification
Find the 7 moments. Rate each on a 1–5 scale for clip potential. Write a one-sentence clip brief for each.

### Pass 3 — Asset Anchor Extraction
Identify: the single wow moment, the three best pull quotes, the core framework or model, the primary use case story, and the future outlook statement. These feed the asset pack.

### Pass 4 — Timestamp Verification
Confirm all timestamps are accurate. Ensure no clip moment was accidentally marked for cutting.

---

## Output Structure

```
══════════════════════════════════════
TRANSCRIPT TRIM BRIEF
TeqTalk EP[N]: [Guest Name]
Original length: [X min] | Target: [Y min]
══════════════════════════════════════

SECTIONS MARKED FOR CUTTING
**[CUT: 00:00:00–00:02:15 — pre-recording chat, not relevant]**
**[CUT: 00:18:30–00:19:00 — dead air, guest pausing to think]**
[Continue list — timestamp + reason for each cut]

══════════════════════════════════════
7 KEY MOMENTS — CLIP FLAGS

CLIP 1 — THE WOW MOMENT ⭐⭐⭐⭐⭐
Timestamp: [HH:MM:SS – HH:MM:SS]
Duration: [X seconds]
Clip brief: "[One sentence description of the exchange]"
Suggested clip title: "[Title option]"
Why it performs: [Specific reason — counterintuitive / stakes / specificity]

CLIP 2 — THE FRAMEWORK ⭐⭐⭐⭐
Timestamp: [HH:MM:SS – HH:MM:SS]
Duration: [X seconds]
Clip brief: "[One sentence]"
Suggested clip title: "[Title option]"

CLIP 3 — THE FAILURE STORY ⭐⭐⭐⭐⭐
[Same structure]

CLIP 4 — THE PREDICTION ⭐⭐⭐⭐
[Same structure]

CLIP 5 — THE CHALLENGE ⭐⭐⭐⭐
[Same structure]

CLIP 6 — THE STAT ⭐⭐⭐
[Same structure]

CLIP 7 — THE HUMAN MOMENT ⭐⭐⭐⭐
[Same structure]

══════════════════════════════════════
ASSET PRODUCTION ANCHORS

WOW MOMENT (for trailer and newsletter):
[Timestamp]: "[Exact or near-exact dialogue — the sharpest exchange]"

PULL QUOTES (for quote cards and social):
1. "[Quote under 15 words]" — [Guest Name]
2. "[Quote under 20 words]" — [Guest Name]  
3. "[Quote under 25 words — for newsletter]" — [Guest Name]

CORE FRAMEWORK/MODEL:
[Description of any model, framework, or decision approach the guest articulated]

PRIMARY USE CASE STORY:
[The specific real-world example from the episode — what happened, what it cost, what it taught]

FUTURE OUTLOOK STATEMENT:
[The guest's most specific prediction or forward-looking claim]

══════════════════════════════════════
TRIMMED TRANSCRIPT
[Full trimmed transcript with [CUT] sections removed — timestamps preserved]
══════════════════════════════════════
```

---
---
name: teqtalk-clip-engine
description: >
  TeqTalk's discovery engine skill. Use after transcript-trim is complete. Produces
  7 complete standalone clip briefs per episode — each with its own title (4-iteration
  tested), hook for the first 3 seconds, thumbnail direction, caption for LinkedIn/Reel,
  and scheduling slot. These 7 clips are the primary algorithm discovery mechanism for
  the full episode. Minimum 7 clips per episode, no exceptions. Runs a mandatory
  4-iteration refinement loop on all clip titles and hooks. This is the clip-volume
  system that drives the subscriber growth flywheel.
---

# Skill: teqtalk-clip-engine
## Stage 3 — Trailer + Transcript | 7-Clip Production System

Read: `framework/BRAND_VOICE.md` · `framework/TITLE_FORMULA.md` · `framework/THUMBNAIL_FORMULA.md`

---

## What This Skill Produces

7 complete clip briefs. Each clip is a standalone piece of content — not a teaser for the full episode, but a complete insight in 60–180 seconds. The clip's title and hook must make it worth watching even if the viewer never sees the full episode. That quality is what drives shares and subscriptions.

**The clip volume rule:** One full episode → 7 clips minimum → deployed over 7 days post-publish. The clips are the algorithm's discovery signal. The algorithm tests the clips with small audiences; strong performance triggers distribution of the full episode.

---

## Input Required

```
TRANSCRIPT TRIM BRIEF: [Paste — 7 clip flags already identified]
EPISODE NUMBER + TITLE: [Details]
GUEST NAME + TITLE + COMPANY: [Details]
FULL EPISODE PUBLISH DATE: [Date]
```

---

## Clip Scheduling System

| Day | Clip | Platform priority |
|---|---|---|
| Day -1 (before episode) | Trailer drops | YouTube + LinkedIn + Reel |
| Day 0 (episode publish) | Clip 1 — The Wow Moment | YouTube + LinkedIn |
| Day 1 | Clip 2 — The Framework | LinkedIn (carousel companion) |
| Day 2 | Clip 3 — The Failure Story | YouTube Reel / Instagram |
| Day 3 | Clip 4 — The Prediction | LinkedIn (debate-generating) |
| Day 4 | Clip 5 — The Challenge | YouTube |
| Day 5 | Clip 6 — The Stat | LinkedIn (carousel companion) |
| Day 6 | Clip 7 — The Human Moment | All platforms (end of cycle closer) |

---

## The 4-Iteration Loop

### Pass 1 — Draft 7 Clip Briefs
Write all 7 using the clip moments from transcript-trim. Title, hook, thumbnail direction, caption draft.

### Pass 2 — Title Scoring
Score every clip title against the 4-variable title scoring system from TITLE_FORMULA.md. Any title below 8/12 — rewrite.

### Pass 3 — Hook Quality Check
Every clip must earn attention in its first 3 seconds without relying on the viewer knowing who Jas or the guest is. Test: "If a CDO sees this clip cold, does the first sentence make them stay?" If no — rewrite the hook.

### Pass 4 — Platform Adaptation
Write the LinkedIn caption variant for each clip. Ensure the caption opener is a hook, not a description. Write the Reel version (30-second compressed) where applicable.

---

## Output Structure (repeated for each of 7 clips)

```
══════════════════════════════════════
CLIP [N] — [CLIP TYPE]
TeqTalk EP[X] | Deploy: Day [N] | [Platform priority]
══════════════════════════════════════

CONTENT
Source timestamp: [HH:MM:SS – HH:MM:SS]
Duration: [X seconds / minutes]
Clip type: [Wow Moment / Framework / Failure / Prediction / Challenge / Stat / Human]

TITLE (scored [X]/12)
Primary: "[Title — Pattern [1-5] from TITLE_FORMULA]"
A/B test: "[Alternative title]"
Title justification: [One sentence — why this scores highest for this clip]

HOOK (first 3 seconds — on-screen text or opening line)
"[Opening statement — must stand alone without context]"

THUMBNAIL DIRECTION
Expression: [Guest/Jas expression to capture]
Text: "[5 words max]"
Background: [Colour direction]
Variant to test: [Brief description of A/B]

LINKEDIN CAPTION
[First line = scroll-stopper — not a description]
[Lines 2–4 = the insight]
[Line 5 = question to the audience]
[CTA: "Full episode: [link]"]

REEL VERSION (30 seconds)
[Compressed version if this clip has Reel potential — which 30 seconds?]

SCHEDULING NOTE
Day [N] after episode publish
Best time to post: [Check METRICS_COCKPIT — post 30 min before peak audience activity]
Paid boost: [Yes/No — if yes, suggested budget and targeting]

══════════════════════════════════════
```
