# Test Prompts for content-reviewer Skill

## Test Case 1: LinkedIn Post (Weak Tone + Missing Bridge-Gap)
**Prompt:** "Review this LinkedIn post: 'We just helped a healthcare client implement Salesforce Health Cloud. The results were amazing! Contact us to learn more about our services.'"

**Expected behavior:**
- All 5 checkpoints FAIL
- Should provide complete rewritten LinkedIn post
- Tone should shift from salesy to thought leadership
- Bridge-gap narrative inserted
- Healthcare framework alignment added
- Competitive differentiation woven in
- Specific CTA provided

---

## Test Case 2: Cold Email (Generic Outreach)
**Prompt:** "Review this cold email to a FinServ CIO:

Subject: Salesforce Solutions for Financial Services

Hi [Name],

I hope this email finds you well. We are a leading Salesforce partner specializing in financial services implementations. We'd love to discuss how we can help your organization achieve its digital transformation goals.

Would you be available for a quick call next week?

Best regards,
[Sender]"

**Content Type:** Email (cold outreach)
**Target Industry:** Financial Services
**Target Persona:** CIO

**Expected behavior:**
- Checkpoint 1 FAIL: Generic opening, no authority
- Checkpoint 2 FAIL: No bridge-gap positioning
- Checkpoint 3 FAIL: Says "financial services" but no framework alignment
- Checkpoint 4 FAIL: Generic SI positioning
- Checkpoint 5 PARTIAL: Has meeting request but too vague
- Should rewrite with FinServ-specific pain point, bridge-gap narrative, clear differentiation
- Subject line should be rewritten

---

## Test Case 3: Sales Deck Opening Slide
**Prompt:** "Review this sales deck opening slide copy:

TEQFOCUS
Salesforce Implementation Partner

About Us:
- Salesforce Summit Partner
- 10+ years experience
- Healthcare, FinServ, Retail expertise
- Full-stack capabilities"

**Content Type:** Sales deck (opening slide)
**Target Industry:** Healthcare
**Target Persona:** CIO

**Expected behavior:**
- Checkpoint 1 FAIL: Credential list, not story
- Checkpoint 2 FAIL: No bridge-gap positioning
- Checkpoint 3 FAIL: Lists "Healthcare" but no framework alignment
- Checkpoint 4 FAIL: Sounds like credential dump
- Checkpoint 5 N/A: Opening slide doesn't need CTA
- Should rewrite as narrative opening, not bullet list
- Should introduce bridge-gap positioning immediately
- Should be healthcare-contextualized

---

## Test Case 4: One-Pager (Strong Structure)
**Prompt:** "Review this one-pager:

THE CHALLENGE
Mid-market financial advisory firms struggle with fragmented client data. Custody platforms, trading systems, and CRM operate independently. Advisors can't deliver the personalized advice they're expected to provide.

OUR APPROACH
We connect custody, trading, and CRM data under a unified Salesforce + Snowflake architecture. Financial Services Cloud becomes the single pane of glass advisors actually use.

THE OUTCOME
One regional wealth manager saw 40% faster client onboarding and 25% increase in advisor productivity within 90 days.

NEXT STEP
Book a 30-minute discovery call: [calendly link]"

**Content Type:** One-pager
**Target Industry:** Financial Services
**Target Persona:** VP Wealth Management

**Expected behavior:**
- Checkpoint 1 PASS: Professional, outcomes-focused tone
- Checkpoint 2 PARTIAL: Shows integration but missing explicit "vendor promise vs reality" and "decades of experience"
- Checkpoint 3 PASS: FinServ framework (advisor productivity, fragmented client data)
- Checkpoint 4 PARTIAL: Shows full-stack capability but no explicit SI differentiation
- Checkpoint 5 PASS: Clear CTA
- Should provide minor refinements to strengthen bridge-gap and differentiation

---

## Test Case 5: Blog Post Intro (Missing Industry Context)
**Prompt:** "Review this blog post intro:

Title: Why AI Projects Fail (And How to Fix Them)

Most AI projects fail. According to recent studies, 85% of AI initiatives never make it to production. The reasons are complex, but one pattern emerges consistently: organizations invest in AI tools without investing in the data foundation those tools need to succeed.

In this article, we'll explore the most common AI failure modes and the architectural changes that prevent them."

**Content Type:** Blog post
**Target Industry:** Not specified (should flag this)
**Target Persona:** CDO / Data Leader

**Expected behavior:**
- Should ask: "Which industry is this blog post targeting?"
- Checkpoint 1 PASS: Authoritative educational tone
- Checkpoint 2 PARTIAL: Has data foundation angle but no explicit bridge-gap
- Checkpoint 3 FAIL: No industry specificity
- Checkpoint 4 FAIL: Generic content, no differentiation
- Checkpoint 5 N/A: Intro doesn't have CTA (that comes at end)
- Should ask for industry, then suggest industry-specific examples

---

## Test Case 6: Event Invite Email (Telecom)
**Prompt:** "Review this event invite email for Telecom CIOs:

Subject: You're Invited: Executive Dinner in Chicago

Dear [Name],

You're invited to an exclusive executive dinner hosted by Teqfocus on March 15th at The Capital Grille in Chicago.

Join fellow Telecom leaders for an evening of networking and discussion on AI and digital transformation trends shaping the industry.

Space is limited. RSVP by March 1st.

Best,
[Sender]"

**Content Type:** Event invite email
**Target Industry:** Telecom
**Target Persona:** CIO

**Expected behavior:**
- Checkpoint 1 PARTIAL: Professional but generic invite language
- Checkpoint 2 FAIL: No bridge-gap positioning or value prop
- Checkpoint 3 FAIL: Says "Telecom" but no framework alignment (should mention churn, field service, network complexity, CX)
- Checkpoint 4 FAIL: No differentiation or reason to attend THIS dinner
- Checkpoint 5 PASS: Clear RSVP CTA but no value framing
- Should rewrite with Telecom-specific conversation topics, position dinner as peer insight exchange

---

## Test Case 7: Case Study (Retail - Strong Example)
**Prompt:** "Review this case study:

CLIENT: National Apparel Retailer (2,000+ stores)
INDUSTRY: Retail

THE CHALLENGE
E-commerce, in-store POS, and loyalty program data lived in three separate systems. Marketing team couldn't deliver the personalized experiences Commerce Cloud promised because customer data was fragmented.

THE SOLUTION
We integrated Shopify (e-commerce), Square POS (in-store), and Salesforce Marketing Cloud using Snowflake as the central data hub. Built real-time customer journey tracking across all three channels.

THE OUTCOME
- 35% increase in email campaign conversion
- 28% improvement in loyalty program engagement
- Unified customer view marketing team was promised

PARTNER STACK
Salesforce Commerce Cloud + Marketing Cloud + Snowflake + Databricks

TIMELINE
12 weeks from kickoff to production"

**Content Type:** Case study
**Target Industry:** Retail
**Target Persona:** CMO / Head of Marketing

**Expected behavior:**
- Checkpoint 1 PASS: Clear, outcome-focused
- Checkpoint 2 PASS: Explicit vendor promise vs reality in "Challenge" section
- Checkpoint 3 PASS: Retail framework (commerce, loyalty, personalization)
- Checkpoint 4 PASS: Shows integration capability other SIs don't typically deliver
- Checkpoint 5 MISSING: No CTA (case studies need "Book similar engagement" closer)
- Should add CTA at end

---

## Test Case 8: Proposal Executive Summary (Healthcare)
**Prompt:** "Review this proposal executive summary:

EXECUTIVE SUMMARY

This proposal outlines Teqfocus's approach to implementing Salesforce Health Cloud for [Client Name]. Our solution will integrate Epic EHR data with Health Cloud to provide care coordinators with a unified patient view.

PROJECT SCOPE
- Health Cloud implementation
- Epic integration via MuleSoft
- Care coordinator training
- 6-month managed services

TIMELINE: 16 weeks
INVESTMENT: $450,000"

**Content Type:** Proposal executive summary
**Target Industry:** Healthcare
**Target Persona:** CIO

**Expected behavior:**
- Checkpoint 1 PARTIAL: Professional but reads like vendor SOW, not strategic partner
- Checkpoint 2 FAIL: No bridge-gap positioning (should frame client's current gap)
- Checkpoint 3 PARTIAL: Mentions Epic + Health Cloud but no healthcare framework pain points
- Checkpoint 4 FAIL: No differentiation or "Why Teqfocus"
- Checkpoint 5 FAIL: No acceptance CTA
- Should rewrite to lead with client's gap, position Teqfocus as partner who's solved this before, add "Why Teqfocus" section

---

## Test Case 9: Website Service Page Copy (Cross-Industry)
**Prompt:** "Review this website copy for our Data & AI service page:

DATA & AI SERVICES

Transform your data into intelligent business outcomes.

Teqfocus helps enterprises build modern data architectures and AI capabilities using Snowflake, Databricks, and Salesforce Data Cloud.

Services Include:
- Data strategy and architecture
- Cloud data platform implementation
- AI/ML model development
- Data governance and security
- Analytics and BI

Contact us to learn how we can help your organization leverage data and AI."

**Content Type:** Website service page
**Target Industry:** Cross-industry
**Target Persona:** CDO / Data Leader

**Expected behavior:**
- Checkpoint 1 PARTIAL: Professional but generic service page language
- Checkpoint 2 FAIL: No bridge-gap positioning
- Checkpoint 3 N/A: Cross-industry, but should have industry-specific examples
- Checkpoint 4 FAIL: Generic capability list, no differentiation
- Checkpoint 5 FAIL: Weak CTA ("contact us to learn")
- Should rewrite with bridge-gap narrative, specific differentiation, better CTA
- Should suggest adding industry-specific proof points

---

## Test Case 10: ABM Microsite Hero Section (Target: Fortune 500 Bank)
**Prompt:** "Review this ABM microsite hero section for JP Morgan Chase:

WELCOME, JP MORGAN CHASE

Teqfocus is a Salesforce Summit Partner specializing in financial services digital transformation.

We help banks like yours modernize CRM, unify customer data, and deploy AI capabilities.

Let's discuss how we can support your Salesforce and data initiatives."

**Content Type:** ABM microsite (hero section)
**Target Industry:** Financial Services
**Target Persona:** CIO / CTO

**Expected behavior:**
- Checkpoint 1 FAIL: Generic welcome, no personalization beyond company name
- Checkpoint 2 FAIL: No bridge-gap positioning
- Checkpoint 3 PARTIAL: Says "banks" but no specific framework alignment
- Checkpoint 4 FAIL: Generic SI positioning
- Checkpoint 5 FAIL: Generic CTA
- Should rewrite with JPMC-specific context (wealth management, retail banking, investment banking challenges)
- Should show bridge-gap positioning relevant to their scale
- Should have high-value offer CTA (assessment, briefing)

---

## Test Case 11: Webinar Registration Page Copy
**Prompt:** "Review this webinar registration page:

WEBINAR: The Future of AI in Healthcare

Date: March 20, 2025
Time: 2:00 PM EST

Join us for an insightful discussion on how artificial intelligence is transforming healthcare delivery.

Topics Include:
- AI trends in healthcare
- Real-world implementation examples
- Best practices for AI adoption

Register now to secure your spot.

[Registration Form]"

**Content Type:** Webinar registration page
**Target Industry:** Healthcare
**Target Persona:** CDO / CIO

**Expected behavior:**
- Checkpoint 1 PARTIAL: Professional but generic webinar copy
- Checkpoint 2 FAIL: No bridge-gap positioning
- Checkpoint 3 FAIL: Says "healthcare" but no framework alignment
- Checkpoint 4 FAIL: Generic topic list, no Teqfocus POV
- Checkpoint 5 PASS: Clear registration CTA
- Should rewrite with healthcare-specific AI challenges
- Should position webinar around promise vs reality theme
- Should show Teqfocus expertise/differentiation in topic framing
