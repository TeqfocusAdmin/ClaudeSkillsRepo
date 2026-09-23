---
name: linkedin-post-reviewer
description: Self-review framework for LinkedIn posts that eliminates GTM director bottleneck. Use this skill whenever the user wants to review a LinkedIn post draft, check if a post is ready to publish, validate messaging alignment, or needs feedback on LinkedIn content before it goes live. Also trigger when user mentions "review this post", "is this ready", "check my LinkedIn draft", "will this pass review", "does this align with our messaging", or wants to avoid revision cycles. Runs posts through five mandatory checkpoints (tone/authority, bridge-gap positioning, industry framework alignment, competitive SI differentiation, conversion clarity) and auto-suggests specific rewrites using Teqfocus frameworks. Make sure to use this skill for ALL LinkedIn content review requests, even informal ones.
---

# LinkedIn Post Reviewer

**Purpose:** Eliminate the GTM director review bottleneck by providing instant, framework-aligned feedback on LinkedIn posts with auto-suggested rewrites.

## Overview

Every Teqfocus LinkedIn post must pass five non-negotiable checkpoints before going live. This skill acts as a pre-flight quality guardian, catching gaps early and auto-suggesting fixes so your team ships approved content without waiting for director review.

## When to Use This Skill

Use this skill whenever:
- Someone asks you to review a LinkedIn post draft
- User says "is this ready to post", "check this", "review this"
- User mentions "will this get approved", "does this align"
- User shares LinkedIn copy and wants feedback
- Before publishing ANY LinkedIn content for Teqfocus

## Required Context

Before reviewing, you MUST have:
1. **The LinkedIn post draft** (full text)
2. **Target industry** (Healthcare, Financial Services, Manufacturing, Retail — or "General" if cross-industry)

If either is missing, ask the user first.

## The Five Checkpoints

### Checkpoint 1: Tone & Authority
**Standard:** Post must sound like thought leadership from an authoritative expert who has solved this problem before.

**What passes:**
- Confident but not arrogant
- Insider knowledge without jargon dumping
- "We've seen this pattern repeatedly" energy
- Positions Teqfocus as experienced guide, not vendor

**What fails:**
- Salesy language ("Our amazing solution...")
- Timid hedging ("We think maybe...")
- Generic platitudes ("Digital transformation is important")
- Vendor-speak ("Best-in-class enterprise-grade...")

**Auto-suggest logic:** Rewrite weak phrases with confident, experience-backed alternatives that position Teqfocus as the expert who's navigated this terrain.

---

### Checkpoint 2: Bridge-the-Gap Positioning
**Standard:** EVERY post must reinforce that Teqfocus bridges the gap between what technology vendors PROMISE and what end users ACTUALLY GET as business outcomes.

**What passes:**
Must include (explicitly or implicitly):
- Technology expertise
- Industry expertise  
- Decades of experience
- The gap between vendor promise and business outcome

**What fails:**
- Post talks only about technology capabilities
- Post talks only about industry trends
- Missing the "gap" narrative entirely
- Sounds like a tech vendor pitch

**Auto-suggest logic:** Insert the bridge-the-gap narrative naturally. Show where vendor promise stops and where Teqfocus delivery begins. Thread in expertise markers.

---

### Checkpoint 3: Industry Messaging Framework Alignment
**Standard:** Posts targeting a specific industry MUST align with the approved messaging framework for that industry. Zero deviation.

**What passes:**
- Uses framework language for that industry
- Mirrors framework positioning pillars
- Addresses framework-approved pain points
- Follows framework narrative arc

**What fails:**
- Generic messaging not tailored to industry
- Contradicts framework positioning
- Uses competitor framing instead of framework
- Missing industry-specific context

**How to check:**
1. Load `/mnt/skills/user/teqfocus-gtm/SKILL.md` to access industry messaging frameworks
2. Identify which industry the post targets
3. Verify post aligns with that framework's language and positioning
4. If no framework exists for that industry, flag it

**Auto-suggest logic:** Rewrite sections to match framework language. Pull specific phrases and positioning from the framework document.

---

### Checkpoint 4: Competitive SI Differentiation (CIO Playbook)
**Standard:** Post must differentiate Teqfocus against key Salesforce SIs in market using insights from the CIO campaign playbook.

**What passes:**
- References CIO priorities/aspirations from playbook
- Shows how vendors already address these (proving market validation)
- Positions Teqfocus as the SI that delivers on those vendor promises
- Subtle but clear differentiation from other SIs

**What fails:**
- Generic SI positioning ("We implement Salesforce")
- No connection to CIO buying priorities
- Missing vendor promise → Teqfocus delivery arc
- Sounds like every other SI

**How to check:**
1. Load CIO campaign playbook reference (if available in project)
2. Verify post connects to documented CIO priorities
3. Check that post shows vendor promise + Teqfocus delivery
4. Confirm differentiation is present (even if subtle)

**Auto-suggest logic:** Insert CIO priority context, show vendor validation, position Teqfocus as delivery partner that closes the gap.

---

### Checkpoint 5: Conversion Clarity
**Standard:** Post must have a crystal-clear call-to-action that drives engagement or lead capture. Natural, not pushy.

**What passes:**
- Clear next step (comment, DM, click link, book call)
- Feels organic to the post
- Low friction
- Specific action

**What fails:**
- No CTA at all
- Vague ask ("Let me know your thoughts")
- Multiple competing CTAs
- Awkward or salesy closer

**Auto-suggest logic:** Add or strengthen CTA. Make it specific, natural, and aligned with post intent.

---

## Review Process

### Step 1: Gather Requirements
Ask the user for:
1. LinkedIn post draft (full text)
2. Target industry

### Step 2: Load Required Context
Before reviewing, load these reference documents:
- `/mnt/skills/user/teqfocus-gtm/SKILL.md` (for industry frameworks and core positioning)
- CIO campaign playbook (if available in project)

### Step 3: Run All Five Checkpoints
For each checkpoint:
1. Evaluate against the standard
2. Mark as ✅ GREEN (pass) or 🚨 RED (fail)
3. If RED, provide auto-suggested rewrite with explanation

### Step 4: Present Results

Output format:

```
LINKEDIN POST REVIEW
====================

CHECKPOINT 1: TONE & AUTHORITY
Status: [✅ PASS or 🚨 FAIL]
[If FAIL: Issue description + auto-suggested rewrite + why it works]

CHECKPOINT 2: BRIDGE-THE-GAP POSITIONING  
Status: [✅ PASS or 🚨 FAIL]
[If FAIL: Issue description + auto-suggested rewrite + why it works]

CHECKPOINT 3: INDUSTRY FRAMEWORK ALIGNMENT
Status: [✅ PASS or 🚨 FAIL]
[If FAIL: Issue description + auto-suggested rewrite + why it works]

CHECKPOINT 4: COMPETITIVE SI DIFFERENTIATION
Status: [✅ PASS or 🚨 FAIL]
[If FAIL: Issue description + auto-suggested rewrite + why it works]

CHECKPOINT 5: CONVERSION CLARITY
Status: [✅ PASS or 🚨 FAIL]
[If FAIL: Issue description + auto-suggested rewrite + why it works]

---

FINAL VERDICT: [APPROVED ✅ or NEEDS REVISION 🚨]

[If NEEDS REVISION: Priority order of fixes — which checkpoint to tackle first]
```

### Step 5: Provide Complete Revised Version
If any checkpoints failed, provide a complete revised version of the post that incorporates ALL auto-suggested fixes. Don't just show fragments — give them copy-paste-ready text.

---

## Auto-Suggest Guidelines

When writing auto-suggested rewrites:

1. **Keep original intent** — Don't change what the user was trying to say, just elevate how they say it
2. **Be specific** — Don't just say "add bridge-the-gap positioning", show them the exact sentence
3. **Explain why** — After each suggestion, explain why this rewrite works better
4. **Make it copy-paste ready** — User should be able to grab your suggestion and drop it in
5. **Preserve voice** — Keep it sounding like Teqfocus, not generic corporate speak

---

## Example Review Flow

**User:** "Review this post: 'We just helped a healthcare client implement Salesforce Health Cloud. The results were amazing!'"

**Your response:**
1. Ask: "Which industry is this targeting? Healthcare?"
2. Load teqfocus-gtm skill to access frameworks
3. Run all five checkpoints
4. Identify fails: Tone (too salesy), Bridge-gap (missing), Framework alignment (too generic), Differentiation (none), CTA (none)
5. Provide auto-suggested rewrites for each
6. Output complete revised version

---

## Important Notes

- **Never skip checkpoints** — All five must be evaluated every time
- **Always load frameworks first** — You need context to do this properly
- **Be surgical** — Keep good parts, only fix what's broken
- **No false positives** — Don't flag something just to flag it; if it passes, say so
- **Complete rewrites** — Don't leave the user with fragments to assemble

---

## Success Criteria

This skill succeeds when:
- Posts pass review on first GTM director look (80%+ approval rate)
- Revision cycles drop from 2-3 rounds to 0-1 rounds
- Team ships content faster without quality drop
- GTM director time is freed for strategy, not line edits

---

## References

For industry messaging frameworks and core Teqfocus positioning, always read:
- `references/teqfocus-gtm.md` (created from the main GTM skill)

For CIO campaign playbook context (if user provides it):
- `references/cio-playbook.md`
