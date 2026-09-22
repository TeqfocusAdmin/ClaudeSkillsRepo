---
name: teqfocus-post-frameworks
description: Turn any topic into a ready-to-publish LinkedIn post using a named copywriting framework — PAS, AIDA, BAB, STAR, or SLAY — adapted to Teqfocus voice. Use this skill whenever the user gives a topic and wants a structured post fast, mentions any of these frameworks by name, asks "format this as a post", "structure this idea", or wants multiple structural takes on the same topic. Pairs with teqfocus-hook-generator (hook first) and teqfocus-post-scorer (score after).
---

# Teqfocus Post Frameworks

Five named structures for turning a raw topic into a publishable post. The framework choice depends on where the reader is: unaware of the problem, aware but stuck, or ready to act.

**Prerequisite:** Read `/mnt/skills/user/teqfocus-gtm/SKILL.md` first. Every framework fills with Teqfocus positioning, not generic copy.

## Framework selection

| Reader state | Framework | Why |
|---|---|---|
| Doesn't feel the pain yet | **PAS** (Problem–Agitate–Solve) | Makes the invisible cost visible |
| Feels pain, hasn't pictured the fix | **BAB** (Before–After–Bridge) | Sells the destination, then the path |
| Evaluating options | **AIDA** (Attention–Interest–Desire–Action) | Builds a case toward one action |
| Needs proof | **STAR** (Situation–Task–Action–Result) | Case-study shape; strongest with a named or white-labeled client |
| Needs a strong opinion | **SLAY** (Story–Lesson–Application–You) | Practitioner POV; best for Avi/Jas personal profiles |

When the user doesn't specify, pick based on reader state and say why in one line.

## Fill rules per framework

- **PAS**: Problem in the buyer's words (1–2 lines) → Agitate with the downstream cost — forecast misses, stalled AI projects, quarter-end reconciliation pain (3–4 lines) → Solve with the pattern, not the pitch; Teqfocus appears once, late.
- **BAB**: Before = current state a CIO would recognize instantly → After = the operating state, concrete ("month-end reconciliation becomes exception review") → Bridge = how, in 2–3 lines, credential surfacing naturally.
- **AIDA**: Attention via hook-generator mechanism → Interest = the insight → Desire = one white-labeled outcome, `[VERIFY]` any metric → Action = exactly one CTA.
- **STAR**: Route to customer-marketing skill first if a real client story is in scope (naming approval required). Fill only with verified detail; every metric flagged `[VERIFY]` until confirmed.
- **SLAY**: Story = real practitioner moment → Lesson = the transferable principle → Application = how the reader uses it Monday → You = a question back to the reader, not a pitch.

## Universal rules

- Hook comes from teqfocus-hook-generator — never write the body first.
- Line breaks every 1–2 sentences. Mobile-first.
- One CTA per post. Comment-bait CTAs ("agree?") allowed only on SLAY.
- Banned words and banned openers enforced. American English.
- Competitor mentions use the correct wedge from the GTM Brain wedge table — never improvised.

## Output format

Deliver the post ready to paste, framework labeled at top (label removed before publishing), then a one-line note on best posting persona (company page vs. personal) and day/time if history data exists. Run through humanizer, then recommend teqfocus-post-scorer + linkedin-post-reviewer before shipping.
