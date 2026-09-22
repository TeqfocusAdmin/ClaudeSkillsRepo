# Clay Account Research & Rep Assist — Teqfocus

Clay powers pre-meeting intelligence, deal prep briefs, and real-time account research for Teqfocus AEs and SDRs — so every conversation starts with context, not cold calls.

---

## When to Use Account Research

- AE has a discovery call scheduled and needs a pre-meeting brief
- SDR is cold-calling and needs talking points before dialing
- Account executive wants to understand the full buying group before engaging
- Deal is stuck and rep needs fresh intelligence to re-engage
- Preparing for a QBR or expansion conversation with an existing customer

---

## Clay Account Research Table

### Input
- A list of company domains or company names (from the AE's calendar, deal stage, or manual input)
- Or triggered automatically: "every time a HubSpot deal moves to 'Discovery Scheduled', run this table"

### Research Columns (Claygent-Powered)

| Column | Claygent Prompt |
|---|---|
| `company_snapshot` | "Visit [company website]/about. Summarize what this company does, who their customers are, and what industry they serve. 3 sentences max." |
| `tech_stack_summary` | "Based on BuiltWith, LinkedIn job postings, and the company website, what is [company name]'s current technology stack? Focus on: CRM (Salesforce?), data platform (Snowflake?), cloud (AWS/Azure/GCP?), analytics (Tableau/Power BI?), and any AI/ML tools. Return as a clean list." |
| `leadership_team` | "Find the current CTO, CIO, VP of Data, VP Engineering, and Head of Sales Ops at [company name] on LinkedIn. Return name, title, LinkedIn URL, and approximate tenure." |
| `recent_news_signals` | "Search news from the last 90 days about [company name]. Find: funding announcements, leadership changes, product launches, acquisitions, or digital transformation initiatives. Return the 2 most relevant findings." |
| `pain_hypothesis` | "Given that Teqfocus specializes in Salesforce transformation, Snowflake data architecture, and AI integration: what is the most likely technology pain [company name] is experiencing based on their size, industry, tech stack, and recent news? State it as a hypothesis in 2 sentences." |
| `teqfocus_angle` | "Based on [company name]'s tech stack and pain hypothesis, which Teqfocus service line is the strongest entry point: (a) Salesforce implementation/optimization, (b) Data & Analytics modernization, (c) AI/ML integration, (d) Cloud infrastructure, or (e) Managed Services? Recommend one and explain why in 1 sentence." |
| `smart_questions` | "Write 3 discovery questions a Teqfocus AE should ask [company name] on a first call. Make them specific to the company's tech stack, industry, and recent news — not generic." |
| `potential_objections` | "What are the 2 most likely objections [company name] would raise when evaluating a new implementation partner? Consider their size, current tech stack, and any recent change management signals." |
| `competitor_landscape` | "Is [company name] likely working with any of these Salesforce partners: Accenture, Deloitte, Capgemini, Cognizant, Infosys, or a boutique SI? What signals suggest this?" |

### Output Format

Clay generates a **Pre-Meeting Brief** for each account — a structured document the AE can read in 5 minutes before a call:

```
ACCOUNT: [Company Name]
INDUSTRY: [Industry] | SIZE: [Employees] | HQ: [Location]

WHAT THEY DO:
[company_snapshot]

TECH STACK:
[tech_stack_summary]

KEY LEADERSHIP:
[leadership_team]

RECENT SIGNALS:
[recent_news_signals]

PAIN HYPOTHESIS:
[pain_hypothesis]

TEQFOCUS ENTRY POINT:
[teqfocus_angle]

SMART DISCOVERY QUESTIONS:
[smart_questions]

WATCH OUT FOR:
[potential_objections]

COMPETITIVE CONTEXT:
[competitor_landscape]
```

---

## Rep Assist: Deal Intelligence & Re-Engagement

### Use Case
A deal has gone cold or moved slowly. The rep needs fresh intelligence to re-engage with a new angle.

### Clay Table: Deal Re-Engagement

| Column | Claygent Prompt |
|---|---|
| `new_signals_since_last_touch` | "Has anything changed at [company name] in the last 60 days: new leadership, funding, product launches, tech stack changes, or public statements about digital transformation? Return top 2 findings." |
| `champion_activity` | "Check LinkedIn for recent posts or activity from [contact name] at [company name]. Have they posted anything about technology, Salesforce, data, or digital transformation in the last 30 days? Return any relevant posts." |
| `new_stakeholder` | "Has [company name] hired any new executives in the last 90 days with titles like CTO, CIO, VP Data, VP Engineering, or Director of Sales Ops? Return name, title, and LinkedIn URL if found." |
| `re_engagement_hook` | "Based on these signals: [new_signals_since_last_touch], write a 1-paragraph re-engagement email from Teqfocus. Reference the specific signal and connect it to Teqfocus's expertise. Keep it under 100 words." |

### Destination
- Brief delivered to AE via Slack DM or HubSpot task note
- Re-engagement email copy pushed to HubSpot email template or Outreach snippet
- New contact record created in HubSpot if a new stakeholder is found

---

## Cadence

- **Pre-meeting briefs:** Triggered automatically when a HubSpot deal moves to 'Discovery Scheduled' or 'Demo Scheduled'
- **Deal re-engagement:** Run weekly on deals that haven't had activity in 30+ days
- **Ongoing account monitoring:** Run monthly for all Tier 1 and Tier 2 accounts

---

## Success Metrics

- % of discovery calls where rep used the brief (track via rep survey)
- Pre-meeting brief generation time (target: < 10 minutes per account)
- Deal re-engagement response rate improvement
- # of new stakeholders identified via champion tracking per quarter
