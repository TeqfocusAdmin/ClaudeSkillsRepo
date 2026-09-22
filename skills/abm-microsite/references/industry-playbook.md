# Reference: Industry Personalization Playbook (`industry-playbook.md`)

Use this reference when personalizing microsite copy to a specific industry.
Each entry provides: primary pain, hero headline angle, signal section angle,
recommendation focus areas, proof hook, and stack to feature.

---

## Healthcare

**Primary Pain:**
Fragmented patient data across facilities, SDOH gap analysis failures, care coordination
breakdowns, HIPAA-compliant AI readiness, value-based care transition pressure.

**Hero Headline Angles:**
- *"When [X] facilities share patient data through exports and workarounds, AI-powered care coordination is a plan — not a reality."*
- *"The clinical data exists. The problem is it's in [X] different systems that don't speak to each other."*
- *"Value-based care requires a unified patient record. Most health systems are still years away from having one."*

**The Signal — Key Observations to Use:**
- Health systems managing multi-facility, multi-EMR environments are hitting the same data fragmentation wall
- SDOH-linked interventions require connecting clinical + operational + community data — which almost no health system has done cleanly
- AI POCs in healthcare fail 70%+ of the time not because of the model, but because the input data isn't clean or unified [VERIFY]
- CMS and payer pressure on quality metrics is accelerating the timeline for data unification

**Recommendation Focus Areas:**
1. Unified longitudinal patient record across all facilities
2. SDOH data integration for gap identification and intervention targeting
3. Predictive model deployment (readmissions, no-shows, high-risk patient flagging)

**Proof Hook:**
Healthcare data unification case study — connect to approved case study in proof-points-library.md

**Stack to Feature:**
Salesforce Health Cloud · Data Cloud · Snowflake · Databricks · AWS/Azure

---

## Telecom

**Primary Pain:**
High customer churn, field service inefficiency, CX fragmentation across channels,
siloed network + customer data, post-merger system integration, BSS/OSS complexity.

**Hero Headline Angles:**
- *"[Company]'s churn model is only as good as the customer data behind it — and right now, that data lives in 4 different systems."*
- *"When network performance data and customer experience data don't connect, your CX team is always flying blind."*
- *"Post-merger, [Company] has two CRMs, three billing systems, and one customer who expects a seamless experience."*

**The Signal — Key Observations to Use:**
- Telecom churn is driven by service experience failures that show up in network data weeks before the customer calls to cancel — but only if those data streams are connected
- Field service efficiency gaps are almost always a data routing problem, not a workforce problem
- Customer-facing AI (next-best-action, churn intervention, personalized retention) requires a unified customer record that most telcos don't have

**Recommendation Focus Areas:**
1. Unified customer data layer connecting network, billing, and service data
2. Predictive churn model with intervention workflow built into service systems
3. Field service AI — intelligent dispatch and SLA prediction

**Proof Hook:**
Telecom CX unification or churn reduction case study

**Stack to Feature:**
Salesforce Service Cloud · Field Service Lightning · Snowflake · Databricks · Tableau

---

## Financial Services

**Primary Pain:**
Advisor productivity gaps, compliance and auditability pressure, fragmented client 360,
wealth management data silos, regulatory reporting overhead, manual KYC/AML workflows.

**Hero Headline Angles:**
- *"[Company]'s advisors are spending 40% of their time on administrative tasks that AI should be handling — but the data infrastructure isn't there yet."*
- *"A compliant, AI-powered client 360 isn't a future state for financial services. It's what separates the top-quartile advisors from everyone else."*
- *"When client data lives in the CRM, the portfolio system, and the compliance platform separately, your client 360 is a spreadsheet."*

**The Signal — Key Observations to Use:**
- The firms winning on advisor productivity are the ones who've unified client + portfolio + compliance data into a single governed layer
- Regulatory pressure (MiFID II, SEC, FINRA) is making auditability a baseline expectation — not a nice-to-have
- AI-powered next-best-action for advisors requires clean, unified client data — which most firms are still building

**Recommendation Focus Areas:**
1. Compliant client 360 — unified across CRM, portfolio, and compliance data
2. AI-powered advisor productivity layer (next-best-action, meeting prep automation)
3. Regulatory reporting automation — reduce manual compliance overhead

**Proof Hook:**
FinServ data unification or advisor productivity case study

**Stack to Feature:**
Salesforce Financial Services Cloud · Data Cloud · Snowflake · Tableau · Databricks

---

## Retail / CPG

**Primary Pain:**
Disconnected commerce + service data, loyalty gaps, demand forecasting failures,
distributor/partner portal complexity, fragmented customer identity, supply chain
data silos.

**Hero Headline Angles:**
- *"[Company]'s loyalty program collects data on every transaction — but that data isn't feeding the personalization engine that would actually reduce churn."*
- *"When your ecommerce, in-store, and service data live in separate systems, your customer 360 has three gaps in it."*
- *"Demand forecasting is only as accurate as the data powering it. Most CPG companies are still forecasting on last year's model."*

**The Signal — Key Observations to Use:**
- Retail leaders are winning on personalization because they've unified transaction, loyalty, and service data into a single customer record
- CPG demand forecasting failures are almost always upstream data problems — fragmented POS, distributor, and operational data that never gets unified
- D2C growth is creating a new data asset (first-party customer data) that most brands aren't yet connecting to their existing CRM

**Recommendation Focus Areas:**
1. Unified customer data layer — ecommerce + in-store + loyalty + service
2. AI-powered personalization engine for retention and upsell
3. Demand forecasting model connected to real-time POS and supply chain data

**Proof Hook:**
Retail customer data unification or loyalty/retention case study

**Stack to Feature:**
Salesforce Commerce Cloud · Data Cloud · Snowflake · Tableau · Databricks

---

## Hi-Tech / SaaS

**Primary Pain:**
Slow enterprise sales cycles, CS churn, PLG-to-CRM alignment gaps, CPQ complexity,
renewal risk visibility, manual forecasting, post-acquisition tech stack fragmentation.

**Hero Headline Angles:**
- *"[Company]'s sales cycle is longer than it needs to be — and the root cause is usually Salesforce data that sales reps don't trust."*
- *"When your product usage data and your CRM don't connect, your CS team is chasing renewals they could have predicted 90 days earlier."*
- *"Post-Series [X], [Company] has the pipeline. The problem is forecasting it accurately when CRM adoption is still below 50%."*

**The Signal — Key Observations to Use:**
- SaaS companies scaling past $50M ARR consistently hit the same wall: Salesforce that reps work around instead of in
- PLG-to-enterprise transitions create a specific data gap — product usage signals exist but aren't connected to the CRM where AEs operate
- Customer success churn is almost always predictable 60–90 days out if product usage data and support data are connected — which most CS teams don't have

**Recommendation Focus Areas:**
1. Salesforce adoption recovery — data model cleanup, process simplification, rep-first UX
2. PLG-to-CRM integration — product usage signals feeding the sales and CS motion
3. Renewal risk forecasting — CS data + product data + CRM unified into a single view

**Proof Hook:**
Hi-Tech Salesforce transformation or CS churn reduction case study

**Stack to Feature:**
Salesforce Sales Cloud · Agentforce · Data Cloud · Databricks · Tableau

---

## Cross-Industry Notes

When the industry is unclear or the account spans multiple verticals:
- Default to the pain that's most acute based on `primary_pain` from intake
- Use specific company context to determine the lead angle
- Never blend two industry playbooks into one page — pick the primary one
- If genuinely cross-industry (e.g. a tech company serving healthcare): use the
  buyer's industry (healthcare), not the company's product category (tech)
