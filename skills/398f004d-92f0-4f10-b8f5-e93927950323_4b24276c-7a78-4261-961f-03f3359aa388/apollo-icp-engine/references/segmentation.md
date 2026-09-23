# Segmentation Reference

This file governs how cleaned, scored contacts are split into
actionable segments ready for outbound campaigns.

---

## Primary Segmentation Dimensions

Every contact gets tagged on 3 dimensions:

| Dimension | Values |
|---|---|
| **Industry** | HLS · FinServ · SaaS · HiTech |
| **Persona Group** | C-Suite · VP · SVP |
| **ICP Tier** | Tier 1 · Tier 2 · Tier 3 |

The combination of these three creates the segment key:
`HLS_C-Suite_Tier1`, `FinServ_VP_Tier2`, `SaaS_SVP_Tier1`, etc.

---

## Standard Output Segments

### Segment A — Tier 1 Priority (Full ABM)
- ICP Tier = Tier 1 (score 7–9)
- All industries, all personas
- Action: Enrich → Personalized sequence + microsite consideration
- Typical size: 5–15% of total pull

### Segment B — Tier 2 Active Outbound
- ICP Tier = Tier 2 (score 5–6)
- Split by industry for sequencing
- Action: Industry-specific email sequence
- Typical size: 30–40% of total pull

### Segment C — Tier 3 Nurture
- ICP Tier = Tier 3 (score 3–4)
- Action: Vertical template only, low-touch
- Typical size: 20–30% of total pull

### Segment D — Review / Incomplete
- Missing email, low quality data
- Action: Hold — do not outreach until enriched
- Typical size: 10–20% of total pull

---

## Industry Sub-Segments (for Tier 2 campaign routing)

When routing Tier 2 contacts to sequences, split further by vertical:

```
Tier2_HLS     → Healthcare & Life Sciences sequence
Tier2_FinServ → Financial Services sequence
Tier2_SaaS    → SaaS / Software sequence
Tier2_HiTech  → Hi-Tech / Telecom sequence
```

Each vertical has different pain points and messaging — never use a
generic sequence across verticals. Reference the teqfocus-gtm skill
for industry-specific messaging for each segment.

---

## Segmentation Output Format

Present the final segmentation as a table:

```
FINAL SEGMENTATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Segment                    | Count | Next Action
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tier 1 — All Verticals     |  [N]  | Enrich → ABM sequence
  └─ HLS C-Suite T1        |  [N]  |
  └─ FinServ C-Suite T1    |  [N]  |
  └─ SaaS C-Suite T1       |  [N]  |
  └─ HiTech C-Suite T1     |  [N]  |
  └─ VP/SVP Tier 1         |  [N]  |
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tier 2 — HLS               |  [N]  | HLS outbound sequence
Tier 2 — FinServ           |  [N]  | FinServ outbound sequence
Tier 2 — SaaS              |  [N]  | SaaS outbound sequence
Tier 2 — HiTech            |  [N]  | HiTech outbound sequence
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tier 3 — Nurture           |  [N]  | Vertical template
Review / Incomplete        |  [N]  | Hold for enrichment
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TOTAL CLEAN CONTACTS       |  [N]  |
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Downstream Handoff

After segmentation, ask the user:

1. **"Do you want me to enrich the [N] Tier 1 contacts now?"**
   → If yes, load `icp-scoring.md` enrichment gate and proceed
   → Costs 1 credit per contact

2. **"Do you want a CSV export of any segment?"**
   → If yes, format as downloadable CSV with all tagged fields

3. **"Do you want me to map Tier 1 contacts to campaign angles?"**
   → If yes, reference teqfocus-gtm skill for persona + industry messaging matrix
