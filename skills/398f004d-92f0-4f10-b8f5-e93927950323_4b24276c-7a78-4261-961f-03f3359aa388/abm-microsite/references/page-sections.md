# Reference: Page Section Copy Guidelines (`page-sections.md`)

Detailed writing guidelines for every section of a Teqfocus ABM microsite.
Read this when generating the content inside each section of the `.php` template.

---

## Section 1: Minimal Nav Bar

**Purpose:** Orient the visitor. Confirm they're in the right place. One action.

**Contains:**
- Teqfocus logo (text-based `<a>` or `<img>` if path provided)
- Single CTA button — same URL as the hero CTA

**Rules:**
- No main site navigation links
- No dropdown menus
- No search bar
- The only clickable destination besides the logo is the CTA button

---

## Section 2: Hero

**Purpose:** In under 10 seconds, make the visitor feel: *"This was made for us."*

**Eyebrow line:**
- Format: `[INDUSTRY] · [SERVICE FOCUS]`
- Example: `Healthcare · Data + AI`
- Purpose: Instant category confirmation — they know they're in the right place

**Headline (h1):**
- Names the specific problem this company faces — not a generic pain
- Written as a problem statement or a pointed observation
- Must be specific enough that it would not work on any other company's page
- Length: 8–16 words
- Good: *"When 70 hospitals generate patient data that can't talk to each other, AI doesn't start — it stalls."*
- Bad: *"Transforming Healthcare with Data and AI"* (generic)

**Sub-headline:**
- Teqfocus's point of view on the fix — one sentence
- Specific, not feature-list
- Good: *"We build the data foundation that makes AI in care coordination actually work — and we've done it for health systems at your scale."*
- Bad: *"Teqfocus provides end-to-end data and AI solutions for healthcare."*

**CTA button:**
- Label matches `cta_type` from intake
- Example: "Book an AI Readiness Workshop" not "Contact Us"

---

## Section 3: The Signal

**Purpose:** Earn trust by demonstrating that Teqfocus has done real homework on this company — not just their industry.

**Header:** "Why we're reaching out to [Company Name] now"

**Three paragraphs:**

Para 1 — *The specific company context:*
- Opens with an observation about the company's situation, not about Teqfocus
- References the primary_pain from intake, grounded in the company's reality
- 3–4 sentences
- Example: *"Apollo Hospitals manages clinical data across 72 facilities spanning four states — each with its own EMR, its own data schema, and its own definition of a 'patient record.' As care coordination shifts to value-based models, that fragmentation isn't just a data problem. It's a care quality problem."*

Para 2 — *The implication:*
- What this means for the business right now
- Connects the company's current situation to a measurable risk or missed opportunity
- 2–3 sentences
- Example: *"Every AI initiative in the pipeline — predictive readmissions, SDOH gap identification, population health — is dependent on a unified patient record that doesn't yet exist across the system. That's the bottleneck."*

Para 3 — *Why Teqfocus, why now:*
- Brief, confident, specific
- References a relevant proof point or approach — not a capabilities list
- 2–3 sentences
- Example: *"We've solved this specific architecture problem for other health systems of comparable scale. What we're sharing on this page is how we'd approach it for Apollo."*

---

## Section 4: Our Perspective

**Purpose:** Show that Teqfocus has a specific, considered point of view — not a services brochure.

**Header:** "What we'd focus on for [Company Name]"

**Three recommendations (exactly 3):**

Each recommendation contains:
- A number (`01`, `02`, `03`)
- A title: action-oriented, specific — what Teqfocus will DO, not what they OFFER
  - Good: *"Unify the patient record layer across all 72 facilities"*
  - Bad: *"Data Integration Services"*
- A 2-line description: specific to their situation, references their context
- An outcome line: *"Expected outcome: [specific, measurable result]"*
  - Good: *"A single longitudinal patient record accessible across all care settings within 6 months"*
  - Bad: *"Improved data quality"*
  - If metric is uncertain: *"Typically reduces duplicate records by ~40% [VERIFY]"*

**Common failure modes to avoid:**
- Three recommendations that are just service line names ("Data Strategy", "AI Implementation", "AMS")
- Recommendations that don't reference anything specific about the company
- More than 3 recommendations
- Vague outcomes ("better insights", "improved efficiency")

---

## Section 5: How We've Done This

**Purpose:** Provide social proof. Make the claim credible.

**Header:** "How we've done this before"
**Eyebrow:** "Proof of work"

**Case study structure (3 blocks):**

Block 1 — Challenge:
- 2–3 sentences describing what the client faced
- Must be **industry-matched** to the target account
- Real situation — not a fictional scenario
- If exact case study isn't available: use the approved proof points library

Block 2 — What we built:
- 2–3 sentences describing the solution approach
- Include the technology stack that's most relevant to this account
- Example: *"We built a unified data layer on Snowflake connected to Salesforce Health Cloud, consolidating 8 source systems into a single longitudinal patient record."*

Block 3 — The outcome:
- Verified metrics only — flag unverified with `[VERIFY]`
- 2–3 data points if available
- Example: *"Care coordinators reduced time-to-intervention by 35% [VERIFY]. Readmission flagging accuracy improved from 61% to 84% AUC within 90 days [VERIFY]."*

**Rule:** If no industry-matched case study is available, use the closest vertical
and note: *"From a comparable enterprise deployment."* Never invent a case study.

---

## Section 6: About Teqfocus

**Purpose:** Establish credibility for visitors who don't know Teqfocus yet. Brief.

**Rules:**
- 3 sentences maximum
- Sentence 1: What Teqfocus does and for whom
- Sentence 2: The multi-cloud approach or a key differentiator
- Sentence 3: Where Summit credential surfaces naturally — not announced
- Ends with a link to teqfocus.com

**Example:**
*"Teqfocus is a digital transformation partner for enterprise and mid-market companies — operating across the Data, Analytics, AI, and Application layers on a multi-cloud architecture. We build both the data foundation and the intelligent applications that run on top of it, which means clients work with one partner instead of coordinating three. As a Salesforce Summit Partner with deep deployments in Healthcare, Telecom, and Financial Services, we bring platform-level expertise without the generalist billing rates."*

---

## Section 7: Footer CTA

**Purpose:** Convert the visitor who read to the bottom. The clearest ask on the page.

**Header:** "Ready to explore what this looks like for [Company Name]?"

**Rules:**
- Must name the company specifically — not "Ready to get started?"
- CTA button: same label and URL as the hero CTA
- Nothing else in this section except the button

**Footer below this:**
- Teqfocus logo/name
- "© [YEAR] Teqfocus. All rights reserved."
- No navigation links, no social links, no newsletter signup
