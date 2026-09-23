# Clay ABM Workflow — Teqfocus

Clay powers the data layer for Teqfocus's Account-Based Marketing engine. It enriches named account lists, builds buying group maps, surfaces intent signals, and syncs dynamic audiences to LinkedIn Ads and direct outreach sequences.

---

## When to Use This Workflow

- Launching or updating Teqfocus's Tier 1 / Tier 2 / Tier 3 named account lists
- Building a buying group map (all contacts at a named account)
- Syncing an account list to LinkedIn Campaign Manager for targeted ads
- Identifying which named accounts are showing intent signals right now
- Feeding account intelligence into the ABM microsite workflow

---

## ABM Account Tiers at Teqfocus

| Tier | Definition | Clay Action |
|---|---|---|
| **Tier 1** | 10–30 dream accounts — highest ACV potential, strong ICP fit, active signals | Full enrichment + Claygent deep research + buying group map + LinkedIn ad sync + direct outreach |
| **Tier 2** | 50–150 accounts — good ICP fit, moderate signal activity | Enrichment + buying group map + LinkedIn ad sync + light-touch sequence |
| **Tier 3** | 200–500 accounts — ICP fit, low/no signals yet | Firmographic enrichment only + LinkedIn ad audience |

---

## Clay Table Structure — ABM Account Enrichment

### Input Source
- Import from internal Tier account list (CSV or HubSpot list)
- Use Clay's company search to build new Tier lists by ICP criteria
- Pull from Salesforce named account records

### Account-Level Enrichment Columns

| Column | Data Fetched | Provider(s) |
|---|---|---|
| `company_overview` | Description, tagline, founding year | Clearbit / Clay |
| `headcount` | Current employee count | Clearbit / Apollo |
| `revenue_estimate` | ARR or revenue band | Clearbit / Bombora |
| `hq_location` | City, state, country | Clearbit |
| `industry_sub_vertical` | Specific sub-vertical for messaging | Clearbit / Clay |
| `tech_stack_full` | All detected technologies | BuiltWith / HG Insights |
| `salesforce_products` | Which Salesforce clouds detected | HG Insights |
| `snowflake_detected` | Boolean | BuiltWith |
| `cloud_platform` | AWS / Azure / GCP detected | BuiltWith |
| `funding_stage` | Latest round, amount, date | Crunchbase / Clay |
| `hiring_signals` | Open data/engineering/Salesforce roles | LinkedIn Jobs API / Clay |
| `g2_reviews` | Star rating, review count, recent reviews | G2 via Claygent |
| `recent_news` | Last 3 press releases or news mentions | Claygent web search |

### Claygent Research Columns (Tier 1 & 2 Only)

| Column | Claygent Prompt |
|---|---|
| `strategic_priorities` | "Visit [company website]/about, /investor-relations, and their latest annual report or press releases. What are their top 3 strategic technology or digital transformation priorities? Return as bullet points." |
| `salesforce_maturity` | "Search the web and LinkedIn for [company name] + Salesforce. Based on job postings, case studies, and press, what is their current Salesforce maturity level? (Early adopter / Mid-maturity / Advanced). Explain in 2 sentences." |
| `data_pain_signals` | "Is [company name] currently dealing with data silos, legacy BI migration, or cloud data modernization? Search news, LinkedIn posts from their data team, and job postings. Summarize in 2 sentences." |
| `teqfocus_relevance_score` | "Given that Teqfocus specializes in Salesforce transformation, Snowflake data architecture, and AI integration, how relevant is [company name] as a prospect? Score 1-5 and explain in 1 sentence." |
| `exec_summary_for_rep` | "Write a 3-sentence executive brief on [company name] for a Teqfocus AE going into a first call. Include their industry, size, technology environment, and one specific pain point Teqfocus could address." |

### Buying Group Map — Contact Enrichment

For each Tier 1 and Tier 2 account, build a full buying group:

**Target Personas:**
| Persona | Example Titles |
|---|---|
| Economic Buyer | CTO, CIO, CDO, SVP Technology |
| Technical Evaluator | VP Engineering, VP Data, Head of Architecture, Principal Data Engineer |
| Salesforce Owner | VP Sales Ops, Director of CRM, Salesforce Architect, RevOps Lead |
| Marketing Buyer (if MarCloud) | CMO, VP Marketing, Marketing Ops Director |
| Champion | Data Engineer, Salesforce Admin, Analytics Manager |

**Contact Enrichment per Persona:**
- LinkedIn URL + full profile
- Work email (waterfall: Apollo → Hunter → Datagma)
- Direct phone (waterfall: Datagma → LeadMagic)
- Recent LinkedIn posts (Claygent — to find talking points)
- Tenure at company (to gauge influence vs newness)

### Intent Signal Columns

| Signal | Provider | Clay Action |
|---|---|---|
| `g2_intent` | Bombora / G2 Buyer Intent | Flag if account researching Salesforce, Snowflake, or data platforms |
| `website_visit` | Clearbit Reveal / RB2B | Flag if visited teqfocus.com in last 30 days |
| `job_posting_data_roles` | Clay LinkedIn scrape | Flag if 3+ open data/Salesforce roles in last 60 days |
| `funding_recency` | Crunchbase | Flag if funded in last 6 months |
| `exec_hire` | LinkedIn signals | Flag if new CTO/CIO/CDO hired in last 90 days |

### ABM Score

| Score | Weight |
|---|---|
| Tier classification (1/2/3) | 40% |
| Active intent signals (count) | 30% |
| Tech stack fit (Salesforce + Snowflake) | 20% |
| Buying group completeness | 10% |

---

## Destinations

| Destination | Action |
|---|---|
| **HubSpot** | Update Company record with all enriched fields; assign to ABM owner |
| **LinkedIn Campaign Manager** | Sync Tier 1 + 2 companies as a matched audience (company name list) |
| **ABM Microsite workflow** | Pass account data to microsite builder skill for personalized page |
| **Clay Sequencer / Outreach** | Enroll buying group contacts in ABM sequence |
| **Slack #abm-signals** | Alert when a Tier 1 account fires 2+ intent signals simultaneously |

---

## Refresh Cadence

- **Tier 1 accounts:** Re-enrich weekly; monitor signals daily
- **Tier 2 accounts:** Re-enrich bi-weekly
- **Tier 3 accounts:** Re-enrich monthly; promote to Tier 2 if signals activate
- **Buying group map:** Refresh monthly (people change jobs)

---

## Clay → ABM Microsite Connection

When a Tier 1 account is fully enriched, the output feeds directly into the `abm-microsite` skill:
- `company_overview`, `strategic_priorities`, `salesforce_maturity` → populate the microsite's "We understand your world" section
- `exec_summary_for_rep` → populates the hero section positioning
- `buying_group` contact data → personalized "your team will work with" section
