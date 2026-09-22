# Apollo Search Reference

This file governs all `apollo_mixed_people_api_search` calls for Teqfocus ICP pulls.

---

## The Golden Rule: One Search Per Industry Per Seniority

Never combine all industries or all seniority levels into one search.
Run this matrix — 8 searches total for a full pull:

| Search # | Industry | Seniority | Titles |
|---|---|---|---|
| 1 | HLS | C-Suite | CIO, CDO, CRO, Chief Digital Officer, etc. |
| 2 | HLS | VP + SVP | VP/SVP of Technology, Data, Patient Experience, etc. |
| 3 | FinServ | C-Suite | same C-Suite list |
| 4 | FinServ | VP + SVP | same VP/SVP list |
| 5 | SaaS | C-Suite | same C-Suite list |
| 6 | SaaS | VP + SVP | same VP/SVP list |
| 7 | HiTech | C-Suite | same C-Suite list |
| 8 | HiTech | VP + SVP | same VP/SVP list |

Tag every result with its source industry immediately — this is the only way to
know the vertical once results are combined.

---

## Standard Search Parameters

### C-Suite Search (use for searches 1, 3, 5, 7)

```
person_seniorities: ["c_suite"]
person_titles: [
  "CIO", "Chief Information Officer",
  "CDO", "Chief Data Officer",
  "Chief Digital Officer",
  "Chief Digital Transformation Officer",
  "CRO", "Chief Revenue Officer",
  "Chief Customer Officer",
  "Chief Experience Officer"
]
include_similar_titles: false
contact_email_status: ["verified", "likely to engage"]
organization_num_employees_ranges: ["200,1000", "1001,5000", "5001,10000", "10001,1000000"]
person_locations: ["United States", "Canada", "United Kingdom", "Australia"]
per_page: 100
page: 1
```

### VP + SVP Search (use for searches 2, 4, 6, 8)

```
person_seniorities: ["vp"]
person_titles: [
  "VP of Technology", "Vice President of Technology",
  "VP of Business Technology", "Vice President of Business Technology",
  "VP of Information Technology", "Vice President of Information Technology",
  "VP of Go-To-Market", "Vice President of Go-To-Market",
  "VP of Digital Transformation", "Vice President of Digital Transformation",
  "VP of Customer Experience", "Vice President of Customer Experience",
  "VP of Enterprise Technology", "Vice President of Enterprise Technology",
  "VP of Patient Experience", "Vice President of Patient Experience",
  "VP of Patient Support", "Vice President of Patient Support",
  "VP of Data", "Vice President of Data",
  "VP of Analytics", "Vice President of Analytics",
  "SVP of Technology", "Senior Vice President of Technology",
  "SVP of Business Technology", "Senior Vice President of Business Technology",
  "SVP of Go-To-Market", "Senior Vice President of Go-To-Market",
  "SVP of Digital Transformation", "Senior Vice President of Digital Transformation",
  "SVP of Customer Experience", "Senior Vice President of Customer Experience",
  "SVP of Enterprise Technology", "Senior Vice President of Enterprise Technology",
  "SVP of Patient Experience", "Senior Vice President of Patient Experience",
  "SVP of Data", "Senior Vice President of Data",
  "SVP of Analytics", "Senior Vice President of Analytics"
]
include_similar_titles: false
contact_email_status: ["verified", "likely to engage"]
organization_num_employees_ranges: ["200,1000", "1001,5000", "5001,10000", "10001,1000000"]
person_locations: ["United States", "Canada", "United Kingdom", "Australia"]
per_page: 100
page: 1
```

### Industry Keyword Tags Per Vertical

```
HLS:     q_organization_keyword_tags: ["Hospital & Health Care", "Medical Devices", "Biotechnology", "Pharmaceuticals"]
FinServ: q_organization_keyword_tags: ["Financial Services", "Banking", "Insurance", "Investment Management"]
SaaS:    q_organization_keyword_tags: ["Computer Software", "Internet", "SaaS"]
HiTech:  q_organization_keyword_tags: ["Information Technology and Services", "Semiconductors", "Telecommunications"]
```

---

## Pagination Logic

After page 1, check `total_entries` in the response.
If total_entries > 100, paginate:

```
while (page * per_page) < min(total_entries, 5000):
  increment page by 1
  run same search with new page number
  append results
  tag all results with industry source
```

Stop at 5,000 per industry vertical per seniority band unless user requests more.

---

## Targeted Pull (Single Persona or Industry)

If user says "just give me CIOs in healthcare" or similar specific request,
run only the relevant search from the matrix above. Do not run all 8.

Examples:
- "CIOs in HLS" → Search 1 only
- "VP-level contacts in FinServ and SaaS" → Searches 4 and 6 only
- "All C-Suite across all verticals" → Searches 1, 3, 5, 7

---

## After Each Search — Immediate Tagging

Before moving to the next search, record this for every result batch:
```
{
  "industry_tag": "HLS",          ← Source vertical
  "seniority_tag": "C-Suite",     ← Search type
  "pull_date": "YYYY-MM-DD",      ← Date of pull
  "total_in_batch": N             ← Count from this search
}
```

This metadata is critical — without it, you cannot segment later.

---

## Section 2: Searching Saved Contacts (`apollo_contacts_search`)

Use this when the user wants to search contacts **already in their Apollo CRM** —
not the full Apollo database. This is faster, costs no credits, and scopes to
contacts the team has already captured.

### When to Use
- "Find contacts we already have from Salesforce"
- "Search our Apollo contacts for CIOs"
- "Do we have any contacts at [Company]?"
- "Pull the contacts we saved last month"

### Parameters

| Parameter | Type | Description |
|---|---|---|
| `q_keywords` | string | Name, title, company, or email. Example: `"CIO healthcare"` |
| `sort_by_field` | string | `contact_last_activity_date`, `contact_created_at`, `contact_updated_at`, `contact_email_last_opened_at`, `contact_email_last_clicked_at` |
| `sort_ascending` | boolean | `true` = oldest first. Defaults to `false` (newest first) |
| `per_page` | integer | Results per page. Max 100 |
| `page` | integer | Page number for pagination |

### Example Usage

```
q_keywords: "Chief Information Officer healthcare"
sort_by_field: "contact_created_at"
sort_ascending: false
per_page: 50
page: 1
```

### Important Constraints
- Display limit: 50,000 records (100 per page × 500 pages)
- Does NOT return email addresses — use `apollo_people_match` to enrich
- Returns saved contacts only — not the full Apollo prospect database
- No industry or seniority filter — use `q_keywords` to target by title/company

### After Searching Saved Contacts
Apply the same ICP scoring model from `icp-scoring.md` to the results.
The same tier thresholds apply — Tier 1/2/3/Exclude.
