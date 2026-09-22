---
name: teqfocus-impeccable
description: >
  Design audit and improvement skill for Teqfocus — applies Impeccable's
  command-driven framework to Teqfocus UI output. Use when reviewing, auditing,
  polishing, or critiquing any Teqfocus frontend interface, ABM microsite,
  prototype, demo, or designed artifact. Trigger with commands: /audit,
  /polish, /critique, /distill, /animate, /bolder, /quieter. Also trigger
  when the user says "audit this page," "polish this component," "this is
  too busy," "make it bolder," "critique the design," or "is this ready to
  ship?" Works in claude.ai (reviewing designs and copy) and Claude Code
  (reviewing and improving generated UI code).
---

# Teqfocus Impeccable — Design Audit & Polish

Design audit and improvement system for all Teqfocus visual output.
Adapted from Impeccable (pbakaus) with Teqfocus brand system applied.

Before any audit or polish pass, establish context:
- What is this? (ABM microsite / demo artifact / TeqTalk carousel / one-pager)
- Who sees it? (Named CIO / CDO / warm prospect / cold traffic)
- What should they do? (Book a call / download / request a demo)

Context determines the standard. An ABM microsite for a Tier 1 named account
needs more craft than an internal one-pager.

---

## The Two Registers

### Brand mode (marketing surfaces)
ABM microsites, one-pagers, event pages, TeqTalk visuals, social cards.
**Design IS part of the message.** Premium quality signals Teqfocus quality.
Rules: bolder typography, more generous white space, distinct visual identity.

### Product mode (functional surfaces)
Demo dashboards, Agentforce agent interfaces, data visualization artifacts,
internal tools, client delivery documents.
**Design SERVES the function.** Clarity and efficiency come first.
Rules: higher information density acceptable, consistent patterns over
distinctive aesthetics, performance over decoration.

---

## Commands

Invoke with `/[command]` or describe what you want reviewed.

---

### /audit
Full quality check across 5 dimensions. Run before any Teqfocus asset ships.

**Accessibility:**
- [ ] Color contrast: body text `#244495` on white `#FFFFFF` — passes AA
- [ ] Color contrast: `#BD72EF` on white — check for small text (fails AA at small sizes, passes AA at 18px+)
- [ ] All interactive elements keyboard-focusable
- [ ] Focus states visible and on-brand (not browser default blue)
- [ ] Images have alt text or are marked decorative
- [ ] Form fields have labels (not just placeholder text)

**Performance:**
- [ ] No images over 200KB without lazy loading
- [ ] Fonts loaded via Google Fonts `@import` — not self-hosted without preload
- [ ] No render-blocking resources in `<head>`
- [ ] CSS animations use `transform` and `opacity` only — never `width`, `height`, `left`, `top`
- [ ] Page under 3 seconds on 3G mobile (test with PageSpeed Insights)

**Responsive:**
- [ ] Layout verified at 375px (iPhone SE — minimum target)
- [ ] Layout verified at 768px (tablet)
- [ ] Layout verified at 1280px (laptop)
- [ ] No horizontal scroll at any viewport
- [ ] Text readable without zoom at all viewports (minimum 16px body)
- [ ] Touch targets minimum 44px (CTA buttons, links)

**Visual hierarchy:**
- [ ] Primary CTA visible above fold without scrolling
- [ ] Clear heading hierarchy: one H1, logical H2/H3 sequence
- [ ] No competing visual weights at the same level
- [ ] White space used to group related elements and separate sections

**Brand compliance:**
- [ ] White `#FFFFFF` background throughout
- [ ] All hex values from Teqfocus palette
- [ ] Poppins font applied (not Inter, Roboto, or system fallback)
- [ ] Single CTA per section — no competing actions
- [ ] No invented metrics — `[VERIFY]` flag on any unconfirmed number

---

### /polish
Final pass before shipping. Catches the invisible details.

Run after content is finalized. Polish is not revision — it is refinement.

**Alignment scan:**
- Are all left edges on the same grid line?
- Do card grids align on both horizontal and vertical axes?
- Does text align with icon baselines within components?

**Spacing scan:**
- Is all spacing on the 8px grid? (8/16/24/32/48/64/96px)
- Are section paddings consistent across the page?
- Does white space feel proportional — same visual weight above and below headings?

**Typography micro-details:**
- Any widow words in headings? (Single word on the last line — rewrite or force break)
- Em dashes vs hyphens correct? (Use — not -)
- Apostrophes curly? (' not ')
- Ellipses character? (… not ...)
- Numbers in copy: thousands separator present? ($1,200 not $1200)

**Interaction polish:**
- Every button has a hover state?
- Every card has a hover state?
- Focus rings present on keyboard focus?
- Active/pressed state on primary CTA?

**Color micro-details:**
- Any element using pure `#000000`? Replace with `#244495` or `#59267E`
- Any shadow using pure black? Use `rgba(89, 38, 126, 0.10)` instead
- Gradient direction consistent? All Teqfocus gradients: `135deg, #BD71EF, #8D9BF5`

---

### /critique
UX review: hierarchy, clarity, and message alignment.

Answer these questions for the asset in scope:

**The 5-second test:**
Does the primary message land in 5 seconds without scrolling?
What does someone know after 5 seconds: who this is, what it offers, why it matters?

**The CTA test:**
Is there exactly one primary action?
Does the button copy name the specific action? ("Book a data readiness review" not "Contact us")
Is the CTA visible without scrolling?

**The buyer test:**
Does this page speak to one persona — or try to speak to everyone?
Does it use the buyer's language — or vendor language?
Is the proof industry-matched to the buyer it's targeting?

**The competitor test:**
Could this page appear on a competitor's site without changing a word?
If yes: what needs to change to make it unmistakably Teqfocus?

**The objection test:**
What is the primary fear a CIO has about this page?
Is that fear addressed anywhere?

---

### /distill
Strip to essence. Remove complexity that doesn't earn its place.

**Content distillation:**
- Identify the single most important message. Does it lead?
- For every element: if removed, does the page lose meaning? If no — remove it.
- For every sentence in body copy: what is it doing? If the answer is "restating
  what was already said" — cut it.

**Visual distillation:**
- For every decorative element: does it carry information? If no — remove it.
- For every color: is it doing a job (hierarchy, brand, emphasis)? If not — remove it.
- For every animation: does it direct attention or confirm interaction? If not — remove it.

**CTA distillation:**
A distilled page has one hero section, one narrative arc, one CTA.
If there are multiple CTAs — rank them, make one primary (full color), others secondary (outline).

---

### /animate
Add purposeful motion. Not decoration.

**Before adding any animation, answer:**
1. What functional purpose does this motion serve?
   (direct attention / confirm interaction / show relationship / indicate loading)
2. Would the absence of this animation confuse or frustrate the user?

If neither answer is clear — don't animate.

**Teqfocus animation recipe:**

Scroll-reveal for content sections:
```css
/* Elements animate in as they enter the viewport */
.tq-reveal {
  opacity: 0;
  transform: translateY(12px);
  transition: opacity 350ms ease-out, transform 350ms ease-out;
}
.tq-reveal.visible {
  opacity: 1;
  transform: translateY(0);
}
```

Staggered children (for card grids):
```css
.tq-card:nth-child(1) { transition-delay: 0ms; }
.tq-card:nth-child(2) { transition-delay: 60ms; }
.tq-card:nth-child(3) { transition-delay: 120ms; }
```
Maximum 3 children staggered — beyond that the last card waits too long.

Accent bar shimmer on load (ABM microsite only — use sparingly):
```css
@keyframes tq-bar-in {
  from { opacity: 0; transform: scaleX(0); transform-origin: left; }
  to   { opacity: 1; transform: scaleX(1); }
}
.tq-accent-bar {
  animation: tq-bar-in 400ms ease-out forwards;
}
```

---

### /bolder
The design is too safe. Make a committed aesthetic choice.

**Typography:**
- Increase hero headline size by 20%
- Increase font weight on primary headings (600 → 700)
- Add `letter-spacing: -0.02em` to display-size headlines

**Color:**
- Make the primary CTA button `#BD72EF` fill larger (more padding, full width on mobile)
- Use `#BD72EF` at full opacity for the dominant accent — not at 50% opacity
- Left accent bars: increase from 4px to 6px

**Layout:**
- Increase section padding by 40%
- Make the hero headline the dominant visual element — it should read first, everything else second
- Add one large visual element (stat callout, illustration, or diagram) that gives the page a clear focal point

**Motion:**
- Add the scroll-reveal from `/animate` if not already present
- Make hover states more pronounced (larger shadow, more saturated color)

---

### /quieter
The design is too loud. Reduce visual noise.

**Typography:**
- Reduce font weights: wherever 700 appears in body or labels, shift to 600
- Remove all-caps labels that aren't essential navigation
- Reduce number of distinct text colors to maximum 3: `#59267E`, `#7751E2`, `#244495`

**Color:**
- Audit every use of `#BD72EF` — keep only CTA buttons and primary accent bars
- Replace other `#BD72EF` instances with `#D48EEF` (lighter orchid) or `#E2B0F3` (mauve)
- Remove any gradient that isn't the Teqfocus brand bar

**Layout:**
- Remove one section that is restating something said elsewhere
- Reduce card grid from 3 columns to 2 if the content feels dense
- Increase white space between sections by 50%

**Motion:**
- Remove any decorative animations
- Slow down any transition over 200ms that doesn't need to be that slow

---

## The Teqfocus Anti-Pattern Library

27 patterns that undermine Teqfocus design quality. Check every asset.

**Typography anti-patterns:**
1. Inter, Roboto, Arial, or system-ui as the primary font — use Poppins
2. Two font weights within 100 of each other on adjacent elements (e.g., 600 and 700 headings side by side)
3. Body text running wider than 680px
4. Heading with a widow word (single word on last line)
5. Centered body text (more than 2 lines) — always left-align body
6. All-caps body text (fine for labels; never for sentences)

**Color anti-patterns:**
7. Pure black `#000000` text — use `#244495` for body, `#59267E` for headings
8. Purple-to-blue gradient as a page background (it's an accent, not a canvas)
9. `#BD72EF` (light purple) used for body text — it's an accent color, not a text color
10. More than 4 distinct colors visible on a single screen
11. Color combinations not in the Teqfocus palette
12. Low-contrast text: anything lighter than `#7751E2` on white at body text size

**Layout anti-patterns:**
13. Cards nested inside cards nested inside cards
14. Rounded-square icon tile above every heading — overused AI pattern
15. 3-column feature grid with equal-weight icon + heading + paragraph — AI slop fingerprint
16. Centered hero with gradient background — screams generic SaaS template
17. Multiple CTAs competing for equal visual weight on one screen
18. Content touching screen edges (0 margin) on mobile

**Motion anti-patterns:**
19. `linear` easing on any UI transition
20. Animation over 500ms on UI elements (not page transitions)
21. Hover effects that shift layout (content moving on hover)
22. Animations that loop continuously without user interaction
23. Transitions on `height`, `width`, `top`, `left` — use `transform` instead

**Copy anti-patterns:**
24. CTA text: "Click here," "Learn more," "Get started" — no specificity
25. Headline: "We help enterprises transform" — no specificity
26. Any metric not from the verified proof library — use `[VERIFY]` flag
27. "Excited to share" / "Proud to announce" — banned from all Teqfocus copy

---

## Context Loader

Before running any command, confirm:

```
TEQFOCUS IMPECCABLE CONTEXT

Asset type:    [ABM microsite / Demo artifact / Carousel / One-pager / Other]
Register:      [Brand / Product]
Target persona: [CIO / CDO / RevOps / VP Sales / Partner AE]
Industry:      [Healthcare / Insurance / FinServ / Hi-Tech / General]
Primary CTA:   [What single action should they take?]
Verified proof: [Is there a confirmed case study or metric? Or [VERIFY]?]
```

Without this context, audits will be generic. With it, every recommendation
connects to the specific thing this asset needs to accomplish.
