---
name: teqtalk-guest-brief
description: >
  TeqTalk pre-production skill. Use this when a guest name and company have been confirmed
  for an upcoming TeqTalk episode. Produces a complete guest intelligence brief: background,
  current role and company context, known public POV on AI/Data/Salesforce/transformation,
  likely talking points they will default to, and the 3 blind spots or provocations Jas
  should push on. Also produces a one-paragraph guest introduction for use in the episode.
  Runs a 4-iteration refinement loop. Always use this skill before any TeqTalk pre-production
  work — do not attempt guest research from memory alone.
---

# Skill: teqtalk-guest-brief
## Stage 1 — Pre-Production | Guest Intelligence

Read: `framework/BRAND_VOICE.md` · `framework/AUDIENCE_INTEL.md`

---

## What This Skill Produces

A complete guest intelligence brief that Jas reads the morning of the interview. It prepares her to have the most substantive, challenging, and rewarding conversation possible — and to find the moments that nobody else will find because nobody else did the research.

---

## Input Required

```
GUEST NAME: [Full name]
GUEST TITLE: [Current role]
GUEST COMPANY: [Organisation]
EPISODE THEME (if known): [Topic area or focus]
ANY PRIOR CONTEXT: [Previous conversations, referrals, known positions]
```

---

## The 4-Iteration Loop

### Pass 1 — Research Draft
Build the brief from public sources: LinkedIn, company website, recent talks/interviews/panels, published articles, press coverage, X/Twitter, conference appearances. Do not fabricate — flag anything unverified with `[VERIFY]`.

### Pass 2 — Benchmark Critique
Score the brief against this question: "Would Dwarkesh Patel or Lex Fridman find a question here that nobody else would ask?" Identify the 2 safest/most predictable angles and replace them with harder, more specific provocations.

### Pass 3 — CXO Audience Filter
Review every section: "Is this insight useful to a CDO or CIO preparing to watch the episode?" Cut anything that is generic industry background a senior executive already knows. Sharpen the blind spots section.

### Pass 4 — Final Polish
Ensure the guest intro paragraph is written in TeqTalk voice (practitioner-level, not press release). Confirm all [VERIFY] flags are present. Format for quick reading — Jas is reading this 30 minutes before recording.

---

## Output Structure

```
══════════════════════════════════════
TEQTALK GUEST BRIEF
Guest: [Name] | [Title] | [Company]
Episode Theme: [Topic]
Prepared: [Date]
══════════════════════════════════════

1. WHO THEY ARE (2–3 sentences)
[Current role, company context, career arc — practitioner credibility only]

2. THEIR PUBLIC POV (bullet format)
[What they are known for saying publicly. Sources cited.]
• [POV 1 — with source]
• [POV 2 — with source]
• [POV 3 — with source]

3. THEIR LIKELY DEFAULT ANSWERS
[The safe, rehearsed answers they will give if not pushed]
• Q: "What's your AI strategy?" → They will say: [default answer]
• Q: "What's the biggest challenge?" → They will say: [default answer]
• Q: "What advice would you give?" → They will say: [default answer]

4. THE 3 BLIND SPOTS / PROVOCATIONS
[The counterintuitive angles. Where their position might be incomplete or overstated.]
• Provocation 1: [Specific challenge with setup question]
• Provocation 2: [Specific challenge with setup question]
• Provocation 3: [Specific challenge with setup question]

5. THE WOW MOMENT TO HUNT FOR
[Based on their background and public positions, what is the single story or insight 
they haven't told publicly that could be the episode's defining moment?]

6. RELEVANT CONTEXT FOR JAS
[Company news, recent announcements, industry events, anything that makes 
this conversation timely and specific right now]

7. GUEST INTRO (ready to read on-air, 3–4 sentences)
[Practitioner voice — no press release language. Names the specific thing 
they've built or decided that makes them worth listening to.]

══════════════════════════════════════
```

---

## Quality Test

Before delivering: "If a competitor podcast host had this brief, could they run a generic interview? If yes — the provocations section is not sharp enough. Rewrite."

The brief passes when the provocations section contains questions that would make a PR team nervous.
