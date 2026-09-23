# Clay Inbound Enrichment & Routing — Teqfocus

When a prospect fills a form, downloads a resource, registers for a webinar, or requests a demo, Clay instantly enriches their record, scores them, and routes them to the right HubSpot workflow, owner, or sequence.

---

## When to Use This Workflow

- A form fill comes in and needs to be enriched before routing
- Demo requests need to be qualified and prioritized before an SDR follows up
- Webinar registrants need to be scored before post-event follow-up
- You want to auto-qualify and route leads without manual BDR review

---

## Clay Inbound Table Structure

### Input Source
- HubSpot webhook: trigger Clay when a new contact is created or a form is submitted
- Marketo / Pardot sync (if in use)
- Direct form → Clay via Zapier/Make

### Enrichment Columns (Run on Every Inbound Lead)

**Contact enrichment:**
| Column | Provider |
|---|---|
| `email_verified` | Neverbounce / ZeroBounce |
| `work_email_confirmed` | Clearbit / Apollo (confirm it's a real work domain) |
| `linkedin_url` | Apollo / Proxycurl |
| `full_title` | Clearbit / Apollo |
| `seniority` | Clearbit |
| `department` | Clearbit |
| `direct_phone` | Datagma |

**Company enrichment:**
| Column | Provider |
|---|---|
| `company_name_clean` | Clearbit (normalize) |
| `company_domain` | Clearbit |
| `employee_count` | Clearbit |
| `revenue_estimate` | Clearbit / Bombora |
| `industry` | Clearbit |
| `hq_country` | Clearbit |
| `tech_stack_salesforce` | BuiltWith |
| `tech_stack_snowflake` | BuiltWith |
| `funding_stage` | Crunchbase |

### Lead Scoring Logic

| Dimension | Signal | Points |
|---|---|---|
| **Fit** | Industry match (Healthcare/FinServ/Telecom/Retail/Hi-Tech) | +15 |
| **Fit** | Company size 200–5000 employees | +15 |
| **Fit** | Salesforce in tech stack | +20 |
| **Fit** | Snowflake in tech stack | +10 |
| **Intent** | Requested a demo (vs. downloading a resource) | +20 |
| **Intent** | Visited pricing page | +10 |
| **Persona** | Title contains CTO/CIO/VP/Director | +15 |
| **Persona** | Title in data/analytics/engineering | +10 |
| **Negative** | Personal email (gmail/yahoo/outlook) | -20 |
| **Negative** | Company < 50 employees | -15 |
| **Negative** | Student / academic email | -30 |

**Score tiers:**
- 70–100 = **MQL Hot** → Immediate SDR follow-up
- 40–69 = **MQL Warm** → Enroll in nurture sequence
- 0–39 = **Not Qualified** → Move to long-term nurture or disqualify

### Claygent Column: Qualification Brief

For Hot MQLs only:
```
"Given this contact: [name], [title] at [company] ([employee_count] employees, 
[industry], uses [tech_stack]).

Write a 3-sentence qualification brief for the SDR who will call them:
1. What Teqfocus service is most relevant to them
2. One smart question to ask on the first call
3. One potential objection to anticipate"
```

### Routing Logic

| Score Tier | Action |
|---|---|
| **Hot MQL (70+)** | Push to HubSpot → assign to SDR → Slack alert to #inbound-hot-leads → enroll in 24h follow-up sequence |
| **Warm MQL (40–69)** | Push to HubSpot → assign to nurture sequence → tag with vertical |
| **Not Qualified (<40)** | Push to HubSpot → tag as "Low Fit" → add to long-term newsletter list only |

### HubSpot Property Mapping

Ensure these Clay fields map to HubSpot Contact properties:
- `icp_score` → `clay_icp_score` (custom property)
- `lead_tier` → `clay_lead_tier`
- `tech_stack_salesforce` → `uses_salesforce`
- `qualification_brief` → `clay_qual_brief` (text area for SDR)
- `seniority` → `contact_seniority`
- `industry` → `company_industry`

---

## Cadence

- Run in real-time (triggered by HubSpot webhook on new contact creation)
- SDR alert within 5 minutes of Hot MQL identification
- Daily digest report of all inbound leads processed, scored, and routed

---

## Success Metrics

- % of inbound leads fully enriched (target ≥ 85%)
- % of Hot MQLs contacted within 1 hour
- Lead-to-meeting conversion rate by tier (benchmark monthly)
- Enrichment accuracy rate (audit quarterly)
