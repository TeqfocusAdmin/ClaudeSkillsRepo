---
name: apollo-icp-engine
description: >
  Master skill for the Teqfocus Apollo ICP Engine. Use this skill whenever the
  user wants to pull contacts from Apollo, build a prospect list, search for
  leads, find ICP-fit contacts, clean Apollo data, score contacts, or segment
  a list by industry or persona. Also trigger when the user says things like
  "pull me a list", "find me CIOs in healthcare", "get me contacts from Apollo",
  "who should we target", "build me a prospect list", or "run an Apollo search".
  This skill orchestrates 4 sub-skills — always read this file first, then load
  the relevant sub-skill reference file based on the task.
---

# Teqfocus Apollo ICP Engine — Master Skill

This skill governs all Apollo data operations for Teqfocus. It ensures every
contact pull, scoring run, and segmentation output is aligned to the defined
ICP — with zero manual Excel work.

## How to Use This Skill

1. **Read this SKILL.md fully** to understand the ICP and workflow
2. **Identify which operation is needed** → load the relevant reference file
3. **Execute the operation** following the reference file instructions
4. **Always present a summary** of what was pulled, scored, or segmented

## Sub-Skill Reference Files

| Task | Load This File |
|---|---|
| Pull new prospects from Apollo database | `references/apollo-search.md` |
| Search saved contacts in Apollo CRM | `references/apollo-search.md` → Section 2 |
| Score and tier contacts | `references/icp-scoring.md` |
| Clean and deduplicate a list | `references/data-cleaner.md` |
| Segment by industry or persona | `references/segmentation.md` |
| Enroll contacts into Apollo sequences | `references/sequence-enrollment.md` |
| Remove or stop contacts from sequences | `references/sequence-enrollment.md` → Section 3 |
| Enrich a contact (reveal full name + email) | `references/icp-scoring.md` → Enrichment Gate |

---

## Section 1: The Teqfocus ICP — Source of Truth

Never deviate from this definition. Every Apollo pull must filter against these.

### Target Personas

**C-Suite (Highest Priority — +3 pts)**
- CIO / Chief Information Officer
- CDO / Chief Data Officer
- Chief Digital Officer
- Chief Digital Transformation Officer
- CRO / Chief Revenue Officer
- Chief Customer Officer / Chief Experience Officer

**VP Level (+2 pts)**
- VP of Technology / Business Technology / Information Technology
- VP of Go-To-Market
- VP of Digital Transformation
- VP of Customer Experience
- VP of Enterprise Technology
- VP of Patient Experience / Patient Support
- VP of Data / VP of Analytics / VP of Engineering

**SVP Level (+2 pts)**
- SVP of Technology / Business Technology
- SVP of Go-To-Market
- SVP of Digital Transformation
- SVP of Customer Experience / Enterprise Technology
- SVP of Patient Experience / Patient Support
- SVP of Data / SVP of Analytics

### Apollo Seniority Mapping
- C-Suite personas → `person_seniorities: ["c_suite"]`
- VP personas → `person_seniorities: ["vp"]`
- SVP personas → include in `person_titles` explicitly (Apollo has no SVP bucket)
- Always run **separate searches** for C-Suite and VP/SVP to maximize coverage

### Target Industries

| Vertical | Short Code | Apollo Keyword Tags |
|---|---|---|
| Healthcare & Life Sciences | HLS | `Hospital & Health Care`, `Medical Devices`, `Biotechnology`, `Pharmaceuticals` |
| Financial Services | FinServ | `Financial Services`, `Banking`, `Insurance`, `Investment Management` |
| SaaS | SaaS | `Computer Software`, `Internet`, `SaaS` |
| Hi-Tech | HiTech | `Information Technology and Services`, `Semiconductors`, `Telecommunications` |

**CRITICAL RULE:** Always run **one search per industry vertical** — never combine
all four into a single search. Tag each batch at source so you always know which
vertical a contact came from.

### Company Size Bands

| Tier | Employee Range | Revenue Range |
|---|---|---|
| Mid-Market | 200–1,000 | $10M–$250M |
| Upper Mid-Market | 1,001–5,000 | $250M–$1B |
| Enterprise | 5,000+ | $1B+ |

Apollo employee range strings:
- Mid-Market: `"200,1000"`
- Upper Mid-Market: `"1001,5000"`
- Enterprise: `"5001,10000"`, `"10001,1000000"`

### Target Geographies
- United States, Canada, United Kingdom, Australia

### Excluded Industries (never pull from these)
- Staffing & Recruiting
- Non-Profit / Government / Public Sector
- Education
- Real Estate

---

## Section 2: Standard Workflow

Every time a user asks to "pull a list" or "find contacts", run this sequence:

```
STEP 1 → SEARCH    (apollo-search.md)    Pull per-industry, per-seniority
STEP 2 → SCORE     (icp-scoring.md)      Score each contact 0–9 pts
STEP 3 → CLEAN     (data-cleaner.md)     Dedupe, standardize, flag gaps
STEP 4 → SEGMENT   (segmentation.md)     Split by vertical + persona + tier
STEP 5 → SUMMARIZE                       Present counts table to user
```

Always present a final summary table in this format:

```
PULL SUMMARY — [Date]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total contacts pulled:     [N]
After deduplication:       [N]
After ICP scoring:
  Tier 1 (7–9 pts):        [N]  ← Priority ABM targets
  Tier 2 (5–6 pts):        [N]  ← Standard outbound
  Tier 3 (3–4 pts):        [N]  ← Nurture only
  Excluded (<3 pts):       [N]

BY INDUSTRY:
  HLS:      [N] contacts  (T1: X | T2: X | T3: X)
  FinServ:  [N] contacts  (T1: X | T2: X | T3: X)
  SaaS:     [N] contacts  (T1: X | T2: X | T3: X)
  HiTech:   [N] contacts  (T1: X | T2: X | T3: X)

BY PERSONA:
  C-Suite:  [N]
  VP:       [N]
  SVP:      [N]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Section 3: Credit Conservation Rules

Apollo enrichment (revealing full names + emails) costs credits.
**Never enrich all contacts.** Always score first, enrich after.

| Action | Credits Used |
|---|---|
| `apollo_mixed_people_api_search` | Free (search only) |
| `apollo_people_match` (enrichment) | Costs credits — confirm with user first |
| `apollo_contacts_search` | Free (searches saved contacts) |

**Rule:** Only enrich Tier 1 contacts (score 7–9) unless user explicitly requests more.
Always tell the user how many enrichments will be used before calling `apollo_people_match`.

---

## Section 4: Known Apollo API Constraints

1. **Last names are obfuscated** in search results — enrichment required for full name
2. **SVP has no dedicated seniority filter** — must use explicit title strings
3. **Industry not returned** in people search results — tag industry at search time
4. **Max 100 results per page** — paginate for larger pulls
5. **50,000 record display limit** — add filters if results exceed this
6. **`include_similar_titles: false`** — set this for strict ICP title matching

---

## Section 5: Full Apollo Tool Inventory

These are the Apollo tools available in this project. Know which to use for each task.

| Tool | What It Does | Credits? |
|---|---|---|
| `apollo_mixed_people_api_search` | Search Apollo's full database for net-new prospects | Free |
| `apollo_contacts_search` | Search only contacts already saved in your Apollo CRM | Free |
| `apollo_people_match` | Enrich 1 person — reveals full name, email, phone | **Costs credits** |
| `apollo_emailer_campaigns_add_contact_ids` | Enroll contacts into an Apollo sequence | Free (but sends real emails) |
| `apollo_emailer_campaigns_remove_or_stop_contact_ids` | Remove or stop contacts from a sequence | Free |

### When to Use Each Search Tool

**Use `apollo_mixed_people_api_search` when:**
- Prospecting for new ICP-fit contacts not yet in your CRM
- Running the standard 8-search ICP pull matrix
- Building a net-new list for outbound

**Use `apollo_contacts_search` when:**
- User says "find contacts we already have" or "search our database"
- Looking up a specific person by name, title, or company already in Apollo
- Verifying if a contact exists before enriching or enrolling
- Supports: `q_keywords`, `sort_by_field`, `sort_ascending`, `page`, `per_page`

### Sequence Enrollment — Critical Warning

`apollo_emailer_campaigns_add_contact_ids` sends **real emails from a real mailbox**.
This action is **irreversible once emails are dispatched**.
Always load `references/sequence-enrollment.md` before calling this tool.
Never enroll contacts without explicit user confirmation — even if user says "just do it".

---

## Section 6: Extended Workflow (Search → Score → Enrich → Enroll)

When user wants to go from pull all the way to sequence enrollment:

```
STEP 1 → SEARCH      apollo_mixed_people_api_search   Net-new ICP prospects
STEP 2 → SCORE       icp-scoring.md                   Score 0–9, assign tier
STEP 3 → CLEAN       data-cleaner.md                  Dedupe, standardize
STEP 4 → SEGMENT     segmentation.md                  Split by tier + vertical
STEP 5 → ENRICH      apollo_people_match               Tier 1 only — confirm credits first
STEP 6 → ENROLL      sequence-enrollment.md            Confirm sequence + sender + count
```

Never skip the confirmation gates at Steps 5 and 6.
Both cost something — credits (Step 5) or real email sends (Step 6).
