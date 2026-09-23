---
name: teqfocus-linkedin-dashboard
description: Turn a LinkedIn analytics export (xlsx/csv from company page or personal profile) into an interactive dashboard plus 5 data-backed recommendations for the Teqfocus content engine. Use this skill whenever the user uploads LinkedIn analytics data, asks "how is our LinkedIn performing", "analyze our post data", "build a content dashboard", "what's working on LinkedIn", or wants monthly/quarterly content performance review. Different from analytics-tracking (measurement strategy) — this skill builds the actual analysis artifact from real export data.
---

# Teqfocus LinkedIn Dashboard

LinkedIn export in → interactive dashboard + 5 recommendations out. The recommendations feed directly back into the content engine: what to post more of, what to kill, when to post, which persona is responding.

**Prerequisites:** Read `/mnt/skills/user/teqfocus-gtm/SKILL.md` first. For dashboard construction, read `/mnt/skills/public/xlsx/SKILL.md` (parsing the export) and the frontend-design skill (dashboard build).

## Inputs

- LinkedIn analytics export: content export (per-post metrics), follower export, and/or visitor export — company page or personal profile
- Optional: the post texts themselves (paste or scrape) — enables hook-type and pillar analysis, which is where the best recommendations come from
- Ask which profile the export belongs to (company / Avi / Jas) — benchmarks differ

## Analysis layers

1. **Clean and parse** the export (LinkedIn exports have header junk rows — strip before parsing)
2. **Per-post metrics**: impressions, engagement rate, CTR, reactions/comments/reposts split
3. **Pattern extraction** (needs post texts): performance by hook type, format (text/carousel/image/video/document), length band, topic pillar, CTA presence, day-of-week × time
4. **Trend**: 4-week rolling engagement rate, follower growth vs. posting cadence
5. **Outliers**: top 10% and bottom 10% — what the winners share, what the losers share

## Dashboard build

Single self-contained HTML (or React artifact) with: KPI cards (median engagement rate, total impressions, follower delta, posting cadence) → engagement trend chart → format performance comparison → day/time heatmap → top/bottom post table. Teqfocus brand tokens from teqfocus-design. Every chart answers a decision, not decorates a report.

## The 5 recommendations (mandatory, always exactly 5)

Each recommendation: **claim → the data behind it (specific numbers from the export) → the action → which skill executes it**. Example shape:
> "Carousels earn 2.4× the median engagement of text posts (n=9 vs n=31). Shift from 1 to 3 carousels per month. Route: linkedin-campaigns."

Rules: every number traces to the export — nothing estimated. If sample size is under 5 posts for a pattern, flag it "directional — small n". Never recommend on data the export doesn't contain.

## Handoff

Recommendations feed: teqfocus-content-matrix (topic weighting), linkedin-campaigns (format shifts), teqfocus-post-scorer (updated baseline — hand it the same export), content-strategist (calendar cadence).
