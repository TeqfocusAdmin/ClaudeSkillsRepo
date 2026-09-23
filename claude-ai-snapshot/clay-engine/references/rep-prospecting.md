# Clay Rep Prospecting & Territory Planning — Teqfocus

Clay gives every AE and SDR at Teqfocus a self-serve prospecting system — so reps can build focused, enriched lists for their territory without waiting on ops or buying additional tool licenses.

---

## Rep Prospecting: Self-Serve Clay Workflow

### When a Rep Uses This

- AE wants to build a list of target accounts in their territory that aren't in CRM yet
- SDR needs a fresh batch of contacts to cold-call in a specific vertical
- Rep has a new geographic patch and needs to understand what's there
- Rep wants to find "lookalike" companies to an existing customer they just closed

### Clay Table: Rep Prospecting Template

**Step 1 — Rep fills in their targeting filters:**
- Industry: [select vertical]
- Geography: [state/region/country]
- Company size: [employee range]
- Tech stack required: [Salesforce / Snowflake / both / either]
- Exclusions: [existing customers, current pipeline, blacklisted]

**Step 2 — Clay sources the list:**
- Apollo.io company search with the rep's filters
- Deduplicate against HubSpot (remove known records)
- Deduplicate against open deals (remove active pipeline)

**Step 3 — Enrich each company:**
| Column | Provider |
|---|---|
| `headcount` | Clearbit |
| `revenue_estimate` | Clearbit |
| `tech_salesforce` | BuiltWith |
| `tech_snowflake` | BuiltWith |
| `funding_stage` | Crunchbase |
| `open_data_roles` | Claygent LinkedIn search |
| `recent_news` | Claygent |
| `icp_score` | Formula (same as outbound scoring) |

**Step 4 — Find buying group contacts:**
For top 20–30 accounts (scored highest):
- Target persona: VP Data, CTO, VP Engineering, RevOps Director
- Enrich: email (waterfall), phone (waterfall), LinkedIn URL
- Add: Claygent-generated opener for cold call / email

**Step 5 — Export to rep's workflow:**
- Push to HubSpot (create company + contact records, assign to rep)
- Or export to CSV for rep to import into their sequencer
- Or enroll directly in Clay Sequencer if Teqfocus uses it

---

## Territory Planning: Annual Process

### Clay's Role in Territory Planning

Territory planning at Teqfocus happens annually (or when rep headcount changes). Clay powers the data layer:

**Phase 1: TAM Inventory**
- Pull the full TAM (from `tam-sourcing.md`)
- Filter to each rep's proposed territory
- Count: # of Tier 1, Tier 2, Tier 3 accounts per territory

**Phase 2: Coverage Analysis**
- Flag accounts already in CRM (known)
- Flag accounts with open deals (active pipeline)
- Flag accounts that are customers (expansion potential)
- Whitespace = the rest

**Phase 3: Balance Check**
For each proposed territory, calculate:
- Total addressable accounts
- Estimated ACV potential (headcount × average deal size per size band)
- Current pipeline coverage %
- Rep quota vs. territory potential ratio

If a territory is undersized (potential < 2x quota), recommend expansion.
If oversized (potential > 5x quota), recommend splitting or adding reps.

**Phase 4: Named Account Assignment**
- Tier 1 accounts: assign to most senior/tenured AEs
- Ensure no rep has more than 20–25 Tier 1 accounts
- Map geographic clusters to minimize travel for field reps

---

## Clay Outputs for Territory Planning

| Output | Format | Audience |
|---|---|---|
| Territory summary by rep | Clay table exported to Google Sheets | Sales Leadership |
| Account list by territory | HubSpot owner assignments | Individual AEs |
| Whitespace map | Summary table by vertical × geography | Sales Leadership + Marketing |
| ACV potential model | Excel (via Clay export) | Finance + Sales Ops |
| Tier 1 named account list | HubSpot named account view | Sales Leadership |

---

## Success Metrics

- Time to build a rep's prospecting list (target: < 30 minutes with Clay vs. 3–4 hours manual)
- % of territory covered (pipeline + customer) vs. total TAM
- Whitespace accounts entered into pipeline per quarter
- Territory balance score (max/min ACV potential ratio across reps)
