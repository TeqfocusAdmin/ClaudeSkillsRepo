---
name: clay-engine
description: >
  Clay GTM Engine skill for Teqfocus. Use this skill whenever the user wants to build,
  plan, or execute any workflow in Clay — the GTM data enrichment and automation platform.
  Triggers include: mentions of Clay, Claygent, waterfall enrichment, clay tables, clay
  workflows, lead enrichment, outbound automation, CRM enrichment, inbound routing,
  ABM data, TAM sourcing, signal-based outreach, intent data, ICP scoring, contact
  enrichment, Clay + HubSpot, Clay + Salesforce, Clay sequences, and any request to
  "build a Clay workflow", "set up Clay", "design a Clay table", or "automate GTM with
  Clay". This skill covers all 11 Clay use cases mapped to Teqfocus's GTM engine:
  outbound, ABM, inbound enrichment, CRM enrichment, TAM sourcing, account research,
  rep prospecting, rep assist, territory planning, PLG assist, and reverse ETL. Always
  use this skill before designing any Clay-powered workflow — do not attempt from
  memory alone.
---

# Clay GTM Engine — Teqfocus

Clay is the **data enrichment and GTM automation platform** at the center of Teqfocus's GTM engine. It connects 150+ data providers, AI agents (Claygents), intent signals, and sequencing — then syncs everything to HubSpot, Salesforce, LinkedIn Ads, and other tools.

## What is Clay?

Clay is a spreadsheet-like automation platform where every row is a company or person and every column is an enrichment, AI action, or data lookup. You build **tables** that pull data from multiple providers (waterfall enrichment), run AI research agents (Claygents), apply conditional logic, and push results to downstream tools.

**Core Clay concepts:**
- **Tables** — The workspace. Rows = companies or contacts. Columns = enrichments, AI actions, formulas.
- **Claygents** — AI agents that browse the web, scrape pages, navigate gated forms, and return structured answers.
- **Waterfall enrichment** — Try provider A for a field (e.g. email), if empty try B, then C. Maximizes data coverage at lower cost.
- **Signals** — Real-time triggers: job changes, LinkedIn activity, website visits, funding rounds, hiring signals, etc.
- **Audiences** — Combine CRM data + 3rd party signals into dynamic buyer segments.
- **Sequencer** — Native outreach sequencer or push to external tools (HubSpot, Outreach, etc.).
- **Sculptor** — Natural language workflow builder. Describe what you want; Clay builds the table.
- **Destinations** — Push enriched data to HubSpot, Salesforce, data warehouse, ad platforms, etc.

---

## How to Use This Skill

1. **Identify the use case** → load the matching reference file below
2. **Map to Teqfocus's GTM engine** — all Clay work serves one of our 5 GTM motions
3. **Design the Clay table structure** — inputs, enrichment columns, AI columns, outputs
4. **Define the destination** — where does enriched data go? (HubSpot, SFDC, Ads, Sequencer)
5. **Write the workflow spec** — ready for a Clay builder or GTM ops to implement

## Reference Files (Load Based on Use Case)

| Use Case Requested | Load This File |
|---|---|
| Outbound sequence / cold outreach / SDR workflow | `references/outbound.md` |
| ABM / named accounts / Tier 1-2-3 targeting | `references/abm.md` |
| Inbound enrichment / lead routing / form fills | `references/inbound.md` |
| CRM enrichment / HubSpot or SFDC data hygiene | `references/crm-enrichment.md` |
| TAM sourcing / ICP list building / market sizing | `references/tam-sourcing.md` |
| Account research / deal prep / pre-meeting briefs | `references/account-research.md` |
| Rep prospecting / self-serve prospecting for AEs | `references/rep-prospecting.md` |
| Rep assist / meeting prep / deal intelligence | `references/rep-assist.md` |
| Territory planning / account segmentation | `references/territory-planning.md` |
| Ads audiences / LinkedIn/Meta/Google sync | `references/ads-audiences.md` |
| Reverse ETL / warehouse to CRM sync | `references/reverse-etl.md` |

---

## Teqfocus GTM Engine — 5 Motions Clay Supports

Every Clay workflow at Teqfocus maps to one of these five motions:

| GTM Motion | Clay's Role |
|---|---|
| **Outbound Engine** | Build prospect lists → enrich with emails/phones → personalize at scale → push to sequences |
| **ABM Engine** | Enrich named account lists → build buying group maps → trigger ads + direct outreach |
| **Inbound Engine** | Enrich form fills and sign-ups → score → route to HubSpot + alert reps |
| **Demand Gen / Ads** | Build dynamic audiences → sync to LinkedIn, Meta, Google → retarget with intent |
| **Revenue Ops / CRM** | Keep HubSpot/SFDC clean → auto-enrich new records → sync signals back to CRM |

---

## Clay's Core Data Categories (What You Can Enrich)

### Contact-Level
- Email (verified, work, personal)
- Mobile & direct phone
- LinkedIn profile URL
- Job title, seniority, department
- Work history / tenure
- LinkedIn activity (posts, engagement)

### Company-Level
- Firmographics (size, revenue, industry, HQ, founded)
- Tech stack (what tools they use — CRM, data, cloud, etc.)
- Funding history and stage
- Hiring signals (open roles, growth trajectory)
- Website traffic and SEO signals
- LinkedIn company page data
- News mentions and press releases
- G2 / Capterra reviews
- Social presence

### Intent & Signals
- Job change (champion tracking)
- Promotion signals
- Website visitor deanonymization
- LinkedIn post engagement
- G2 intent / competitor research
- Funding announcements
- Product launches / hiring spikes

---

## Clay ↔ Teqfocus Tech Stack Integration Map

| Clay Connects To | How Teqfocus Uses It |
|---|---|
| **HubSpot** | Enriched contact/company records pushed in; inbound leads scored + routed |
| **Salesforce** | CRM enrichment, opportunity upserts, account data hygiene |
| **LinkedIn Ads** | Dynamic audience sync for ABM and retargeting campaigns |
| **Outreach / Salesloft** | Enrolled prospects pushed for sequencing |
| **Snowflake / BigQuery** | Reverse ETL — warehouse data piped back to CRM |
| **Slack** | Alerts when a signal fires (e.g., champion changed jobs) |
| **Google Sheets** | Import/export list data for quick campaigns |
| **Clearbit / Apollo / ZoomInfo** | Waterfall enrichment sources |
| **Anthropic / OpenAI via Claygent** | AI-powered research on accounts and contacts |

---

## Key Clay Workflow Design Principles

1. **Waterfall first** — Never rely on a single data provider. Stack 2-3 sources for any critical field (email, phone, firmographics).
2. **Claygent for custom research** — If a field doesn't exist in any provider (e.g. "Does this company use Salesforce Service Cloud?"), use a Claygent to research it.
3. **Filter before enriching** — Only enrich rows that pass your ICP filter. Don't waste credits on bad-fit accounts.
4. **Score before routing** — Build a scoring column before pushing to HubSpot or sequencer.
5. **Signal-triggered, not batch-blasted** — Best workflows fire when a signal is detected (job change, funding round, web visit), not as a one-time batch.
6. **Destination hygiene** — Always deduplicate before pushing to CRM. Map Clay fields to the exact HubSpot/SFDC property names.

---

## Output Format for Clay Workflow Specs

When designing a Clay workflow, always deliver:

1. **Workflow Name** — descriptive, action-oriented
2. **Use Case** — which GTM motion it serves
3. **Input Source** — how rows enter the table (manual upload, HubSpot sync, signal trigger, form fill, etc.)
4. **ICP Filter** — the conditions a row must meet before enrichment begins
5. **Enrichment Columns** — list each column, the data it fetches, and the provider(s) to use (waterfall order)
6. **AI / Claygent Columns** — list each AI research task and what prompt logic to use
7. **Scoring Logic** — if applicable, how to score/tier the output
8. **Destination(s)** — where enriched data goes and what action it triggers
9. **Trigger / Cadence** — when does this run? (real-time, daily, weekly, on-demand)
10. **Success Metric** — how do we know this workflow is working?
