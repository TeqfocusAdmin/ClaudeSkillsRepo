# Clay CRM Enrichment — Teqfocus

Clay keeps Teqfocus's HubSpot (and Salesforce) clean, complete, and current — automatically enriching records with firmographic data, tech stack signals, contact details, and intent flags on a recurring basis.

---

## When to Use This Workflow

- HubSpot has stale or incomplete company/contact records
- Preparing for a QBR or territory review and needing clean data
- Want to identify which existing contacts have changed jobs
- Want to add tech stack or firmographic data to existing CRM records in bulk
- Setting up a "perpetual enrichment" automation that runs on a schedule

---

## The 3 CRM Enrichment Jobs Clay Handles

### Job 1: Bulk Enrich Existing Records

Run once (and quarterly) to enrich all existing HubSpot companies and contacts.

**Company record enrichment:**
| Field | Provider |
|---|---|
| Employee count (current) | Clearbit |
| Revenue estimate | Clearbit / Bombora |
| Industry (normalized) | Clearbit |
| HQ city/country | Clearbit |
| LinkedIn company URL | Clearbit |
| Salesforce in tech stack | BuiltWith |
| Snowflake in tech stack | BuiltWith |
| AWS/Azure/GCP detected | BuiltWith |
| Funding stage | Crunchbase |
| Last funding date | Crunchbase |
| G2 profile URL | Claygent |
| Company description (clean) | Clearbit |

**Contact record enrichment:**
| Field | Provider |
|---|---|
| Full name (normalized) | Clearbit |
| Current title | Apollo / Clearbit |
| Seniority | Clearbit |
| Department | Clearbit |
| LinkedIn URL | Apollo |
| Work email verified | NeverBounce |
| Direct phone | Datagma |
| Location (city, country) | Clearbit |

### Job 2: Champion Tracking (Job Change Monitoring)

Track every contact in HubSpot for job changes. When a champion or key contact leaves their company or gets promoted, fire an alert.

**Clay Table:**
- Input: All HubSpot contacts tagged "Customer," "Champion," or "Key Contact"
- Claygent column: "Check LinkedIn for [contact name] at [current company]. Have they changed jobs or been promoted in the last 90 days? Return new company, new title, or 'no change'."
- Alert trigger: If `job_change_detected` = TRUE → Slack alert to account owner + HubSpot task created

**Why this matters for Teqfocus:** When a Salesforce or data leader moves to a new company, they're often the fastest path to a new deal. Champion tracking turns job changes into pipeline.

### Job 3: Real-Time New Record Enrichment

Every time a new company or contact is added to HubSpot (via form fill, manual entry, or integration), Clay automatically enriches it within minutes.

**Trigger:** HubSpot webhook → Clay table → enrich → push back to HubSpot

This ensures the CRM never has a hollow record. Every new contact gets:
- Email verified
- Company firmographics
- Tech stack flags
- ICP score assigned
- Owner assigned (if routing rules met)

---

## HubSpot Property Architecture

Create these custom properties in HubSpot to receive Clay data:

**Company Properties:**
- `clay_employee_count` (number)
- `clay_revenue_estimate` (dropdown: <$10M / $10-50M / $50-200M / $200M-1B / >$1B)
- `clay_tech_salesforce` (checkbox)
- `clay_tech_snowflake` (checkbox)
- `clay_tech_cloud_platform` (single-line: AWS/Azure/GCP/Multi-cloud)
- `clay_funding_stage` (dropdown)
- `clay_last_enriched_date` (date)
- `clay_icp_fit` (dropdown: Strong Fit / Moderate Fit / Weak Fit)

**Contact Properties:**
- `clay_title_normalized` (single-line)
- `clay_seniority` (dropdown: C-Suite / VP / Director / Manager / IC)
- `clay_department` (dropdown)
- `clay_email_verified` (checkbox)
- `clay_direct_phone` (phone)
- `clay_linkedin_url` (URL)
- `clay_job_change_flag` (checkbox)
- `clay_last_enriched_date` (date)

---

## Enrichment Cadence

| Job | Frequency |
|---|---|
| Bulk company enrichment | Quarterly |
| Bulk contact enrichment | Monthly |
| Champion / job change monitoring | Weekly |
| New record enrichment | Real-time (webhook triggered) |
| Tech stack refresh | Bi-annually |

---

## Success Metrics

- % of company records with complete firmographics ≥ 90%
- % of contact records with verified email ≥ 85%
- # of champion job changes detected per quarter
- Data decay rate (track what % of phone/email goes stale per quarter — Clay should keep this below 15%)
