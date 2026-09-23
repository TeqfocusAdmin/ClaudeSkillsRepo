# Clay TAM Sourcing & Territory Planning — Teqfocus

Clay enables Teqfocus to define, quantify, and map its Total Addressable Market — then carve it into territories and assign accounts to reps. It transforms a vague ICP definition into a structured, enriched account universe.

---

## When to Use This Workflow

- Building a new TAM model for a vertical (e.g., "How many Healthcare companies with 500+ employees use Salesforce in North America?")
- Preparing for annual territory planning / quota setting
- Sales leadership wants to understand white space (accounts not yet in CRM)
- Building a geographic territory map with account density
- Identifying sub-verticals or micro-segments with high potential

---

## TAM Sourcing: Clay Table Structure

### Step 1: Define the ICP Parameters

Work with GTM leadership to nail down:
- Geography: US only? North America? EMEA?
- Company size: employee range / revenue range
- Industry codes: SIC / NAICS / keyword-based
- Technology requirements: must use Salesforce? Snowflake? Any cloud platform?
- Exclusions: competitors, current customers, blacklisted companies

### Step 2: Source the Account Universe

Clay can pull companies from:
- **Apollo.io** — Search by industry, size, location, tech stack. Best for US/North America.
- **LinkedIn Company Search via Claygent** — For hard-to-filter segments
- **Crunchbase** — For funded/startup segments
- **BuiltWith segment export** — For tech-qualified companies (e.g., "all companies using Salesforce + Snowflake with 500+ employees")
- **G2 buyer lists** — Companies currently evaluating relevant platforms

### Step 3: Firmographic Enrichment

For every account in the TAM universe, enrich:

| Column | Provider | Purpose |
|---|---|---|
| `employee_count` | Clearbit | Size tiering |
| `revenue_estimate` | Clearbit / Bombora | ACV potential |
| `industry_l1` | Clearbit | Vertical assignment |
| `industry_l2` | Clearbit | Sub-vertical assignment |
| `hq_city`, `hq_state`, `hq_country` | Clearbit | Territory assignment |
| `tech_salesforce` | BuiltWith | ICP qualification |
| `tech_snowflake` | BuiltWith | Upsell/expansion signal |
| `tech_cloud` | BuiltWith | Architecture fit |
| `funding_stage` | Crunchbase | Budget availability |
| `in_crm` | HubSpot lookup | Already known? |
| `has_open_deal` | HubSpot / SFDC lookup | Already in pipeline? |
| `is_customer` | HubSpot / SFDC lookup | Current customer? |

### Step 4: Classify Each Account

| Classification | Condition |
|---|---|
| `current_customer` | `is_customer` = TRUE |
| `active_pipeline` | `has_open_deal` = TRUE and `is_customer` = FALSE |
| `known_prospect` | `in_crm` = TRUE, no deal, not a customer |
| `whitespace` | NOT in CRM, NOT a customer, NOT in pipeline |

The TAM = all accounts. The whitespace = accounts we haven't touched yet. This is the core insight Clay gives you.

### Step 5: TAM Sizing Output

Build a summary table:
- Total accounts in TAM by vertical
- Breakdown: customer / pipeline / known / whitespace
- Whitespace accounts by territory
- Whitespace accounts by sub-vertical
- Potential ACV estimate (headcount × average deal size per size band)

---

## Territory Planning: Clay Table Structure

### Territory Carve Logic

After TAM sourcing, use Clay to assign accounts to territories:

**Common carve dimensions:**
- Geography (US regions: East / Central / West; or country-based for international)
- Vertical (Healthcare rep, FinServ rep, etc.)
- Named accounts (specific Tier 1 accounts assigned to senior AEs)
- Company size (SMB / Mid-market / Enterprise)

**Clay columns to add:**
| Column | Logic |
|---|---|
| `territory_geo` | Based on `hq_state` → map to region |
| `territory_vertical` | Based on `industry_l1` |
| `territory_size_band` | Based on `employee_count` buckets |
| `assigned_ae` | Lookup from territory assignment table |
| `assigned_sdr` | Lookup from territory assignment table |
| `priority_tier` | Tier 1/2/3 based on ICP score |

### Rep Capacity Planning

Use the territory output to answer:
- How many accounts per rep? (target: 100–300 Tier 2+3 accounts per rep; 10–30 Tier 1 accounts)
- Which territories are oversized and need splitting?
- Which territories have too few Tier 1 accounts to meet quota?
- Where are the highest-density whitespace opportunities?

---

## Outputs and Destinations

| Output | Destination |
|---|---|
| Full TAM account universe (enriched) | HubSpot (create new companies) or Salesforce |
| Whitespace accounts | Outbound campaign table |
| Territory assignments | HubSpot owner assignment + Salesforce territory field |
| TAM sizing summary | Export to Excel/Google Sheets for leadership review |
| Rep account lists | Push to individual rep's prospecting queue in Clay |

---

## Success Metrics

- Total TAM accounts identified and enriched
- % whitespace (uncovered accounts) vs. current CRM coverage
- Territory balance score (std deviation of account counts across reps)
- TAM-to-pipeline conversion rate by territory (track quarterly)
