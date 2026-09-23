---
name: content-reviewer
description: Self-review framework for ALL Teqfocus marketing and sales content that eliminates GTM director bottleneck. Use this skill whenever the user wants to review ANY content before it goes live — LinkedIn posts, email sequences, sales decks, one-pagers, case studies, event invites, blog posts, website copy, ABM microsites, proposals, webinar scripts, or any GTM asset. Also trigger when user mentions "review this", "is this ready", "check this content", "will this pass review", "does this align with our messaging", or wants to avoid revision cycles. Runs content through five mandatory checkpoints (tone/authority, bridge-gap positioning, industry framework alignment, competitive SI differentiation, conversion clarity) and auto-suggests specific rewrites using Teqfocus frameworks. Make sure to use this skill for ALL Teqfocus content review requests, regardless of format or channel.
---

# Teqfocus Content Reviewer

**Purpose:** Eliminate the GTM director review bottleneck by providing instant, framework-aligned feedback on ANY Teqfocus content with auto-suggested rewrites.

## Overview

Every piece of Teqfocus content — whether it's a LinkedIn post, email sequence, sales deck, one-pager, case study, blog post, website copy, ABM microsite, proposal, or webinar script — must pass five non-negotiable checkpoints before going live. This skill acts as a pre-flight quality guardian, catching gaps early and auto-suggesting fixes so your team ships approved content without waiting for director review.

## When to Use This Skill

Use this skill whenever you need to review ANY Teqfocus content:

**Social & Content Marketing:**
- LinkedIn posts, articles, carousels
- Blog posts and website copy
- Case studies and customer stories
- TeqTalk newsletters and repurposing
- Social media copy (Twitter, Facebook, etc.)

**Sales & ABM:**
- Sales decks and pitch decks
- One-pagers and capability briefs
- ABM microsites and personalized pages
- Proposals and RFP responses
- Battlecards and competitive guides

**Demand Gen & Campaigns:**
- Email sequences (cold, warm, nurture)
- Event invites and webinar copy
- Landing pages and campaign pages
- Lead magnet copy
- Follow-up sequences

**Internal & Partner:**
- Executive briefing documents
- Partner co-marketing assets
- Internal campaign briefs
- QBR narratives

**Trigger phrases:**
- "Review this [content type]"
- "Is this ready to send/publish/use?"
- "Check this before I share it"
- "Will this get approved?"
- "Does this align with our messaging?"
- "Give me feedback on this"

## Required Context

Before reviewing, you MUST have:
1. **The content draft** (full text or file)
2. **Content type** (LinkedIn post, email, deck, one-pager, blog post, etc.)
3. **Target industry** (Healthcare, Financial Services, Telecom, Retail, Hi-Tech — or "General" if cross-industry)
4. **Target persona** (CIO/CTO, CDO, RevOps, VP Sales — or "Mixed" if multiple)

If any are missing, ask the user first.

## The Five Checkpoints

These five checkpoints apply to ALL content types. The standards remain the same; only the application varies by format.

---

### Checkpoint 1: Tone & Authority

**Standard:** Content must sound like thought leadership from an authoritative expert who has solved this problem before.

**What passes:**
- Confident but not arrogant
- Insider knowledge without jargon dumping
- "We've seen this pattern repeatedly" energy
- Positions Teqfocus as experienced guide, not vendor
- Appropriate formality for the content type (deck = formal, LinkedIn = conversational)

**What fails:**
- Salesy language ("Our amazing solution...")
- Timid hedging ("We think maybe...")
- Generic platitudes ("Digital transformation is important")
- Vendor-speak ("Best-in-class enterprise-grade...")

**Content-type adjustments:**
- **Sales deck:** More formal, credential-heavy, proof-driven
- **LinkedIn post:** Conversational thought leadership, insider tone
- **Email:** Direct, personal, time-respectful
- **One-pager:** Crisp, executive-level, outcome-focused
- **Blog post:** Educational authority, teach-don't-sell
- **Proposal:** Consultative partner, not vendor bid
- **Website copy:** Clear, confident, conversion-oriented
- **Case study:** Client success story, specific outcomes

**Auto-suggest logic:** Rewrite weak phrases with confident, experience-backed alternatives appropriate to the content format.

---

### Checkpoint 2: Bridge-the-Gap Positioning

**Standard:** EVERY piece of content must reinforce that Teqfocus bridges the gap between what technology vendors PROMISE and what end users ACTUALLY GET as business outcomes.

**What passes:**
Must include (explicitly or implicitly):
- Technology expertise
- Industry expertise  
- Decades of experience
- The gap between vendor promise and business outcome

**What fails:**
- Content talks only about technology capabilities
- Content talks only about industry trends
- Missing the "gap" narrative entirely
- Sounds like a tech vendor pitch

**Content-type adjustments:**
- **Sales deck:** Full slide dedicated to "The Gap" with before/after
- **LinkedIn post:** Lead with vendor promise, show the gap, position Teqfocus as bridge
- **Email:** One paragraph that establishes the gap context
- **One-pager:** "The Challenge" section explicitly frames the gap
- **Blog post:** Article premise built on promise-vs-reality tension
- **Proposal:** "Current State vs Desired State" section shows the gap
- **Website copy:** Hero section or value prop positions Teqfocus as the bridge
- **Case study:** "The Challenge" section describes client's gap experience

**Auto-suggest logic:** Insert the bridge-the-gap narrative naturally for the content format. Show where vendor promise stops and where Teqfocus delivery begins. Thread in expertise markers appropriate to the medium.

---

### Checkpoint 3: Industry Messaging Framework Alignment

**Standard:** Content targeting a specific industry MUST align with the approved messaging framework for that industry. Zero deviation.

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
2. Identify which industry the content targets
3. Verify content aligns with that framework's language and positioning
4. If no framework exists for that industry, flag it

**Content-type adjustments:**
- **Sales deck:** Every slide must use industry-specific terminology
- **LinkedIn post:** Industry pain point in opening hook
- **Email:** Subject line + first paragraph must signal industry relevance
- **One-pager:** Industry-specific challenge and stack references
- **Blog post:** Title, intro, and examples must be industry-contextualized
- **Proposal:** Industry context in executive summary
- **Website copy:** Industry landing pages use framework language
- **Case study:** Client industry prominently featured

**Auto-suggest logic:** Rewrite sections to match framework language for the content format. Pull specific phrases and positioning from the framework document.

---

### Checkpoint 4: Competitive SI Differentiation

**Standard:** Content must differentiate Teqfocus against key Salesforce SIs in market using insights from the CIO campaign playbook.

**What passes:**
- References CIO priorities/aspirations from playbook (where applicable)
- Shows how vendors already address these (proving market validation)
- Positions Teqfocus as the SI that delivers on those vendor promises
- Subtle but clear differentiation from other SIs

**What fails:**
- Generic SI positioning ("We implement Salesforce")
- No connection to buyer priorities
- Missing vendor promise → Teqfocus delivery arc
- Sounds like every other SI

**How to check:**
1. Load CIO campaign playbook reference (if available in project)
2. Verify content connects to documented buyer priorities
3. Check that content shows vendor promise + Teqfocus delivery
4. Confirm differentiation is present (even if subtle)

**Content-type adjustments:**
- **Sales deck:** Competitive slide with 3-column comparison (Big SI / SF-only SI / Teqfocus)
- **LinkedIn post:** Subtle positioning ("Most implementations stop at...")
- **Email:** One sentence that differentiates approach
- **One-pager:** "Our Approach" section shows differentiation
- **Blog post:** Educational content that inherently shows deeper expertise
- **Proposal:** "Why Teqfocus" section with competitive framing
- **Website copy:** Service descriptions emphasize full-stack capability
- **Case study:** Outcome metrics that other SIs typically don't deliver

**Auto-suggest logic:** Insert buyer priority context, show vendor validation, position Teqfocus as delivery partner that closes the gap. Adjust prominence based on content format (more explicit in sales materials, more subtle in thought leadership).

---

### Checkpoint 5: Conversion Clarity

**Standard:** Content must have a crystal-clear call-to-action appropriate to the content type and buyer stage. Natural, not pushy.

**What passes:**
- Clear next step appropriate to content type
- Feels organic to the content
- Low friction
- Specific action

**What fails:**
- No CTA at all
- Vague ask ("Let me know your thoughts")
- Multiple competing CTAs
- Awkward or salesy closer
- Wrong CTA for content type (e.g., "Buy now" in awareness content)

**Content-type CTAs:**
- **Sales deck:** "Next steps" slide with meeting follow-up action
- **LinkedIn post:** "Comment if...", "DM me for...", "Drop a 👍 if..."
- **Email (cold):** "Reply with [specific info]" or "Book 15 min [link]"
- **Email (warm):** "Reply yes to get [specific asset]"
- **Email (nurture):** "Download the [resource]" or "Register for [event]"
- **One-pager:** "Book discovery call: [link]" or "Email [specific contact]"
- **Blog post:** "Download the guide" or "Subscribe for [next topic]"
- **Proposal:** "Accept by [date] to begin [specific phase]"
- **Website copy:** Button CTA (contextual to page)
- **Case study:** "Book a similar engagement discussion: [link]"
- **Event invite:** "RSVP by [date]: [link]"
- **Webinar:** "Register here: [link]"

**Auto-suggest logic:** Add or strengthen CTA appropriate to content type and buyer stage. Make it specific, natural, and aligned with content intent.

---

## Review Process

### Step 1: Gather Requirements
Ask the user for:
1. Content draft (full text or file)
2. Content type (LinkedIn, email, deck, one-pager, etc.)
3. Target industry
4. Target persona

### Step 2: Load Required Context
Before reviewing, load these reference documents:
- `/mnt/skills/user/teqfocus-gtm/SKILL.md` (for industry frameworks and core positioning)
- `references/teqfocus-gtm.md` (this skill's reference file)
- CIO campaign playbook (if available in project)

### Step 3: Run All Five Checkpoints
For each checkpoint:
1. Evaluate against the standard
2. Apply content-type-specific lens
3. Mark as ✅ GREEN (pass) or 🚨 RED (fail)
4. If RED, provide auto-suggested rewrite with explanation

### Step 4: Present Results

Output format:

```
TEQFOCUS CONTENT REVIEW
=======================
Content Type: [LinkedIn Post / Email / Deck / etc.]
Target Industry: [Healthcare / FinServ / etc.]
Target Persona: [CIO / CDO / RevOps / VP Sales]

---

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
If any checkpoints failed, provide a complete revised version that incorporates ALL auto-suggested fixes. Don't just show fragments — give them copy-paste-ready content.

For longer content (decks, proposals, blogs), provide section-by-section fixes rather than rewriting the entire piece.

---

## Content-Type-Specific Guidelines

### Sales Decks & Pitch Decks
- All five checkpoints apply to the full deck narrative
- Bridge-gap positioning gets dedicated slide
- Industry framework must be visible in problem/solution framing
- Competitive differentiation gets explicit slide (3-column comparison)
- CTA is "Next Steps" slide with meeting action

### Email Sequences
- Each email in sequence must independently pass checkpoints
- Bridge-gap can be threaded across sequence (email 1: promise, email 2: gap, email 3: Teqfocus)
- Industry alignment must be in subject line + opening
- Competitive differentiation more subtle in cold emails, more explicit in later touches
- CTA varies by sequence position (reply, book time, download asset)

### One-Pagers
- All five checkpoints condensed into single-page format
- Bridge-gap in "Challenge" section
- Industry framework in problem statement
- Competitive differentiation in "Our Approach"
- CTA at bottom (book call or email contact)

### Blog Posts & Website Copy
- Bridge-gap is article premise or page value prop
- Industry framework in title, intro, examples
- Competitive differentiation through demonstrated expertise (not explicit comparison)
- CTA appropriate to awareness stage (download, subscribe, not "buy now")

### ABM Microsites
- All five checkpoints with account-specific personalization
- Bridge-gap framed around target account's known challenges
- Industry framework plus account-specific context
- Competitive differentiation shows why Teqfocus over alternatives in their consideration set
- CTA is high-value offer (assessment, briefing, etc.)

### Proposals & RFP Responses
- All five checkpoints in executive summary
- Bridge-gap in "Current State vs Desired State"
- Industry framework throughout solution narrative
- Competitive differentiation in "Why Teqfocus" section
- CTA is acceptance with clear next steps

### Case Studies
- Bridge-gap in "Challenge" section (client's gap experience)
- Industry framework in client context
- Competitive differentiation through specific outcomes other SIs don't typically deliver
- CTA is "book similar engagement" discussion

---

## Auto-Suggest Guidelines

When writing auto-suggested rewrites:

1. **Keep original intent** — Don't change what the user was trying to say, just elevate how they say it
2. **Be specific** — Don't just say "add bridge-gap positioning", show them the exact text
3. **Explain why** — After each suggestion, explain why this rewrite works better
4. **Make it copy-paste ready** — User should be able to grab your suggestion and drop it in
5. **Preserve voice** — Keep it sounding like Teqfocus, not generic corporate speak
6. **Respect format** — Don't rewrite a conversational email into a formal deck voice
7. **Consider buyer stage** — Awareness content is educational; decision content is consultative

---

## Important Notes

- **Never skip checkpoints** — All five must be evaluated every time, regardless of content type
- **Always load frameworks first** — You need context to do this properly
- **Be surgical** — Keep good parts, only fix what's broken
- **No false positives** — Don't flag something just to flag it; if it passes, say so
- **Complete rewrites** — Don't leave the user with fragments to assemble
- **Format-appropriate fixes** — A deck needs different treatment than a LinkedIn post
- **Respect content length** — For long-form content (blogs, proposals, decks), provide section-specific fixes, not full rewrites

---

## Success Criteria

This skill succeeds when:
- Content passes GTM director review on first submission (80%+ approval rate)
- Revision cycles drop from 2-3 rounds to 0-1 rounds
- Team ships content faster without quality drop
- GTM director time is freed for strategy, not line edits
- Content quality improves across ALL formats and channels

---

## References

For industry messaging frameworks and core Teqfocus positioning:
- `references/teqfocus-gtm.md` (essential positioning reference)
- `/mnt/skills/user/teqfocus-gtm/SKILL.md` (full GTM skill with all frameworks)

For CIO campaign playbook context (if user provides it):
- `references/cio-playbook.md`
