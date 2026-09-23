---
name: teqfocus-post-scorer
description: Score a LinkedIn post draft against Teqfocus's actual post performance history before publishing. Use this skill whenever the user wants to predict how a post will perform, asks "score this draft", "will this do well", "rate this post", "compare this to what's worked before", or uploads LinkedIn analytics exports alongside a draft. Complements linkedin-post-reviewer (which checks messaging alignment) — this skill checks performance probability. Run BOTH before any post ships.
---

# Teqfocus Post Scorer

Predicts post performance by scoring a draft against what has actually worked on Teqfocus company and personal profiles — not against generic LinkedIn advice.

**Prerequisite:** Read `/mnt/skills/user/teqfocus-gtm/SKILL.md` first. This skill scores performance; `linkedin-post-reviewer` scores messaging alignment. A post must pass both.

## Data sources (in priority order)

1. **LinkedIn analytics export** (xlsx/csv) uploaded by the user — impressions, engagement rate, CTR per post
2. **Apify LinkedIn scraper** if `APIFY_API_TOKEN` is set and the user approves the pull
3. **Manual history**: user pastes 5–10 recent posts with rough performance notes
4. If none available: score against the heuristic rubric below and flag the score as `[UNCALIBRATED — no history provided]`

## Build the performance baseline

From history, extract per-post: hook type (question / stat / contrarian / story), length, format (text / carousel / image / video), topic pillar, CTA type, posting persona (company page vs. personal). Compute median engagement per attribute. Identify the top-quartile pattern — this becomes the target profile.

## Scoring rubric (100 points)

| Dimension | Points | What earns them |
|---|---|---|
| Hook strength | 25 | First 2 lines stop the scroll; matches a hook type in the account's top quartile |
| Pattern match | 20 | Format + length + topic pillar match historical top performers |
| Persona relevance | 20 | Speaks to a named Teqfocus persona's real problem (CIO/CDO/RevOps/VP Sales) |
| Readability | 15 | Line breaks every 1–2 sentences, no wall of text, mobile-scannable |
| CTA clarity | 10 | Exactly one CTA, specific and frictionless |
| Voice compliance | 10 | Zero banned words, no banned openers, senior-practitioner tone |

## Verdict bands

- **80–100 — Ship it.** Minor polish only.
- **60–79 — Rework the flagged dimension.** Provide the specific rewrite, not just the critique.
- **Below 60 — Rebuild.** Route back to linkedin-campaigns with the diagnosis attached.

## Output format

Score table → verdict → the 1–3 highest-impact rewrites shown as before/after → predicted performance band relative to account median (e.g., "top quartile likely" — never invent impression numbers, flag `[VERIFY]` on any quantitative claim).

## Rules

- Never fabricate historical performance data. If the baseline is thin, say so.
- A high score never overrides a linkedin-post-reviewer fail — messaging alignment wins.
- Scored drafts still pass through humanizer before delivery.
