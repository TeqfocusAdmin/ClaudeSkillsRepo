---
name: teqfocus-profile-optimizer
description: Rebuild a Teqfocus team member's LinkedIn profile for conversion — headline, About section, experience entries, featured section, and banner/photo direction. Use this skill whenever the user wants to optimize, rewrite, audit, or refresh a LinkedIn profile for anyone at Teqfocus (Avi, Jas, AEs, SDRs, consultants) or asks "fix my headline", "rewrite my About section", "my profile isn't converting", "profile audit", or "make my LinkedIn match our positioning". Always load teqfocus-gtm first for positioning context.
---

# Teqfocus LinkedIn Profile Optimizer

Turns a Teqfocus team member's profile from a resume into a conversion asset. A profile has one job: a CIO, CDO, or RevOps leader lands on it after seeing a post or receiving a DM, and within 8 seconds decides whether this person is worth a reply.

**Prerequisite:** Read `/mnt/skills/user/teqfocus-gtm/SKILL.md` first. All positioning, wedges, and voice rules inherit from it.

## Inputs to collect

1. Current profile (paste or screenshot) — headline, About, experience, featured
2. Role at Teqfocus and who they sell/speak to (persona: CIO / CDO / RevOps / VP Sales)
3. Their strongest personal proof: deals closed, projects delivered, verticals owned
4. Primary conversion goal: booked meeting · newsletter subscribe · TeqTalk listen · connection accept

## The rebuild — five components

### 1. Headline (220 chars)
Formula: **[Who they help] + [outcome] + [credibility anchor]**. Never a job title alone.
- Bad: "Account Executive at Teqfocus"
- Good: "Helping healthcare CIOs connect Salesforce to the data underneath it | Teqfocus (Salesforce Summit Partner)"
- Rules: no banned words (leverage, synergy, holistic, best-in-class, cutting-edge, robust, end-to-end solutions). Persona-specific outcome, not a service list.

### 2. About section (3 blocks, ~1,200 chars)
- **Block 1 — the problem they see** (2–3 sentences): open with the buyer's pain in the buyer's language. Never open with "I" or "We".
- **Block 2 — how they work on it** (3–4 sentences): the Teqfocus bridge-gap position — data + Salesforce + AI, not one silo. Surface the Summit credential once, naturally, mid-sentence.
- **Block 3 — proof + CTA** (2–3 sentences): one white-labeled outcome (flag `[VERIFY]` on any metric), then exactly one CTA matching the conversion goal.

### 3. Experience entries
Rewrite the Teqfocus entry as outcomes, not responsibilities. 3 bullets max, each: verb + what + measurable result (`[VERIFY]` if unconfirmed). Prior roles: compress to one line each unless directly relevant to the persona.

### 4. Featured section (4 slots)
Recommend in priority order: 1) best-performing recent post, 2) a TeqTalk episode relevant to their persona, 3) a case study or vertical page (route creation to GTM Assets if it doesn't exist), 4) meeting booking link.

### 5. Visual direction (route production to teqfocus-design)
- Banner: brief only — persona-relevant statement + Teqfocus brand purple, teqfocus.com, no stock imagery
- Photo: guidance on framing/background; never generate a face

## Output format

Deliver as a single before/after document: current text → rewritten text → one-line rationale per component. End with a 15-minute implementation checklist the person can execute themselves.

## QA gate

Run content-reviewer checkpoints before delivering. Run humanizer on all rewritten copy. Verify: no banned words, no banned openers, one CTA total in the About section, Summit credential appears exactly once across the whole profile.
