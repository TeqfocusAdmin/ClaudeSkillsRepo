---
name: teqtalk-transcript-splitter
description: >
  Split a TeqTalk solo episode transcript into 2 or more standalone videos of 10–15 minutes
  each, based on the total transcript length. Use this skill whenever the user uploads a
  transcript file and wants to split it into multiple videos, parts, or episodes. Also trigger
  when the user says "split this into videos", "cut this transcript into parts", "make episodes
  from this", "divide this transcript", or uploads any transcript and asks how to split it.
  The number of videos is determined automatically from the transcript duration — not fixed at two.
  Each output video must be complete and self-contained. Content is taken ONLY from the uploaded
  transcript — nothing invented, nothing added from outside.
---

# TeqTalk Transcript Splitter

Split one solo episode transcript into 2 or more complete, standalone videos based on total length.

---

## The One Hard Rule

**Use ONLY what is in the uploaded transcript.**
Do not invent transitions. Do not add context. Do not fill gaps.
Every word in the output must exist verbatim in the source file.

---

## Step 1 — Read the Full Transcript

Scan the entire transcript before doing anything else:
- Find the total duration (last timestamp in the file)
- Identify all major topic sections, argument phases, or structural pillars
- Mark every natural break point — where a topic concludes and a new one begins
- Note where summary statements, verdicts, or transition phrases appear

---

## Step 2 — Determine How Many Videos

Use the total transcript duration to decide the number of videos:

| Total Duration | Number of Videos | Target per Video |
|---|---|---|
| Under 20 min | 2 videos | ~8–10 min each |
| 20–35 min | 2–3 videos | 10–15 min each |
| 35–50 min | 3–4 videos | 10–15 min each |
| 50–70 min | 4–5 videos | 10–15 min each |
| 70 min+ | 5+ videos | 10–15 min each |

**Override rule:** If the user specifies a number of videos, use that number instead.
**Priority:** Content completeness beats exact duration. A video can run to 16 min if cutting earlier would break mid-argument. Never cut below 8 min.

---

## Step 3 — Find All Split Points

For each split between videos, the break must satisfy all three conditions:

**Condition A — Duration**
Each video lands within the 10–15 minute target (8 min floor, 16 min ceiling).

**Condition B — Natural break**
The cut lands where the speaker has just finished a complete thought. Look for:
- "So now we know..."
- "That brings us to..."
- "Let's move to..."
- "So that was [X]. Now..."
- End of a named framework pillar
- A summary or verdict statement
- Any sentence that closes a section and pivots forward

**Condition C — Each video is self-contained**
A new viewer landing on any video should be able to follow it without having seen the others. Each video needs:
- A clear topic it addresses
- An argument or point that resolves within it
- A closing line that feels like an ending, not a pause

---

## Step 4 — Write the Split Brief

State the total transcript duration and number of videos first, then output this block for every video:

---

**TRANSCRIPT DURATION:** [X minutes total]
**NUMBER OF VIDEOS:** [N]

---

### VIDEO [N] — [Title from transcript content]
**Timestamps:** `[START]` → `[END]`
**Approximate duration:** X min Y sec
**Covers:** [1–2 sentences using only content from the transcript]
**Opens with (exact line):** "[first spoken words at this timestamp]"
**Closes with (exact line):** "[last spoken words before the cut]"
**Conclusion check:** ✅ Ends on [e.g. "completed argument on identity governance", "verdict statement closing the framework", "full CTA"]

---

Repeat this block for every video. Number them sequentially.

---

## Step 5 — Flag Issues

If no clean break exists near the target split point:
- State the problem in one sentence
- Offer the two nearest candidate break points
- Recommend which one preserves completeness better and why

If the transcript is under 10 minutes total:
- State that it is too short to split without violating the minimum duration
- Deliver it as a single video with no split

---

## Output Rules

- Timestamps must be copied exactly as they appear in the transcript file — do not reformat them
- Never invent a closing line — use the last complete sentence before the cut
- Never invent an opening line — use the first words at the chosen timestamp
- Do not suggest music, intro cards, or transitions — that is post-production, not this skill
- The brief must be clean enough to hand directly to an editor with no further explanation
