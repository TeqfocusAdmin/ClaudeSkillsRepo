# Data Cleaner Reference

This file governs all data cleaning operations on Apollo contact lists.
Run this after every search pull, before scoring or segmentation.

---

## Cleaning Sequence (Always Run in This Order)

```
1. Deduplication
2. Title Standardization
3. Data Quality Flagging
4. Exclusion Filtering
5. Output Quality Report
```

---

## Step 1: Deduplication

A duplicate is any of:
- Same Apollo `id` appearing more than once
- Same `first_name` + obfuscated `last_name` + `organization.name`
- Same company appearing more than 3 times (cap per-company to 3 contacts max)

**Per-company cap rule:** No more than 3 contacts from the same company in the
final list. If a company has 5 matching contacts, keep the 3 with the highest
ICP score. This prevents over-indexing on one account.

Action: Keep the record with the most complete data. Remove the rest.
Log: "Removed N duplicates. Capped N companies to 3 contacts."

---

## Step 2: Title Standardization

Normalize all title variations to a clean, consistent format:

| Raw Format | Normalized Format |
|---|---|
| `VP, Technology` | `VP of Technology` |
| `Vice President, Data` | `Vice President of Data` |
| `SVP, Customer Experience` | `SVP of Customer Experience` |
| `CDO & CIO` | `CDO & CIO` ← keep as-is, classify as C-Suite |
| `Global CIO` | `Global CIO` ← keep as-is, classify as C-Suite |
| `Acting Chief Information Officer` | `Acting CIO` |
| Extra spaces, trailing commas | Strip all |

---

## Step 3: Data Quality Flagging

Add a `Data_Quality` field to every record:

| Flag | Condition |
|---|---|
| `Complete` | Has email + title + company + industry tag |
| `Missing Email` | `has_email: false` |
| `Missing Location` | `has_country: false` |
| `Incomplete Company` | `has_employee_count: false` AND `has_revenue: false` |
| `Low Quality` | 2+ fields missing |

Records flagged `Low Quality` or `Missing Email` should be moved to a
separate "Review" segment — do not include in active outreach lists.

---

## Step 4: Exclusion Filtering

Remove any contact where `organization.name` or industry tag matches:
- Staffing, Recruiting, Executive Search
- Non-Profit, Foundation, Charity
- Government, Federal, State, Municipality
- University, College, School, Education
- Real Estate, Property Management

Also remove contacts with these title patterns (not in ICP):
- "Manager", "Analyst", "Coordinator", "Specialist", "Assistant"
- "VP of Sales", "VP of Marketing", "VP of HR", "VP of Finance"
- "Intern", "Contractor", "Consultant" (unless at target company)

---

## Step 5: Output Quality Report

After cleaning, always present:

```
DATA QUALITY REPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Raw contacts pulled:          [N]
Duplicates removed:           [N]
Company cap applied:          [N companies capped]
Exclusions removed:           [N]
Low Quality / Missing Email:  [N → moved to Review]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CLEAN LIST TOTAL:             [N]
Ready for scoring:            [N]
Moved to Review:              [N]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
