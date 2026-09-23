# Clay Reverse ETL — Teqfocus

Reverse ETL is the process of taking data from a warehouse or data source (Snowflake, BigQuery, internal DB) and syncing it back into CRM, sequencing tools, and other operational systems. Clay is the orchestration layer.

---

## When to Use Reverse ETL

- Product usage data lives in Snowflake and needs to flow into HubSpot for sales visibility
- Customer health scores are calculated in the data warehouse and should appear in Salesforce
- Marketing engagement data (email opens, event attendance) needs to update CRM records
- Internal data (contract value, renewal dates, support tickets) needs to enrich outbound workflows

---

## Common Reverse ETL Flows for Teqfocus

### Flow 1: Product Signal → CRM (PLG Assist)

If Teqfocus works with a PLG customer or internal SaaS product:
- **Source:** Snowflake / BigQuery — product usage events
- **Clay action:** Join usage data with contact/company records; calculate product engagement score
- **Destination:** HubSpot — update `product_engagement_score` property; trigger rep alert if score crosses threshold
- **Use case:** "This trial user hit 10 logins in 7 days — alert their SDR to reach out"

### Flow 2: Customer Health Score → CRM

- **Source:** Snowflake — customer success metrics (NPS, support tickets, license utilization)
- **Clay action:** Pull score, classify as Green/Yellow/Red
- **Destination:** Salesforce Account record — update `health_score` and `health_status`
- **Use case:** Red account flagged → CS team alert → expansion or save play triggered

### Flow 3: Event/Webinar Attendance → Outbound

- **Source:** Webinar platform (Goldcast, Zoom Webinars, ON24) attendance export
- **Clay action:** Import attendee list → enrich with firmographics + contact data → score by attendance + ICP
- **Destination:** HubSpot → enroll in post-event sequence → assign to SDR if score ≥ threshold
- **Use case:** "Every webinar attendee who is ICP-fit gets a personalized follow-up within 2 hours"

### Flow 4: CRM Data Hygiene via Warehouse

- **Source:** Snowflake — deduplicated, cleaned version of HubSpot data (sometimes data teams clean CRM data in the warehouse)
- **Clay action:** Pull clean records → compare to HubSpot → push corrections
- **Destination:** HubSpot — update mismatched fields
- **Use case:** Data team maintains a canonical company/contact master in Snowflake; Clay keeps HubSpot in sync

---

## Clay Reverse ETL Setup

**Step 1:** Connect Clay to your data source
- Snowflake: use Clay's Snowflake integration (native or via API)
- BigQuery: use Clay's Google BigQuery integration
- Postgres/MySQL: use Clay's database connector

**Step 2:** Write your SQL query in Clay
```sql
SELECT 
  company_domain,
  contact_email,
  product_score,
  last_login_date,
  total_sessions_30d
FROM product_events_enriched
WHERE last_login_date >= CURRENT_DATE - 7
  AND product_score >= 60
```

**Step 3:** Map query output to Clay columns
Each SQL column becomes a Clay column. You can add additional enrichment columns on top.

**Step 4:** Define destination mapping
- `contact_email` → HubSpot contact lookup
- `product_score` → HubSpot `product_engagement_score` property
- `last_login_date` → HubSpot `last_product_login`

**Step 5:** Set refresh cadence
- Daily is typical for product signals
- Real-time via webhook for critical health score changes

---

## Success Metrics

- % of CRM records with warehouse-synced product data
- Alert-to-rep-action time (how fast do reps act on PLG signals)
- Pipeline influenced by reverse ETL-triggered outreach
- Data freshness: max age of warehouse data in CRM (target < 24h for key signals)
