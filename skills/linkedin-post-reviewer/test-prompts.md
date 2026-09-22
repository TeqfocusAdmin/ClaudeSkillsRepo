# Test Prompts for linkedin-post-reviewer Skill

## Test Case 1: Weak Tone + Missing Bridge-Gap Positioning
**Prompt:** "Review this LinkedIn post: 'We just helped a healthcare client implement Salesforce Health Cloud. The results were amazing! Contact us to learn more about our services.'"

**Expected behavior:**
- Checkpoint 1 FAIL: Tone too salesy ("amazing!", generic vendor-speak)
- Checkpoint 2 FAIL: Missing bridge-gap positioning entirely
- Checkpoint 3 FAIL: No industry messaging framework alignment
- Checkpoint 4 FAIL: No competitive SI differentiation
- Checkpoint 5 FAIL: Weak CTA ("contact us to learn more")
- Should provide complete rewritten version with all fixes

---

## Test Case 2: Good Structure, Needs Minor Refinement
**Prompt:** "Review this post for Financial Services: 'Most wealth management firms struggle with fragmented client data across platforms. We recently worked with a mid-sized advisory firm to unify custody, trading, and CRM data using Salesforce Financial Services Cloud and Snowflake. The result: advisors finally had the 360-degree client view they needed to deliver personalized advice. If you're facing similar data silos, let's chat.'"

**Expected behavior:**
- Checkpoint 1 PASS: Solid authority tone
- Checkpoint 2 PARTIAL PASS: Has unification narrative but missing "decades of experience" thread
- Checkpoint 3 PASS: Aligns with FinServ messaging (advisor productivity, client 360)
- Checkpoint 4 FAIL: Missing competitive SI differentiation
- Checkpoint 5 PARTIAL PASS: CTA exists but could be more specific
- Should provide targeted fixes for checkpoints 2, 4, 5

---

## Test Case 3: Strong Post, Should Pass
**Prompt:** "Review this Healthcare post: 'Health Cloud promises a unified patient view. But between vendor demo and live deployment, clinical data sits in Epic, claims live in Facets, and SDOH data hides in community systems. We've spent decades connecting these exact silos for healthcare systems. Last quarter, we helped a regional health network integrate all three — Epic, claims, and SDOH — under Health Cloud + Data Cloud + Snowflake. Now their care coordinators actually see the complete patient story they were promised. If you're stuck between promise and reality on your Health Cloud rollout, DM me — I'll walk you through the integration blueprint we use.'"

**Expected behavior:**
- All checkpoints should PASS
- Tone: Authoritative expert ✅
- Bridge-gap: Explicit vendor promise vs reality ✅
- Industry framework: Healthcare-specific pain points ✅
- Competitive differentiation: "decades connecting these silos" ✅
- CTA: Specific and actionable ✅
- Should output APPROVED verdict

---

## Test Case 4: Generic Cross-Industry Post
**Prompt:** "Review this post: 'Digital transformation is harder than it looks. Many companies invest in Salesforce but don't see the ROI they expected. We help businesses get more value from their technology investments. Reach out if you want to learn more.'"

**Expected behavior:**
- Checkpoint 1 FAIL: Generic platitudes, no authority
- Checkpoint 2 FAIL: Mentions "value" but no bridge-gap narrative
- Checkpoint 3 FAIL: No industry specificity at all
- Checkpoint 4 FAIL: No competitive positioning
- Checkpoint 5 FAIL: Weakest possible CTA
- Verdict: NEEDS REVISION with all five checkpoints flagged

---

## Test Case 5: Missing Target Industry
**Prompt:** "Review this post: 'We just completed a major Data Cloud implementation for a client. The team is thrilled with the results. More details coming soon!'"

**Expected behavior:**
- Should ask: "Which industry is this targeting?"
- Should not proceed with review until industry is specified
- Should explain why industry context is needed for proper review

---

## Test Case 6: Telecom Industry Specific
**Prompt:** "Review this Telecom post: 'Field service for telecom is broken. Techs show up without complete network context. We built a solution connecting Service Cloud to network monitoring systems using MuleSoft and AWS Lambda. Now dispatchers see real-time network health before they send the truck. Faster fixes, fewer repeat visits. If your field service team is flying blind on network issues, let's talk about the integration pattern we've proven works.'"

**Expected behavior:**
- Checkpoint 1 PASS: Good authority tone
- Checkpoint 2 PARTIAL: Has solution but missing "bridge-gap" explicit framing
- Checkpoint 3 PASS: Telecom field service pain point
- Checkpoint 4 PARTIAL: Shows expertise but no explicit SI differentiation
- Checkpoint 5 PASS: Specific CTA
- Should provide minor refinements to strengthen checkpoints 2 and 4

---

## Test Case 7: Retail Industry with Strong Proof
**Prompt:** "Review this Retail post: 'Commerce Cloud promises personalized customer experiences. But when e-commerce, in-store POS, and loyalty programs live in three different systems, personalization stays a vendor demo promise. We've integrated these silos for retail clients for over a decade — most recently for a national apparel chain. Connected Shopify, Square POS, and Salesforce Marketing Cloud using Snowflake as the hub. Now their marketing team sees the unified customer journey vendors promise but rarely deliver. Drop a comment if you're tired of personalization that only works in the demo.'"

**Expected behavior:**
- All checkpoints should PASS
- Strong bridge-gap positioning ✅
- Industry-specific (Retail) ✅
- Decades of experience mentioned ✅
- Natural competitive framing ✅
- Engaging CTA ✅
- Verdict: APPROVED

---

## Test Case 8: Missing CTA Entirely
**Prompt:** "Review this post: 'Most enterprises struggle to connect their data infrastructure to their CRM. Salesforce sits isolated from Snowflake, Databricks stays siloed from customer-facing apps, and AI projects stall because the foundation isn't integrated. We specialize in building these connections — from raw data warehouses through intelligence layers to application interfaces.'"

**Expected behavior:**
- Checkpoint 5 FAIL: No CTA whatsoever
- Other checkpoints may pass or have minor issues
- Should auto-suggest specific CTA options based on post content
- Verdict: NEEDS REVISION (missing CTA is non-negotiable)
