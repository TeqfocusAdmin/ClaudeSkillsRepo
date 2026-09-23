# ICP Scoring Reference

This file governs how every contact pulled from Apollo is scored and tiered.
Apply this to every contact before any enrichment or outreach decision.

---

## Scoring Model (Max 9 Points)

| Criteria | Points | How to Check |
|---|---|---|
| Industry matches HLS / FinServ / SaaS / HiTech | +3 | From `industry_tag` set at search time |
| Job title is C-Suite (CIO, CDO, CRO, etc.) | +3 | Check `title` field against C-Suite list |
| Job title is VP level | +2 | Check `title` field against VP list |
| Job title is SVP level | +2 | Check `title` field against SVP list |
| Company size 200–5,000+ employees | +2 | Check `organization.has_employee_count` + range |
| Geography: US / Canada / UK / Australia | +1 | Check `has_country` + `has_state` |
| Email verified or likely to engage | +1 | Check `contact_email_status` |

**Note:** Title scores are mutually exclusive — a contact can only score C-Suite OR VP OR SVP,
not multiple. Take the highest applicable score.

---

## Tier Thresholds

| Score | Tier | Action |
|---|---|---|
| 7–9 pts | **Tier 1 — Priority** | Full ABM treatment: personalized sequence + enrichment |
| 5–6 pts | **Tier 2 — Active** | Standard outbound sequence |
| 3–4 pts | **Tier 3 — Nurture** | Vertical template campaign only |
| 0–2 pts | **Exclude** | Remove from list entirely |

---

## Title Classification Rules

### C-Suite Titles (+3 pts)
Assign if `title` contains any of:
`CIO`, `Chief Information Officer`, `CDO`, `Chief Data Officer`,
`Chief Digital Officer`, `Chief Digital Transformation Officer`,
`CRO`, `Chief Revenue Officer`, `Chief Customer Officer`,
`Chief Experience Officer`

### VP Titles (+2 pts)
Assign if `title` contains `VP` or `Vice President` AND any of:
`Technology`, `Business Technology`, `Information Technology`,
`Go-To-Market`, `Digital Transformation`, `Customer Experience`,
`Enterprise Technology`, `Patient Experience`, `Patient Support`,
`Data`, `Analytics`, `Engineering`

### SVP Titles (+2 pts)
Assign if `title` contains `SVP` or `Senior Vice President` AND any of
the same keyword list above.

### Edge Cases
- "Global CIO" → C-Suite ✅
- "Acting CIO" → C-Suite ✅
- "VP, Sales" → **Exclude** — Sales VP is not in ICP
- "VP of Marketing" → **Exclude** — Marketing VP is not in ICP
- "VP of IT Operations" → VP ✅ (falls under Information Technology)
- "CDO & CIO" → C-Suite ✅ (combined title, still C-Suite)

---

## Scoring Output Format

For each contact, add these fields to the record:

```
ICP_Score:      [0–9]
ICP_Tier:       [Tier 1 | Tier 2 | Tier 3 | Exclude]
Persona_Group:  [C-Suite | VP | SVP | Other]
Industry_Tag:   [HLS | FinServ | SaaS | HiTech]
Score_Breakdown:[e.g. "Industry+3, C-Suite+3, Size+2, Geo+1 = 9"]
Enrich_Flag:    [Yes — Tier 1 | No — Tier 2/3 | No — Excluded]
```

---

## Enrichment Decision Gate

After scoring, present this gate to the user before any enrichment:

```
ENRICHMENT GATE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tier 1 contacts ready to enrich: [N]
Estimated credits required:      [N]

Enrichment reveals: full last name + email address
Cost: 1 credit per contact

Proceed with enrichment of Tier 1 only? [Yes / No / Expand to Tier 2]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Never call `apollo_people_match` without explicit user confirmation.
