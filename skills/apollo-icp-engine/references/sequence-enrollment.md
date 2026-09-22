# Sequence Enrollment Reference

This file governs all Apollo sequence enrollment and removal operations.
Read this BEFORE calling `apollo_emailer_campaigns_add_contact_ids` or
`apollo_emailer_campaigns_remove_or_stop_contact_ids`.

---

## ⚠️ CRITICAL WARNING — Read Before Every Enrollment

`apollo_emailer_campaigns_add_contact_ids` sends **real emails from a real
person's mailbox**. This action is **irreversible once emails are dispatched**.

**Never call this tool until ALL of the following are confirmed:**
1. Sequence ID is verified (not guessed)
2. Sender email account ID is verified (not guessed)
3. User has explicitly confirmed: sequence name, sender, contact count, and status
4. Contact IDs are valid Apollo IDs from `apollo_contacts_search` results

---

## Section 1: Pre-Enrollment Checklist (Run Every Time)

### Step 1 — Find the Target Sequence
Call `apollo_emailer_campaigns_search` to find the sequence by name.

```
Search for: [sequence name the user mentioned]
```

If multiple sequences match → present all matches to user → ask them to confirm which one.
**Never assume which sequence they meant.**

Capture from the result:
- `id` (the sequence ID — used in both `emailer_campaign_id` AND `id` params)
- `name` (confirm with user)
- `active` status

### Step 2 — Get Sender Email Account
Call `apollo_email_accounts_index` to retrieve valid sender accounts.

**NEVER guess or fabricate a `send_email_from_email_account_id`.**
Always use an ID returned by this endpoint.

If user says "use Sarah's account" and multiple accounts match → list all
matching options → ask user to choose explicitly.

Capture:
- `id` (the email account ID)
- `email` (the sender email address — show this to user for confirmation)

### Step 3 — Verify Contact IDs
Contacts must already exist in the Apollo CRM to be enrolled.
Use `apollo_contacts_search` to verify contacts exist and capture their Apollo `id` values.

If contacts were just found via `apollo_mixed_people_api_search`:
- Those are **prospects**, not **contacts** yet
- They must first be enriched with `apollo_people_match`
- Then created as contacts with `apollo_contacts_create`
- Only then can they be enrolled in a sequence

### Step 4 — Show Confirmation Summary
**Always show this before calling the enrollment tool:**

```
SEQUENCE ENROLLMENT CONFIRMATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Sequence:        [Sequence Name]
Sequence ID:     [id]
Sender:          [sender email address]
Contacts:        [N] contacts to enroll
Status:          [active / paused]
Auto-unpause:    [date if paused, else N/A]

⚠️  This will send real emails from [sender email].
    This action cannot be undone once emails are sent.

Type YES to confirm enrollment, or tell me to cancel.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Do not proceed until user explicitly confirms.**
"Just do it" is NOT explicit confirmation — always show the summary first.

---

## Section 2: Enrollment Parameters

### Required Parameters

| Parameter | Value | Notes |
|---|---|---|
| `id` | sequence ID | From `apollo_emailer_campaigns_search` |
| `emailer_campaign_id` | same sequence ID | Must match `id` |
| `send_email_from_email_account_id` | email account ID | From `apollo_email_accounts_index` |
| `contact_ids` | array of Apollo contact IDs | From `apollo_contacts_search` |

### Optional Parameters — When to Use Each

| Parameter | Default | Use When |
|---|---|---|
| `status` | active | Set to `"paused"` if user wants to schedule enrollment for later |
| `auto_unpause_at` | — | Only with `status: "paused"` — ISO 8601 datetime string |
| `sequence_active_in_other_campaigns` | false | Set `true` if contacts are already in other sequences and user still wants to enroll |
| `sequence_finished_in_other_campaigns` | false | Set `true` to re-enroll contacts who finished another sequence |
| `sequence_same_company_in_same_campaign` | false | Set `true` if multiple contacts from same company should all be enrolled |
| `sequence_no_email` | false | Never set to `true` — always require email for Teqfocus outbound |
| `sequence_unverified_email` | false | Set `true` only if user explicitly approves unverified emails |
| `contact_verification_skipped` | false | Only if user explicitly requests — prefer verification |
| `add_if_in_queue` | false | Set `true` if contacts are queued and user wants immediate enrollment |

### Using `label_names` Instead of `contact_ids`
If user says "enroll everyone tagged [label]" — use `label_names` array instead of `contact_ids`.
Cannot use both in the same call.

---

## Section 3: Removing or Stopping Contacts from Sequences

Use `apollo_emailer_campaigns_remove_or_stop_contact_ids` for this.

### Remove vs. Stop

| Mode | What It Does | When to Use |
|---|---|---|
| `remove` | Fully removes contact from sequence — can be re-added later | Contact should not receive any more emails |
| `stop` | Stops contact at current step — records the stop reason | Contact opted out or should be paused with a reason |

### Required Parameters

| Parameter | Notes |
|---|---|
| `contact_ids` | Array of Apollo contact IDs to remove/stop |
| `emailer_campaign_ids` | Array of sequence IDs to remove them from |
| `mode` | `"remove"` or `"stop"` |
| `stop_reason` | Required when `mode: "stop"` — e.g., "Contact requested removal", "Booked meeting" |

### Always Confirm Before Removing

Show this summary before calling:

```
REMOVAL CONFIRMATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Contacts to remove:  [N]
From sequence:       [Sequence Name]
Mode:                [remove / stop]
Stop reason:         [reason if stop]

Confirm? YES / NO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Section 4: Common Enrollment Scenarios

### Scenario A — Enroll Tier 1 contacts from a fresh pull
1. Pull contacts → score → Tier 1 identified
2. Check if they exist as saved contacts (`apollo_contacts_search`)
3. If not saved → enrich (`apollo_people_match`) → create contact → enroll
4. Find sequence → get sender → show confirmation → enroll

### Scenario B — Enroll contacts already in Apollo CRM
1. `apollo_contacts_search` with keyword filter
2. Score results against ICP
3. Find sequence → get sender → show confirmation → enroll

### Scenario C — Remove contacts who booked a meeting
1. Get contact IDs (from user or `apollo_contacts_search`)
2. Get sequence ID (`apollo_emailer_campaigns_search`)
3. Show removal confirmation
4. Call with `mode: "stop"`, `stop_reason: "Meeting booked"`

### Scenario D — Pause enrollment and schedule for later
1. Run full pre-enrollment checklist
2. Set `status: "paused"` and `auto_unpause_at: "[ISO datetime]"`
3. Show confirmation including the scheduled unpause time
4. Enroll after user confirms

---

## Section 5: Post-Enrollment Output

After every successful enrollment, present:

```
ENROLLMENT COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Sequence:        [Name]
Sender:          [email]
Enrolled:        [N] contacts
Status:          [active / paused]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Note: Emails will begin sending per sequence schedule.
To stop any contact, say "remove [name] from [sequence]".
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
