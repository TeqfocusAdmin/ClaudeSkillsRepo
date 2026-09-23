---
name: teqfocus-niche-radar
description: Weekly signal scan of the Teqfocus niche — Salesforce ecosystem, Agentforce, Data Cloud, Snowflake, Databricks, enterprise AI agents, SI market moves. Surfaces the 15–20 most relevant stories from the last 7 days with verified dates, ranked by content and pipeline relevance. Use this skill whenever the user asks "what's happening this week", "what should we react to", "any news in the ecosystem", "weekly scan", "what are people talking about", or wants timely topics before planning content. Different from deep-research (market-grade, slow) — this is fast, recency-first, publish-this-week intelligence.
---

# Teqfocus Niche Radar

A 7-day scan of the ecosystem Teqfocus sells into. Output: the stories worth reacting to this week, each with a Teqfocus angle attached — because a story without an angle is just news.

**Prerequisite:** Read `/mnt/skills/user/teqfocus-gtm/SKILL.md` first.

## Scan lanes (search all, every run)

1. **Salesforce**: Agentforce releases, Data Cloud updates, industry cloud news, earnings/strategy, partner program changes
2. **Data platforms**: Snowflake and Databricks releases, pricing moves, partnership announcements
3. **Enterprise AI**: agent deployments in production, governance/regulation news, notable failures (failures are content gold)
4. **Competitor moves**: Accenture/Deloitte/Slalom/boutique SI announcements in Salesforce + data + AI
5. **Buyer-side signals**: CIO/CDO surveys, analyst reports, budget trend coverage in target verticals (healthcare, insurance, banking, hi-tech)

## Method

1. Run web searches per lane with recency framing ("this week", current month + year). 2–4 searches per lane; fetch full articles for the strongest hits.
2. **Verify dates.** Every item needs a publication date from the source. Anything undatable or older than 7 days gets cut (exception: a major story still cresting — mark it "carryover").
3. Rank by: relevance to Teqfocus positioning × conversation volume × reaction window remaining.

## Output format

Table of 15–20 items: **Date · Story (one line) · Source · Lane · Teqfocus angle (one line) · Suggested play**.

Suggested plays: LinkedIn reaction post (route: linkedin-campaigns) · newsletter segment (content-strategist) · TeqTalk topic (TeqTalk Studio) · sales talking point (Sales Intelligence) · ABM trigger for a named account (ABM Engine).

Close with the **top 3 this week** — the stories with the shortest reaction window and the strongest angle, each with a draft-ready hook direction (route hook to teqfocus-hook-generator).

## Rules

- Never present an item without a verified date and working source link.
- Never editorialize a competitor story beyond the correct wedge from the GTM Brain wedge table.
- Metrics quoted from sources are cited; Teqfocus claims layered on top get `[VERIFY]`.
- This skill surfaces and angles — production always routes out.
