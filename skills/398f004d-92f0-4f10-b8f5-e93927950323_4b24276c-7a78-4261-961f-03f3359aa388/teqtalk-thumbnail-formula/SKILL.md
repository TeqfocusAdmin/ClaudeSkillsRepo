---
name: teqtalk-thumbnail-formula
description: >
  TeqTalk production skill. Use when episode theme and guest are confirmed — ideally
  before recording so the right frame can be captured. Produces 3 thumbnail concept
  variants (Type A: Dynamic Two-Shot, Type B: Guest Close-Up, Type C: Split with Text),
  each with expression direction, text overlay (5 words max), background colour spec,
  and A/B test logic. Includes the mobile-size check and swap trigger protocol.
  Runs a 4-iteration refinement loop. Based on THUMBNAIL_FORMULA.md system.
---

# Skill: teqtalk-thumbnail-formula
## Stage 5 — Publishing | Thumbnail Design Brief

Read: `framework/THUMBNAIL_FORMULA.md` · `framework/TITLE_FORMULA.md`

---

## Input Required

```
EPISODE TITLE (working): [Title]
GUEST NAME + TITLE: [Details]
CORE EPISODE TENSION: [The single most provocative thing in the episode]
TARGET EMOTION: [Surprise / Intensity / Curiosity / Urgency]
BEST PHYSICAL FRAME AVAILABLE: [Description of best moment to freeze-frame OR "need to stage shoot"]
```

---

## The 4-Iteration Loop

### Pass 1 — Three Variant Concepts
Build all 3 thumbnail types. Score each on the 5-element formula (Face / Text / Contrast / Emotion / Brand).

### Pass 2 — Mobile Size Test
Describe each variant at 120×68px. Is the face readable? Is the text legible? Is the dominant emotion visible? Fail anything that doesn't pass.

### Pass 3 — Competitive Benchmark
Compare to top-performing thumbnails in the technical podcast space. Is this as bold as Diary of a CEO? As clear as Lex Fridman? As instantly recognisable as the brand builds over 50+ episodes?

### Pass 4 — Swap Protocol
Define the exact CTR trigger for swapping thumbnails and the order of variants to test.

---

## Output: Thumbnail Brief (see THUMBNAIL_FORMULA.md for full spec)

```
THUMBNAIL BRIEF — EP[N]: [Title]
[Complete 3-variant brief per THUMBNAIL_FORMULA.md]
[A/B test order + swap trigger]
[Adobe Photoshop specs]
```

---
---
name: teqtalk-title-formula
description: >
  TeqTalk's title engineering skill — the highest CTR lever in the system. Use when
  episode theme is confirmed and transcript is partially or fully available. Produces
  5 title candidates ranked by the 4-variable scoring system (Specificity / Audience
  identity / Stakes / Curiosity gap), with the recommended primary and 2 A/B test
  options. Also produces LinkedIn caption opener variant and Reel/Shorts text variant
  for each title. Runs a mandatory 4-iteration refinement loop. Never use guest name
  as primary title. Trigger for every episode.
---

# Skill: teqtalk-title-formula
## Stage 5 — Publishing | Title Engineering

Read: `framework/TITLE_FORMULA.md` · `framework/AUDIENCE_INTEL.md`

---

## Input Required

```
EPISODE THEME: [Core topic or tension]
GUEST NAME + ROLE: [Details]
THE WOW MOMENT: [The single most counterintuitive or surprising exchange]
TARGET PERSONA: [Primary CXO type]
INDUSTRY ANGLE (if specific): [Healthcare / FinServ / etc. or General]
PRIMARY SEARCH TERM TO TARGET: [If known]
```

---

## The 4-Iteration Loop

### Pass 1 — 5 Title Candidates
Write 5 titles using the 5-pattern system from TITLE_FORMULA.md. Score each.

### Pass 2 — Scoring Review
Run the 4-variable scoring system on all 5. Rewrite any scoring below 8/12. At least 2 titles must score 10+.

### Pass 3 — Audience Filter
Read each title from the perspective of a CDO scrolling LinkedIn at 8pm. Which one makes them stop? Which one makes them think "that's about me"? Reorder ranking accordingly.

### Pass 4 — Platform Adaptation
Write the LinkedIn opener variant and Reel text variant for the top 2 titles.

---

## Output Structure

```
══════════════════════════════════════
TITLE BRIEF — EP[N]: [Guest Name + Theme]
══════════════════════════════════════

TITLE 1 (Pattern [1-5] — [Pattern name])
YouTube: "[Title]"
Score: [X/12] | Specificity: [X/3] | Audience: [X/3] | Stakes: [X/3] | Curiosity: [X/3]
LinkedIn opener: "[First line variant — statement not question]"
Reel text: "[5 words max]"

[Repeat for Titles 2–5]

══════════════════════════════════════
RECOMMENDATION
PRIMARY TITLE: Title [N] — [Title]
Reason: [Why this scores highest for this specific episode]

A/B TEST: Upload Title [N] and Title [N] as YouTube thumbnail+title test variants
Expected performance: [CTR hypothesis]

BANNED FOR THIS EPISODE: [Any title constructions that would underperform for this guest/topic]
══════════════════════════════════════
```

---
---
name: teqtalk-platform-publishing
description: >
  TeqTalk publishing skill. Use when all assets are approved and the episode is ready
  to go live. Produces complete platform-native copy for all 5 distribution channels:
  YouTube (title, description, chapters, tags, category), LinkedIn (caption, hashtags,
  first comment), Spotify (episode title, description), Apple Podcasts (title, summary),
  and Teqfocus.com (if episode is published on website). Also produces the publish
  checklist. Runs a 4-iteration refinement loop.
---

# Skill: teqtalk-platform-publishing
## Stage 5 — Publishing | All Platform Copy

Read: `framework/BRAND_VOICE.md` · Title brief and thumbnail brief for this episode

---

## Input Required

```
APPROVED TITLE: [From title-formula output]
EPISODE NUMBER: [N]
GUEST NAME + TITLE + COMPANY: [Details]
EPISODE DURATION: [X minutes]
CHAPTERS: [From Adobe cut brief]
PUBLISH DATE: [Date]
EPISODE LINK: [URL — TBD if not live yet]
```

---

## Output Structure

```
══════════════════════════════════════
PLATFORM PUBLISHING BRIEF — EP[N]
Guest: [Name] | Publish: [Date]
══════════════════════════════════════

YOUTUBE

Title: [Approved title — 60 chars max]
Episode number tag: EP[N] | [Guest Name] | [Year] — for internal tracking only, 
                    do NOT include in the public title unless it aids SEO

Description (first 125 chars — visible before "Show more"):
[Hook — the most compelling sentence about this episode]

Full description:
[150–300 words]
[What this episode is about — 2 sentences]
[3 bullet points: what the viewer will learn]
[Guest bio — 2 sentences]
[Episode chapters]
[CTA: Subscribe / follow / website]
[Teqfocus.com link]
[Guest's LinkedIn — with permission]
[TeqTalk playlist link]

Chapters:
00:00 [Chapter 1]
[MM:SS] [Chapter 2]
[Continue]

Tags (15 max — mix of broad and specific):
[Tags list — include: guest name, episode topic, AI/data/transformation terms, 
industry terms, "TeqTalk", "Jas Kaur", Teqfocus]

Category: Education (primary) or Science & Technology

──────────────────────────────────────
LINKEDIN

Post caption: [Full post — from asset-pack LinkedIn Post 1 or episode-specific version]
Hashtags (end of post, max 5):
#[Tag1] #[Tag2] #[Tag3] #[Tag4] #[Tag5]

First comment (within 1 hour of posting — boosts algorithm):
"[Timestamp guide: The moment at [MM:SS] where [Guest] says [provocative thing] 
is worth the full watch.]"

──────────────────────────────────────
SPOTIFY

Episode title: [Same as YouTube or variation — Spotify search is different]
Episode description (250 words max):
[Conversational, direct, podcast-native tone]
[What the conversation covers]
[Guest introduction]
[3 key topics]
[CTA]

──────────────────────────────────────
APPLE PODCASTS

Title: [Same as Spotify]
Summary (4000 chars max — but write 300 words; this is the search-visible version):
[More formal than Spotify — Apple audience skews older/more professional]
[Full episode description with keywords]

──────────────────────────────────────
PUBLISH CHECKLIST

PRE-PUBLISH
□ Trailer published (YouTube + LinkedIn + Reel) — 24–48 hours before
□ Thumbnail uploaded and A/B variants ready
□ Title confirmed (approved version + A/B test versions uploaded)
□ Description and chapters formatted
□ All tags added
□ End screen set (subscribe + 2 recommended episodes)
□ Cards added (mid-episode — subscribe CTA at 20% and 80% mark)
□ Episode added to TeqTalk playlist

PUBLISH DAY
□ Full episode published (YouTube)
□ LinkedIn post published + first comment added within 1 hour
□ Spotify + Apple syndicated (automatic if RSS connected, manual otherwise)
□ Clip 1 (Wow Moment) published to YouTube + LinkedIn
□ YouTube ad campaign activated (teqtalk-youtube-ads brief ready)

POST-PUBLISH (48 hours)
□ CTR checked — below 6% triggers thumbnail swap
□ First comment responses added by Jas
□ LinkedIn post engagement responded to
□ Episode performance logged in EPISODE_ARCHIVE.md

══════════════════════════════════════
```

---
---
name: teqtalk-youtube-ads
description: >
  TeqTalk paid promotion skill. Use when a new episode is live on YouTube. Produces
  the complete YouTube paid promotion brief: 15-second and 30-second TrueView ad scripts,
  audience targeting list (job titles, interests, keywords), budget allocation logic
  per campaign goal (subscribers vs views vs website traffic), and campaign setup
  checklist for Google Ads. Budget default: $200–$400 per episode in the first 30 days.
  Requires Jas approval before spend activates. Runs a 4-iteration refinement loop
  on the ad scripts only.
---

# Skill: teqtalk-youtube-ads
## Stage 5 — Publishing | YouTube Paid Promotion Brief

---

## What This Skill Produces

A complete campaign brief Jas takes directly into Google Ads. No agency needed. No guesswork. The ad scripts are tight, the targeting is specific, and the budget logic is clear.

---

## Input Required

```
EPISODE TITLE: [Approved title]
EPISODE URL: [YouTube link]
PRIMARY AUDIENCE: [CXO type — CIO/CDO/CTO/Transformation/Healthcare]
CAMPAIGN GOAL: [Subscribers / Views / Website traffic to teqfocus.com]
BUDGET: [$200 / $300 / $400 for the 30-day campaign]
```

---

## The 4-Iteration Loop (ad scripts only)

### Pass 1 — Draft both ad scripts (15s + 30s)
### Pass 2 — Hook test: Does the first 5 seconds earn the skip? (most viewers skip at 5s)
### Pass 3 — CXO relevance check: Would a CDO pause to watch the first 5 seconds?
### Pass 4 — CTA optimisation: Is the action clear and frictionless?

---

## Output Structure

```
══════════════════════════════════════
YOUTUBE AD CAMPAIGN BRIEF — EP[N]
Goal: [Subscribers / Views / Traffic]
Budget: $[X] over 30 days
══════════════════════════════════════

AD SCRIPTS

15-SECOND SKIPPABLE AD (TrueView In-Stream)
[First 5 seconds must earn the skip — viewer can skip after second 5]
[0–5s]: "[Hook — the provocation. Must earn attention before the skip button."]
[5–12s]: "[The insight or value prop]"
[12–15s]: "[CTA — one action]"

30-SECOND SKIPPABLE AD
[0–5s]: "[Same hook or sharper variant]"
[5–20s]: "[Expand the stakes + deliver the surprising insight]"
[20–28s]: "[Social proof — 50K subscribers / X episodes / enterprise leaders]"
[28–30s]: "[CTA]"

──────────────────────────────────────
TARGETING

Job title targeting (Google Ads — Job Title layer):
• Chief Information Officer, CIO
• Chief Technology Officer, CTO
• Chief Data Officer, CDO
• VP of Data / Head of Data
• VP of Digital Transformation
• Chief Digital Officer
• Director of AI / Head of AI
• Chief Medical Information Officer (for healthcare episodes)

Interest targeting:
• Business Technology
• Enterprise Software
• Artificial Intelligence
• Cloud Computing
• Data Analytics
• Digital Transformation

Keyword targeting (for Discovery ads):
[Episode-specific keywords + channel keywords]
• teqtalk podcast
• [Guest name]
• [Episode topic keywords]
• enterprise AI strategy
• CDO leadership / CTO podcast
• [Industry keyword if episode is industry-specific]

Company size: 500+ employees (if targeting option available)
Geography: United States, United Kingdom, Canada, Australia, India (adjust per episode)

Placement exclusions:
• Children's content
• Sensitive categories
• Non-English content (unless targeting non-English markets)

──────────────────────────────────────
BUDGET ALLOCATION

Total 30-day budget: $[X]

Week 1 (launch): $[X × 50%] — heaviest spend in launch window
  Rationale: Early view velocity is the strongest algorithm signal. 
  Concentrate spend in first 7 days.

Week 2: $[X × 25%]
  Continue distribution, optimise targeting based on Week 1 performance

Weeks 3–4: $[X × 25%]
  Sustain visibility, retarget viewers who watched >50% of the episode

──────────────────────────────────────
CAMPAIGN SETUP CHECKLIST (Google Ads)

□ Campaign type: Video campaign
□ Campaign goal: Brand awareness and reach (for subscribers) / Product and brand 
  consideration (for views)
□ Video ad format: Skippable in-stream
□ Bid strategy: Maximum CPV (cost per view) — start at $0.04–0.06
□ Ad group targeting: Job title + Interest + Keyword (combine for precision)
□ Upload both 15s and 30s versions — Google tests and serves the better performer
□ Frequency cap: 3 impressions per user per 7 days (avoid fatigue)
□ Device: All (mobile performance is critical — YouTube is 70%+ mobile)
□ Custom thumbnail: Upload the A/B test winner as the ad thumbnail
□ Call to action overlay: "Subscribe" or "Watch Now"
□ Companion banner: Auto-generated from channel

PERFORMANCE THRESHOLDS
• View rate below 15%: Swap the ad script
• CTR below 0.5%: Adjust targeting
• Cost per subscriber above $3: Reduce bid, refine targeting
• Day 3 check: Is the organic:paid view ratio improving? (Good sign = algorithm pick-up)

══════════════════════════════════════
```

---
---
name: teqtalk-performance-review
description: >
  TeqTalk analytics skill. Use at Day 7 and Day 30 after episode publication. Produces
  the full episode retrospective: per-metric scorecard against targets, what worked
  and why, what failed and the hypothesis, 3 actions for the next episode, and an
  update to the title/thumbnail/clip pattern library. Also flags any clips or trailers
  that should be boosted or retitled. Feeds directly into the next episode's
  teqtalk-guest-brief and teqtalk-title-formula. No iteration loop — this is analysis.
---

# Skill: teqtalk-performance-review
## Stage 5 — Publishing | Episode Retrospective

Read: `framework/METRICS_COCKPIT.md`

---

## Input Required

```
EPISODE NUMBER + TITLE: [Details]
DATE OF REVIEW: [Day 7 or Day 30]
YOUTUBE ANALYTICS DATA: [Paste from YouTube Studio — CTR, AVD, views, subscribers]
LINKEDIN DATA: [Views, engagement rate, clicks on episode posts]
CLIP PERFORMANCE: [Each clip's views and CTR]
TRAILER PERFORMANCE: [Views, completion rate]
```

---

## Output Structure

```
══════════════════════════════════════
PERFORMANCE REVIEW — EP[N]
[Day 7 / Day 30] Review | [Date]
══════════════════════════════════════

SCORECARD
[Full metrics table against targets from METRICS_COCKPIT.md]
[Green / Amber / Red for each metric]

WHAT WORKED
[Specific elements — title pattern, thumbnail variant, clip type, opening structure]
[Evidence from the data — not opinions]

WHAT DIDN'T WORK
[Specific failures with hypotheses — not excuses]
[What to test differently]

BEST PERFORMING CLIP
[Title + views + what made it work]

ACTIONS FOR NEXT EPISODE
1. [Title: what to change or double down on]
2. [Thumbnail: what adjustment]
3. [Opening structure / clip selection: what to change]

PATTERN LIBRARY UPDATE
Title that worked: [Title] — [Performance]
Title that failed: [Title] — [Performance]
Thumbnail type that won: [Type + description]
Clip type that outperformed: [Type + why]

══════════════════════════════════════
```
