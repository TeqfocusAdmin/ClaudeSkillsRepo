---
name: teqtalk-riverside-brief
description: >
  TeqTalk editing skill. Use immediately after recording is complete in Riverside.
  Produces the Riverside-specific export and first-cut brief: which tracks to keep,
  top-and-tail timestamps, dead air and filler sections to cut, and export settings
  for handoff to Adobe. Designed so Jas can action it herself without re-listening
  to the full recording. Runs a 4-iteration refinement loop.
---

# Skill: teqtalk-riverside-brief
## Stage 2 — Recording + Editing | Riverside Export Brief

---

## What This Skill Produces

A precise, actionable Riverside editing brief. Jas runs through it once from top to bottom and the export is ready for Adobe. No re-listening to decide what to cut.

---

## Input Required

```
TRANSCRIPT OR ROUGH NOTES: [Paste transcript or summary notes]
TOTAL RECORDING LENGTH: [HH:MM:SS]
GUEST NAME: [Name]
ANY KNOWN ISSUES: [Audio problems, restarts, off-record sections]
```

---

## Output Structure

```
══════════════════════════════════════
RIVERSIDE BRIEF: [Guest Name] — [Date]
Raw recording: [Duration]
Target export: [Duration after cuts]
══════════════════════════════════════

EXPORT SETTINGS
Video: 4K or highest available resolution
Audio: WAV, 48kHz, 24-bit (separate tracks per speaker)
Format: MP4 for video, WAV for audio tracks
File naming: TeqTalk_EP[N]_[GuestLastName]_RAW.mp4

TOP AND TAIL
• Remove from start: [00:00:00 – 00:XX:XX] — [Reason: pre-show chat / level check]
• Remove from end: [HH:MM:SS – end] — [Reason: post-show wind-down]
• Opening episode start: [Timestamp where to begin the episode]

SECTIONS TO REMOVE
[List each section with timestamp range and reason]
• [HH:MM:SS – HH:MM:SS]: [Dead air / restart / off-topic / technical issue]
• [HH:MM:SS – HH:MM:SS]: [Reason]

AUDIO NOTES FOR ADOBE AUDITION
• Guest mic: [Any level or noise issues noted]
• Host mic: [Any issues]
• Background noise: [Timestamps where noise intrudes]
• Recommended noise reduction: [Yes/No — specific section]

KEY MOMENTS TO PRESERVE (DO NOT CUT)
[The 7 clip moments from transcript-trim will go here once that skill runs]
• [Timestamp]: [Why this moment must not be cut]

HANDOFF CHECKLIST
□ Video export complete (4K MP4)
□ Audio tracks exported separately (WAV per speaker)
□ Files named correctly
□ Uploaded to [project folder / shared drive]
□ Ready for Adobe Premiere

══════════════════════════════════════
```

---
---
name: teqtalk-adobe-cut-brief
description: >
  TeqTalk editing skill. Use after Riverside export is ready. Produces the complete
  Adobe Premiere Pro scene-by-scene cut brief: chapter structure, lower third timing,
  chapter marker timestamps, colour grade direction, export specs for each platform
  version (YouTube full, LinkedIn clip, Reel). Designed so Jas can edit without
  re-watching the whole episode to make decisions. Runs a 4-iteration refinement loop.
---

# Skill: teqtalk-adobe-cut-brief
## Stage 2 — Recording + Editing | Adobe Cut Brief

---

## What This Skill Produces

A complete Adobe Premiere Pro edit brief. Scene-by-scene decisions made in advance. Jas executes; the brief makes the decisions.

---

## Input Required

```
TRANSCRIPT (trimmed version preferred): [Paste]
EPISODE DURATION (target): [Minutes]
GUEST NAME + EPISODE NUMBER: [Details]
CLIP MOMENTS IDENTIFIED: [From transcript-trim skill]
PLATFORM OUTPUTS NEEDED: [YouTube full / LinkedIn clip / Reel / All]
```

---

## Output Structure

```
══════════════════════════════════════
ADOBE CUT BRIEF: EP[N] — [Guest Name]
Target duration: [X] minutes
Outputs: [List platforms]
══════════════════════════════════════

OPENING SEQUENCE (0:00–0:45)
• Cold open: Start at [timestamp] — this is the most provocative line
  in the episode. No intro before it. Cut straight in.
• Lower third: Introduce Jas at [0:15] — "Jas Kaur | CTO, Teqfocus"
• Lower third: Introduce guest at [0:20] — "[Name] | [Title] | [Company]"
• TeqTalk logo reveal: [0:35]
• Episode title card: [0:40] — "[Episode title]"

CHAPTER STRUCTURE (YouTube chapters)
00:00 — [Chapter 1 title]
[MM:SS] — [Chapter 2 title]
[MM:SS] — [Chapter 3 title]
[MM:SS] — [Chapter 4 title]
[MM:SS] — [Chapter 5 title + "The moment that changes how you think about X"]

COLOUR GRADE DIRECTION
• Base grade: Clean, high contrast. No warm filter — this is a leadership 
  conversation, not a lifestyle show.
• Jas: Slight brightness lift if needed. Ensure TeqTalk purple is accurate.
• Guest: Match brightness to Jas. Consistent across both cameras.
• Background: Natural, not overprocessed.

LOWER THIRDS — FULL LIST
[Timestamp]: [Speaker name | Role | Company]
[Timestamp]: [Any stat or key phrase overlay — only for moments of high impact]

CUTS TO MAKE
[List any additional cuts beyond Riverside brief — restarts, long pauses >3sec, 
tangents that don't serve the episode's arc]
• [Timestamp range]: [Reason]

CLOSING SEQUENCE
• Final line of conversation: [Timestamp]
• Outro: TeqTalk logo + "Subscribe for weekly conversations with enterprise 
  AI, Data, and Transformation leaders."
• End screen: 20 seconds — subscribe button + 2 recommended episodes

PLATFORM EXPORT SPECS

YouTube Full Episode:
Resolution: 4K (3840×2160) or 1080p minimum
Frame rate: 30fps
Codec: H.264
Audio: Stereo, normalised to -14 LUFS
File: TeqTalk_EP[N]_[GuestLastName]_FINAL.mp4

LinkedIn Clip (60 seconds):
Source: [Timestamp range — best 60-second exchange]
Format: 16:9, 1080p
Captions: Burned-in, white text, black outline
File: TeqTalk_EP[N]_LinkedIn_Clip.mp4

Reel (30 seconds, vertical):
Source: [Timestamp range — most punchy 30-second moment]
Format: 9:16, 1080×1920
Captions: Burned-in, centred
File: TeqTalk_EP[N]_Reel.mp4

══════════════════════════════════════
```

---
---
name: teqtalk-animation-handoff
description: >
  TeqTalk production skill. Use after the Adobe cut brief is approved. Produces the
  complete animation handoff document for the animator: section-by-section brief,
  timing for each overlay, data visualisation specs if needed, tone and style direction,
  and any specific creative elements per scene. One document. No briefing call required.
  Runs a 4-iteration refinement loop.
---

# Skill: teqtalk-animation-handoff
## Stage 2 — Recording + Editing | Animator Handoff Document

---

## What This Skill Produces

Everything the animator needs in a single document. They open it, work through it from top to bottom, and deliver back the animated overlays. Zero calls, zero clarification emails, zero revision loops caused by ambiguous direction.

---

## Input Required

```
ADOBE CUT BRIEF: [Reference or paste]
EPISODE TITLE + NUMBER: [Details]
GUEST NAME + COMPANY: [Details]
KEY DATA POINTS IN EPISODE: [Any stats, numbers, or frameworks mentioned]
BRAND ASSETS LOCATION: [Link to brand folder]
DEADLINE: [Date needed]
```

---

## Output Structure

```
══════════════════════════════════════
ANIMATION HANDOFF
TeqTalk EP[N]: [Episode Title]
Guest: [Name] | [Company]
Animator: [Name if known]
Due: [Date]
Brand assets: [Link]
══════════════════════════════════════

BRAND REFERENCE
Primary colour: #BD72EF (Light Purple)
Secondary: #7751E2 (Slate Blue) / #21A88A (Green)
Background: #FFFFFF (White) / #000000 (Black for dark overlays)
Font: Poppins Bold for titles / Poppins Regular for body
Logo: Use white version on dark backgrounds, colour version on white
TeqTalk logo file: [File path]

ANIMATION STYLE DIRECTION
• Clean, minimal, professional — this is a CXO audience
• No flashy transitions or heavy motion
• Text overlays: appear cleanly (fade or slide in), hold for reading time, exit cleanly
• Data visualisations: build in (not appear all at once)
• Colour pops: use TeqTalk purple for emphasis, green for positive outcomes
• Consistency: same animation style throughout — no mixing of styles

SCENE-BY-SCENE BRIEF

SCENE 1: Cold Open (0:00–0:45)
• Overlay: Episode title card — "[Title]"
  Style: White text on dark transparent overlay, fade in at 0:40, hold 3 seconds
• Lower third: Jas Kaur — CTO, Teqfocus
  Style: Standard lower third, slide in from left, hold 3 seconds at 0:15
• Lower third: [Guest Name] — [Title] | [Company]
  Style: Same as above at 0:20
• TeqTalk logo bug: Top right corner, appears at 0:35, stays throughout

[REPEAT SCENE STRUCTURE FOR EACH CHAPTER BREAK]

DATA / STAT OVERLAYS
[List each stat or data point mentioned in the episode]
• At [timestamp]: "[Stat]"
  Treatment: Large number in TeqTalk purple, label below in white, fade in

CHAPTER TITLE CARDS
• At [timestamp]: Chapter 1 — "[Title]"
  Style: Full-screen card, 2 seconds, then fade to interview
[Repeat for all chapters]

CLOSING SEQUENCE
• Outro logo animation: TeqTalk logo, 3-second hold
• Subscribe CTA card: "New episodes weekly. Subscribe."
• End screen assets: [YouTube auto-generates — no animation needed]

DELIVERABLES
□ Animated overlays as transparent PNG sequence or AE project
□ Lower thirds as transparent MOV files
□ Chapter cards as standalone MOV files
□ All files named: TeqTalk_EP[N]_[Element]_[Version].mov

REVISION RULE
One revision round included. If direction in this brief is unclear — 
flag before starting, not after completing.

══════════════════════════════════════
```
