---
name: abm-intelligence
description: >
  Account intelligence skill for Teqfocus ABM campaigns. Use this skill whenever
  the user wants to research a target account, build an account intelligence brief,
  map a buying group, identify intent signals, tier accounts, or prepare account
  context before building any campaign asset. Also trigger when the user mentions:
  account research, target account, company research, buying group, who to contact,
  account brief, firmographic, intent data, account scoring, or "tell me about
  [company]" in a sales/GTM context. This skill feeds Project 1 (ABM Engine) and
  Project 2 (Outbound Engine) — always use it before building campaign assets for
  a named account.
---

# Teqfocus ABM Intelligence Skill

This skill governs all account research and intelligence production for Teqfocus
ABM campaigns. Its output — the Account Intelligence Brief — is the foundation
every other campaign asset is built on. Never build a microsite, email sequence,
or LinkedIn campaign for a named account without running this skill first.

## How to Use This Skill

1. **Read this SKILL.md fully** before researching any account
2. **Confirm inputs** from the Brief Intake (Section 2)
3. **Run web research** using available search tools — do not rely on memory alone
4. **Produce the Account Intelligence Brief** using the template in Section 3
5. **Output the Messaging Matrix** using Section 4
6. **Flag gaps** clearly — never invent company-specific details

## Reference Files

| Output | Reference File |
|---|---|
| Account Intelligence Brief template | `references/account-brief.md` |
| Buying Group Mapping guide | `references/buying-group.md` |
| Intent Signal Interpretation guide | `references/intent-signals.md` |
| Account Tiering framework | `references/account-tiering.md` |

---

## Section 1: What Good Account Intelligence Looks Like

**The test:** After reading the brief, a senior Teqfocus person who has never heard
of this company should be able to walk into a first call and say something specific,
credible, and relevant about this company's situation — without it sounding Googled.

**What it is NOT:**
- A Wikipedia summary of the company
- A list of their products and services
- Generic industry pain copy-pasted from the industry playbook
- Anything that could apply to 10 other companies in the same sector

**What it IS:**
- The specific trigger or signal that brought them into scope
- What is happening at this company RIGHT NOW that makes Teqfocus relevant
- Who in the buying group has the most pain, and what that pain costs them
- The single strongest entry point for Teqfocus — not all possible angles

---

## Section 2: Intake Checklist

| Input | Required? | Source |
|---|---|---|
| Company name | ✅ | User |
| Industry | ✅ | User or web research |
| Company size (employees / revenue) | ✅ | Web research |
| HQ location | Optional | Web research |
| Known contacts / titles | Optional | User |
| Trigger signal (why now) | ✅ | User or web research |
| Teqfocus service focus | ✅ | User |
| Account tier (1/2/3) | ✅ | User or derive from size/fit |
| Prior Teqfocus relationship | Optional | User |

If `trigger signal` is missing — research it. Check: recent news, job postings,
leadership changes, earnings calls, press releases, tech stack signals (LinkedIn,
Builtwith, G2), and industry-specific headwinds for their sector.

---

## Section 3: Account Intelligence Brief Template

Produce this for every Tier 1 and Tier 2 account. Tier 3 uses the industry
playbook only — no company-specific research needed.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TEQFOCUS ACCOUNT INTELLIGENCE BRIEF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

COMPANY:          [Name]
INDUSTRY:         [Sector]
SIZE:             [Employees / Revenue band]
HQ:               [City, Country]
TEQFOCUS FIT:     [Primary service line(s)]
ACCOUNT TIER:     [1 / 2 / 3]
BRIEF DATE:       [Date]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. TRIGGER SIGNAL — Why now?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2–3 sentences. The specific, observable signal that makes this account
relevant RIGHT NOW. Not "they are a healthcare company." Something like:
"Apollo Hospitals announced a $200M digital transformation initiative in
Q4 2024 and posted 14 data engineering roles in the last 60 days, signalling
active infrastructure build-out." Source every claim. Flag if inferred.]

SOURCE: [URL or "inferred from job postings / industry context"]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
2. COMPANY SITUATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[3–4 sentences. What is this company dealing with that is relevant to
Teqfocus? Focus on the operational or strategic challenge — not their
business model. Connect to the industry playbook pain but make it specific
to this company's scale, structure, or recent moves.]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
3. KNOWN TECH STACK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CRM:           [Salesforce / Dynamics / HubSpot / Unknown]
Data Platform: [Snowflake / Databricks / Redshift / Unknown]
Cloud:         [AWS / Azure / GCP / Unknown]
BI/Analytics:  [Tableau / Power BI / Looker / Unknown]
Other signals: [Any relevant tools from job postings, G2, Builtwith]

[Note: flag everything as "confirmed" or "inferred from job postings/signals"]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
4. BUYING GROUP MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[List the likely buying group based on the service focus and company size.
For each: Title → Name if known → Their specific pain → Their likely
objection → Best entry point for Teqfocus]

PRIMARY BUYER (Economic):
  Title:         [e.g. CIO]
  Name:          [If known — else "Unknown"]
  Pain:          [Specific to this company's situation]
  Objection:     [Most likely objection for this persona]
  Entry Point:   [How Teqfocus earns credibility with them]

CHAMPION (Technical):
  Title:         [e.g. VP of Data Engineering]
  Name:          [If known]
  Pain:          [Specific]
  Entry Point:   [Technical proof, architecture depth]

INFLUENCER (Business):
  Title:         [e.g. VP of Sales / Head of Operations]
  Name:          [If known]
  Pain:          [Business impact framing]
  Entry Point:   [Outcome metrics, 90-day value]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
5. TEQFOCUS FIT ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRIMARY SERVICE FIT:   [Service line most relevant — and why]
SECONDARY FIT:         [Next most relevant service line]
CASE STUDY MATCH:      [Which industry/vertical case study to use]
COMPETITOR RISK:       [Who are they likely talking to — and why]
DEAL SIZE ESTIMATE:    [Small <$100K / Mid $100K–$500K / Large $500K+]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
6. RECOMMENDED CAMPAIGN ANGLE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ENTRY POINT:     [The single strongest hook for this account]
LEAD WITH:       [Pain / Trigger / Proof / Partner angle]
CTA TYPE:        [Discovery call / Architecture review / AI readiness
                  workshop / Data readiness review / CRM health check]
MICROSITE ANGLE: [The headline concept for the account microsite]
NAMED CASE STUDY:[Customer name + industry to drop in this campaign]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
GAPS / FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[List anything that couldn't be confirmed, needs user input, or should
be verified before campaign launch. Never leave this section empty —
always be explicit about what is inferred vs. confirmed.]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Section 4: Messaging Matrix

After the brief, produce this matrix. It drives every asset in the campaign pack.

```
MESSAGING MATRIX — [COMPANY NAME]

┌─────────────┬──────────────────────────────┬─────────────────────────────┬──────────────────────────┐
│ PERSONA     │ THEIR SPECIFIC PAIN          │ TEQFOCUS VALUE PROP         │ PROOF TO NAME-DROP       │
├─────────────┼──────────────────────────────┼─────────────────────────────┼──────────────────────────┤
│ CIO / CTO   │ [Company-specific — not      │ [Specific to their tech      │ [Named customer in same  │
│             │  generic industry pain]       │  stack and situation]        │  industry + outcome]     │
├─────────────┼──────────────────────────────┼─────────────────────────────┼──────────────────────────┤
│ CDO / Data  │ [Their AI/data specific      │ [Data + AI layer specific]   │ [Case study most         │
│             │  pain at this company]        │                             │  relevant to CDO pain]   │
├─────────────┼──────────────────────────────┼─────────────────────────────┼──────────────────────────┤
│ RevOps /    │ [CRM / ops pain specific     │ [Salesforce outcome angle]   │ [RevOps-relevant proof]  │
│ VP Sales    │  to their scale/stage]        │                             │                          │
└─────────────┴──────────────────────────────┴─────────────────────────────┴──────────────────────────┘

CAMPAIGN ENTRY POINT: [Which persona to lead with and why]
STRONGEST HOOK:       [The single most compelling angle for this account]
```

---

## Section 5: Account Tiering Rules

| Tier | Criteria | Research Depth | Campaign Output |
|---|---|---|---|
| **Tier 1** | Strategic fit + active trigger signal + $500K+ deal potential | Full brief + buying group map + web research | Full ABM pack: brief + matrix + microsite + email + LinkedIn + asset |
| **Tier 2** | Good fit + industry match + $100K–$500K potential | Brief (company situation + buying group) | Email sequence + LinkedIn + 1-pager |
| **Tier 3** | Industry fit, low specific intel | Industry playbook only, no company research | Vertical template with company name swap |

**Promote to Tier 1 if:** Active job postings for roles Teqfocus serves, recent
leadership change (new CIO/CDO), press release about digital transformation,
earnings pressure related to efficiency/AI, or known competitive displacement
(Salesforce migration, data platform consolidation).

---

## Section 6: Competitor Risk Flags

When the brief reveals a competitor risk, flag it explicitly and note the wedge.

| If they're likely talking to... | Flag as | Recommended wedge |
|---|---|---|
| Accenture / Infosys / Cognizant | Big SI risk | "We go deeper on Salesforce and data than generalist consultancies — and we don't bill you for ramping up on platforms we've built on for years." |
| Smaller Salesforce-only SIs | Salesforce-only risk | "We go beyond the CRM. If your data isn't ready, your Salesforce investment isn't either. We fix both." |
| Slalom / Sigma / pure-play data | Data-only risk | "We don't stop at the pipeline. We connect data to the applications your business runs on — and build the AI layer in between." |
| Internal IT team | Build-in-house risk | "We accelerate what your internal team can't prioritize — and leave them with something they can own and maintain." |

---

## Section 6: Intent Signal Scoring Framework

Score each account by intent signal volume and recency:

| Signal | Points | Source |
|---|---|---|
| Visited teqfocus.com (any page) | +2 | GA4 |
| Visited ABM microsite | +5 | GA4 |
| Opened email from Teqfocus | +2 | HubSpot |
| Clicked link in email | +4 | HubSpot |
| Attended Teqfocus event | +8 | Events-engine |
| LinkedIn engagement (like/comment) | +3 | LinkedIn |
| G2 or AppExchange review page visit | +4 | GA4 (if trackable) |
| Direct website inquiry | +10 | HubSpot |
| Job posting signal (data/AI role) | +3 | LinkedIn Jobs |

**Score tiers:**
- **Hot (20+ points in 30 days):** AE direct outreach within 24 hours
- **Warm (10–19 points in 30 days):** SDR outbound + AE notification
- **Cold (< 10 points):** Continue ABM microsite + email nurture
- **No signal (60+ days):** Re-evaluate account inclusion

---

## Section 7: Buying Committee Map Template

For every Tier 1 target, map the buying committee before outreach:

```
ACCOUNT: [Company Name]

PRIMARY CHAMPION (owns the problem):
  Name:
  Title:
  Pain: [what they're personally struggling with]
  Motivation: [what success looks like for them personally]
  Contact: [LinkedIn / email]

ECONOMIC BUYER (signs the check):
  Name:
  Title:
  Concern: [budget, ROI, risk]
  Contact needed from: [Teqfocus exec — Andy]

TECHNICAL EVALUATOR (validates the approach):
  Name:
  Title:
  Concern: [architecture, integration, scalability]
  Contact:

BLOCKER (could kill the deal):
  Name:
  Title:
  Why they might block: [incumbent vendor, internal team pride, budget owner]
  Strategy to neutralize:

STATUS: [Mapped / Partially mapped / Unknown]
```

---

## Section 8: Account Tiering Criteria

| Criterion | Tier 1 | Tier 2 | Tier 3 |
|---|---|---|---|
| Company size | 1,000–10,000 employees | 500–2,000 employees | 200–1,000 employees |
| Industry fit | Perfect vertical match | Adjacent vertical | Broader fit |
| Salesforce usage | Confirmed (LinkedIn/AppExchange) | Likely | Unknown |
| Budget signals | Enterprise IT budget visible | Mid-market | Small team |
| Intent signals | Active signals present | Researching category | Cold |
| ABM investment | Full custom pack | Industry template | Personalized tokens |

---

## Execution Layer — Clay-Engine Integration

This skill = WHAT to research and WHY (strategy + judgment layer).
**clay-engine** = HOW to execute that research at scale (automation layer).

| This skill produces | Clay-engine executes |
|---|---|
| Account tiering criteria | `clay-engine/abm.md` — Tier 1/2/3 enrichment table |
| Buying committee map spec | `clay-engine/account-research.md` — Claygent research |
| Intent signal scoring framework | `clay-engine/abm.md` — signal scoring + ad sync |
| ICP filter definition | `clay-engine/tam-sourcing.md` — TAM build |
| Pre-meeting brief spec | `clay-engine/account-research.md` — automated rep brief |

**Use Clay-engine when:** 10+ accounts, needs scheduling, output must sync to HubSpot/SFDC.
**Stay in abm-intelligence when:** Single Tier 1 account, needs human narrative and political judgment.
---

## Apollo vs Clay — When to Use Each

Both Apollo and Clay can source prospect lists. The choice depends on what you need:

| Situation | Use |
|---|---|
| Quick manual list pull, small batch (<100 contacts) | apollo-icp-engine skill |
| Automated, enriched, multi-provider list at scale | clay-engine/outbound.md |
| Need waterfall enrichment (Apollo + Clearbit + ZoomInfo) | clay-engine |
| Need Claygent research (custom fields not in any database) | clay-engine |
| Need to sync directly to HubSpot/LinkedIn Ads automatically | clay-engine |
| One-off territory check or rep prospecting on demand | apollo-icp-engine |
| Signal-triggered outreach (job changes, funding rounds) | clay-engine |

apollo-icp-engine and clay-engine are not competing — they serve different workflow needs.
Apollo is often a data source *within* Clay via waterfall enrichment.
