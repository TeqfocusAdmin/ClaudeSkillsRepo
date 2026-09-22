---
name: sow-generator
description: |
  Teqfocus SOW (Statement of Work) generation skill. Use this skill whenever the user wants
  to create, draft, or generate a Statement of Work for a Teqfocus client engagement. Triggers
  include: "create an SOW", "draft a statement of work", "write the SOW for [client]", "generate
  the SOW for this deal", "create the contract for [client]", "we need an SOW for this resource",
  or any request involving formalizing a Teqfocus client engagement into a contractual document.

  This skill produces a complete, client-ready SOW document (.docx) following Teqfocus's
  standard 16-section format — the same structure used in signed engagements including Asana,
  Workday, and others.

  IMPORTANT: The SOW is a legal document. The generated draft is always routed to Angad Singh
  (CEO) for review and signature before it goes to the client. Never treat a generated SOW as
  final until Angad has approved it. Commercials must be approved by Naveen and Vinod before
  the SOW is generated.
---

# SOW Generator Skill

Produces a complete Statement of Work (.docx) for any Teqfocus engagement:
- Staff augmentation (capacity-based, T&M)
- Fixed-outcome delivery (milestone-based)
- Pod engagement (FDE + Operator model)

---

## Step 1 — Collect Required Inputs

Before generating any SOW, confirm all of these. Ask for anything missing:

### Client details
- Client legal name and registered address
- Client signatory name and title (who will sign on their side)

### Engagement details
- SOW number (format: TS + 6 digits, e.g. TS262070 — get from Naveen)
- Engagement model: staff augmentation / fixed-outcome / pod
- Effective date (when the SOW is signed)

### Resource details (one row per resource)
- Role title
- Named resource (if confirmed) or TBD
- Location: Offshore (India) / Nearshore (Canada) / Onshore (US)
- Start date and end date

### Commercial details (must be approved by Naveen + Vinod before SOW is generated)
- Actual rate per hour (USD) per role
- Discounted rate per hour (USD) per role — the rate the client pays
- Monthly invoice amount per role (discounted rate × 160 hours)
- Total engagement cap (USD)
- Any billing exceptions (e.g. "billing will not exceed $X")

### Scope details
- Scope of services per role (what activities the resource may assist with)
- Out of scope items specific to this engagement

---

## Step 2 — Confirm Escalation Before Generating

Before producing the SOW document:

1. **Commercials confirmed?** Naveen and Vinod must have approved the rate card. If not confirmed: "Rates need Naveen + Vinod approval before the SOW is generated. Ping them on Teams with the scope and resource details. I'll draft the SOW shell with [RATE TBD] placeholders if you need to start the document now."

2. **Angad aware?** The SOW goes to Angad Singh (CEO) for review and signature. Flag it to him on Teams before sending to the client.

---

## Step 3 — Generate the SOW Document

Follow the 16-section structure from `references/sow-template.md` exactly. Load it now and populate every section with the confirmed inputs.

**Document header:**
- Title: STATEMENT OF WORK
- Subtitle: [Scope description] Services
- Client name
- Date: [Effective date]
- Teqfocus Group Inc · Delaware, United States · [SOW number]

---

## Step 4 — QA Checklist

Before delivering the draft:

- [ ] All 16 sections present — no section skipped
- [ ] SOW number in header (TS format)
- [ ] Resource table complete: Role · Name · Location · Start Date · End Date
- [ ] Commercial table complete: Role · Location · Specification · Rate/Hour · Monthly Invoice
- [ ] Both Actual and Discounted rates shown for every role
- [ ] Billing cap stated and matches the sum of monthly invoices × duration
- [ ] Payment terms: Net 30 from invoice date
- [ ] Bank details present and correct (Column N.A.)
- [ ] Device requirements section: include only if client mandates specific specs; omit if not required
- [ ] "Capacity-based staff augmentation" language used for T&M engagements
- [ ] "Fixed outcome delivery" language used for milestone engagements
- [ ] Out of scope section is specific to this engagement — not generic
- [ ] Signature block has both parties with blank Name/Title/Date fields
- [ ] No dollar amounts on the signature page — commercials section only

---

## Step 5 — Route for Review and Signature

After generating the SOW draft:

1. **Naveen** — final commercial review (confirm rates and cap are what was approved)
2. **Angad Singh (CEO)** — legal review and signature authority. "Route this SOW to Angad on Teams for review before it goes to the client. He signs on behalf of Teqfocus Group Inc."
3. **Client signatory** — after Angad signs, send to the client's named signatory via DocuSign or equivalent

Output file naming:
```
SOW_[ClientName]_[SOWNumber]_[YYYY-MM].docx
e.g. SOW_Asana_TS262069_2026-03.docx
```
