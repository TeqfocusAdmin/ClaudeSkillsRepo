# Clay Ads Audiences & Signal Workflows — Teqfocus

Clay builds dynamic, data-enriched audiences that sync automatically to LinkedIn Campaign Manager, Meta, and Google Ads — enabling Teqfocus to run highly targeted ABM ad campaigns without manual list management.

---

## When to Use This Workflow

- Launching a LinkedIn ABM campaign targeting specific companies or personas
- Building a retargeting audience for website visitors enriched with firmographics
- Syncing Tier 1/2 account lists to LinkedIn for "surround sound" ABM
- Creating lookalike audiences based on current customer firmographics
- Running a signal-triggered ad campaign (e.g., "show ads to companies that just raised funding")

---

## Clay Ads Table Structure

### LinkedIn Matched Audiences (Company Targeting)

**Input:** Tier 1 + Tier 2 ABM account list (from `abm.md` workflow)

**Required field for LinkedIn matching:**
- Company name (normalized, no typos)
- Company domain (most reliable matching key)
- Company LinkedIn URL (optional but improves match rate)

**Clay enrichment to add:**
| Column | Purpose |
|---|---|
| `company_name_clean` | Normalized name for LinkedIn matching |
| `company_domain` | Primary matching key |
| `linkedin_company_url` | Boost match rate |
| `employee_count` | For audience segmentation |
| `industry` | For creative message targeting |
| `tier` | Tier 1 / Tier 2 / Tier 3 for budget allocation |

**Output:** Sync to LinkedIn Campaign Manager as a Company List audience.

LinkedIn match rate typically 50–80% of list. Clay's clean data significantly improves this vs. raw CRM exports.

### LinkedIn Matched Audiences (Contact Targeting)

For persona-level targeting within ABM accounts:

**Required for contact matching:**
- Work email (verified) — highest match rate
- First name + last name + company name — fallback

**Segment into multiple LinkedIn audiences:**
- "Teqfocus ABM — Economic Buyers" (CTO, CIO, CDO)
- "Teqfocus ABM — Technical Evaluators" (VP Eng, VP Data, Head of Architecture)
- "Teqfocus ABM — Salesforce Owners" (VP Sales Ops, RevOps, SFDC Architects)

Different ad creative per audience segment.

### Signal-Triggered Ad Audiences

These are the highest-intent audiences. Build Clay workflows that fire when a signal is detected and push to an ad audience:

| Signal | Clay Workflow | Audience Action |
|---|---|---|
| Company raised funding (last 90 days) | Crunchbase → filter by funding stage + ICP | Add to "Funded ICP Companies" LinkedIn audience |
| Company hired new CTO/CIO/CDO | LinkedIn signal → detect exec hire | Add to "New Tech Leader" audience |
| Company added Salesforce to tech stack | BuiltWith weekly diff | Add to "New Salesforce Adopters" audience |
| Website visitor (company identified) | Clearbit Reveal / RB2B → Clay | Add to "Website Visitors" retargeting audience |
| G2 intent — researching data platforms | Bombora / G2 → Clay | Add to "In-Market Data Buyers" audience |

---

## Ad Audience Architecture for Teqfocus

| Audience Name | Source | Platform | Refresh |
|---|---|---|---|
| Tier 1 ABM Companies | ABM list (company level) | LinkedIn | Weekly |
| Tier 2 ABM Companies | ABM list (company level) | LinkedIn | Bi-weekly |
| ABM Economic Buyers | Buying group contacts (emails) | LinkedIn | Weekly |
| ABM Technical Evaluators | Buying group contacts (emails) | LinkedIn | Weekly |
| Website Visitor Retargeting | Clearbit Reveal enriched | LinkedIn + Google | Daily |
| Funded ICP Companies | Crunchbase signal | LinkedIn | Weekly |
| New Salesforce Adopters | BuiltWith signal | LinkedIn | Weekly |
| Current Customer Lookalike | Customer list → LinkedIn Lookalike | LinkedIn | Monthly |
| Event Registrants | Webinar/event list | LinkedIn + Meta | Per event |

---

## Clay → LinkedIn Sync Setup

1. In Clay: create a table with the audience (company names + domains or contact emails)
2. Connect Clay's LinkedIn Ads destination
3. Map Clay fields to LinkedIn audience fields
4. Set refresh cadence (daily/weekly)
5. In LinkedIn Campaign Manager: use the matched audience in your campaigns

**Budget recommendation for ABM:**
- Tier 1 companies: $50–100/day per account segment
- Tier 2 companies: $20–30/day per segment
- Signal-triggered (short burst): $500–1,000 per signal event

---

## Creative Strategy by Audience

| Audience | Ad Type | Message |
|---|---|---|
| ABM Tier 1 (Company) | Thought leadership + direct CTA | Account-specific if possible (Dynamic Ads); otherwise vertical-specific |
| ABM Economic Buyers | Single image + CTA | "Your peers at [company type] are modernizing their data layer with Salesforce + Snowflake" |
| Technical Evaluators | Document Ad / Carousel | Architecture diagram, technical deep dive, Snowflake + SFDC integration demo |
| Website Retargeting | Retargeting sequence | Reminder + social proof + case study |
| Funded Companies | Awareness → Direct | "Congrats on your recent round. Here's how fast-growing [industry] companies scale their data infrastructure." |

---

## Success Metrics

- LinkedIn audience match rate (target ≥ 60%)
- Ad impression share on Tier 1 accounts (target: 5+ impressions/week/account)
- Click-through rate by audience segment
- Influenced pipeline: deals where the contact appeared in an ad audience before engaging
- Cost per influenced opportunity
