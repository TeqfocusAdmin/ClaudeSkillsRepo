# Clay Outbound Workflow — Teqfocus

Clay-powered outbound is the engine that finds net-new prospects matching Teqfocus's ICP, enriches them with verified contact data, personalizes messaging with AI, and enrolls them in sequences — automatically.

---

## When to Use This Workflow

- Building a new outbound sequence for a vertical (Healthcare, FinServ, Telecom, Retail, Hi-Tech)
- SDR or AE needs a fresh list of ICP-fit prospects with emails and phones
- Launching a product- or signal-specific campaign (e.g., "companies using Salesforce + Snowflake but missing a data layer")
- Replacing manual Apollo/ZoomInfo list exports with an automated, signal-enriched alternative

---

## Teqfocus ICP for Outbound

### Primary Target Profile
| Signal | Criteria |
|---|---|
| **Company size** | 200–5,000 employees (enterprise mid-market sweet spot) |
| **Revenue** | $20M–$2B ARR |
| **Industries** | Healthcare, Financial Services, Telecom, Retail/CPG, Hi-Tech/SaaS |
| **Tech stack signals** | Salesforce (any cloud), Snowflake, legacy BI tools (Tableau, Power BI, SSRS), AWS/Azure |
| **Pain signals** | Recent funding, hiring data engineers/architects, posting Salesforce admin/dev roles, Gartner/G2 research on data platforms |
| **Buying group titles** | CTO, CIO, VP Engineering, VP Data, Head of Analytics, Salesforce Architect, RevOps Leader, CMO (for Salesforce Marketing Cloud) |

---

## Clay Table Structure — Outbound Campaign

### Step 1: Input Source
Options (choose one or combine):
- Upload a CSV from Apollo/ZoomInfo with company names
- Pull from a HubSpot list (companies in target segment)
- Use Clay's native prospecting to find companies by ICP filters
- Import from a LinkedIn Sales Navigator export

### Step 2: ICP Filter Columns
Add these filter columns before any enrichment runs:

| Column | Source | Logic |
|---|---|---|
| `industry_match` | Clearbit / Clay enrichment | TRUE if industry ∈ [Healthcare, FinServ, Telecom, Retail, Hi-Tech] |
| `size_match` | Clearbit / Apollo | TRUE if employees between 200–5000 |
| `tech_stack_salesforce` | BuiltWith / HG Insights | TRUE if Salesforce detected |
| `passes_icp` | Formula | TRUE if all three above = TRUE |

Filter: Only continue enrichment for rows where `passes_icp` = TRUE.

### Step 3: Contact Enrichment (Waterfall)

For each target company, find the right buying group contacts:

**Email (Waterfall order):**
1. Apollo.io → 2. Hunter.io → 3. Datagma → 4. Enrow

**Phone (Waterfall order):**
1. Datagma → 2. LeadMagic → 3. Prospeo

**LinkedIn URL:**
1. Apollo.io → 2. Proxycurl

**Contact fields to pull:**
- First name, last name, title, seniority, department
- Work email (verified)
- Direct phone / mobile
- LinkedIn URL
- Location (for territory routing)

### Step 4: AI Personalization Columns (Claygent)

| Column | Claygent Prompt |
|---|---|
| `company_pain_research` | "Visit [company website] and their recent press releases. What are their stated technology priorities or digital transformation challenges? Summarize in 2 sentences." |
| `salesforce_usage_depth` | "Search LinkedIn and the web for [company name] + Salesforce. Do they appear to use Salesforce Sales Cloud, Service Cloud, Marketing Cloud, or Data Cloud? Return what's known." |
| `recent_trigger` | "Has [company name] had any of these events in the last 90 days: funding round, leadership hire (CTO/CIO/VP Data), new product launch, acquisition? Return the most relevant one or 'none found'." |
| `personalized_opener` | "Using this context: [company_pain_research] and [recent_trigger], write a 1-sentence personalized email opener for an outreach from Teqfocus, a Salesforce Summit Partner and data transformation company. Reference something specific to them." |

### Step 5: Scoring

| Score Field | Logic |
|---|---|
| `icp_score` | +1 per matching industry, +1 for Salesforce usage, +1 for Snowflake, +1 for recent trigger, +1 for 500+ employees |
| `priority_tier` | Score 4-5 = Tier 1, Score 2-3 = Tier 2, Score 0-1 = Tier 3 |

### Step 6: Destinations

| Destination | Condition | Action |
|---|---|---|
| **HubSpot** | All Tier 1 + Tier 2 | Create/update Contact + Company record with enriched fields |
| **Outreach / Salesloft** | Tier 1 only | Enroll in outbound sequence (map to vertical-specific sequence) |
| **Slack** | Tier 1 with a live trigger (funding, job change) | Post to #outbound-alerts with contact + context |
| **Clay Sequencer** | Tier 2 (if no external sequencer) | Enroll in lighter-touch email sequence |

---

## Vertical-Specific Sequence Mapping

| Vertical | Sequence Theme | Personalization Angle |
|---|---|---|
| **Healthcare** | "HIPAA-ready data architecture + Salesforce Health Cloud" | Patient 360, care coordination, regulatory data requirements |
| **Financial Services** | "Salesforce Financial Services Cloud + Snowflake" | Client data unification, compliance, real-time reporting |
| **Telecom** | "Customer churn reduction with unified data" | Subscriber lifecycle, ARPU growth, multi-cloud migration |
| **Retail / CPG** | "Unified commerce data layer" | Omnichannel, demand forecasting, personalization at scale |
| **Hi-Tech / SaaS** | "Scale your GTM data infrastructure" | Revenue ops, product-led signals, Salesforce + Snowflake integration |

---

## Trigger Cadence

- **New batch prospecting:** Run weekly for top-priority verticals
- **Signal-triggered:** Run in real-time when a job change, funding round, or website visit fires for a tracked account
- **Re-enrichment:** Re-run ICP accounts quarterly to update contact data and trigger signals

---

## Success Metrics

- Email deliverability rate ≥ 92%
- Enrichment coverage (email found) ≥ 75%
- Tier 1 accounts in sequence within 24h of identification
- Personalized opener relevance (subjective QA by SDR lead monthly)
- Meeting booked rate from Clay-sourced prospects (track in HubSpot)
