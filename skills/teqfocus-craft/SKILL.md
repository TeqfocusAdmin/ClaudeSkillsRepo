---
name: teqfocus-craft
description: >
  Design engineering craft skill for Teqfocus — applies Emil Kowalski's
  philosophy of invisible details, purposeful animation, and compound quality
  to all Teqfocus visual output. Use when building or reviewing any Teqfocus
  interface, prototype, ABM microsite, demo artifact, or UI component. Also
  trigger when the user says "make this feel better," "the animation feels
  wrong," "this looks generic," "polish this," "improve the interaction,"
  or "why doesn't this feel right." Works in both claude.ai (reviewing and
  directing design decisions) and Claude Code (generating and refining UI code).
---

# Teqfocus Craft — Design Engineering

Built on Emil Kowalski's design engineering philosophy, adapted for the
Teqfocus brand system and the specific UI contexts Teqfocus produces.

In a world where every Salesforce SI can build a microsite, **taste is the
differentiator**. A Teqfocus ABM page that feels precise and considered
signals the same thing as a 4.9 CSAT score — it says the team pays attention
to details that others skip.

---

## Core Philosophy

### Unseen details compound
Most details users never consciously notice. That is the point.
When an interaction works exactly as someone expects, they proceed without
thinking about it. That frictionless experience is the goal — not the
individual detail that created it.

Every pixel of a Teqfocus demo interface, every hover state on an ABM
microsite, every transition on a carousel signals craft. Compound enough
of them and the total effect is unmistakably considered.

### Taste is trained, not innate
Good taste is not preference. It is a trained instinct — the ability to
recognize what elevates and what drags. It develops through studying great
work, reverse-engineering why something feels right, and practicing
relentlessly.

For every Teqfocus UI decision, ask: "Why does the best version of this
feel the way it does?"

### Function precedes form — always
Animation and visual treatment must serve the user's task.
If a Teqfocus CIO can't find the discovery call CTA in under 3 seconds,
the beautiful gradient is a failure. Start from function. Layer craft on top.

---

## Animation Principles — Teqfocus Contexts

### Duration rules
| Interaction type | Duration | Reasoning |
|---|---|---|
| Micro-interactions (hover, button press) | 80–150ms | Feels instant, not laggy |
| UI transitions (panel open, modal) | 200–300ms | Perceptible but not slow |
| Page-level transitions | 300–450ms | Breathing room between states |
| Skeleton loaders | Use shimmer, not spinning — enterprise buyers don't tolerate spinners |

Never animate for longer than the interaction demands.
A 600ms fade on a button hover is not premium — it is slow.

### Easing rules
- **Entering elements:** `ease-out` — fast start, gentle landing
- **Exiting elements:** `ease-in` — gentle start, fast exit
- **Emphasis / attention:** `spring` physics for elements that need weight
- **Never use:** `linear` for UI motion — feels mechanical and cheap
- **Never use:** `ease-in` for entering elements — feels like it starts wrong

### What to animate in Teqfocus UI
**Animate:**
- State changes (hover, focus, active, disabled)
- Content appearing (cards loading, sections revealing)
- Navigation transitions between page sections
- CTA button states — subtle scale or color shift on hover
- Progress indicators

**Do NOT animate:**
- High-frequency actions (text input, rapid clicks)
- Elements the user is actively interacting with mid-interaction
- Decorative elements that add no functional signal
- Anything that delays access to content

### The Teqfocus accent bar
The `#BD71EF → #8D9BF5` gradient accent bar at the top of every page/slide
is a signature element. It should:
- Never animate on load (it's structural, not decorative)
- Remain static while page content loads beneath it
- Be the first pixel rendered — it anchors brand identity

---

## Component Craft — Teqfocus Specifics

### Cards
```css
/* Teqfocus card — craft version */
.tq-card {
  background: #FFFFFF;
  border: 1px solid #E2B0F3;          /* mauve border — subtle */
  border-left: 4px solid #7751E2;     /* slate blue left accent */
  border-radius: 8px;
  padding: 24px;
  transition: box-shadow 150ms ease-out,
              border-left-color 150ms ease-out;
}

.tq-card:hover {
  box-shadow: 0 4px 16px rgba(119, 81, 226, 0.10);
  border-left-color: #BD72EF;         /* shifts to light purple on hover */
}
```
The hover shift from slate blue to light purple on the left border is an
invisible detail. Users won't notice it consciously. But the card feels
alive rather than static.

### Buttons
```css
/* Primary CTA — craft version */
.tq-btn {
  background: #BD72EF;
  color: #FFFFFF;
  font-family: 'Poppins', sans-serif;
  font-size: 14px;
  font-weight: 700;
  padding: 12px 28px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  transition: background 150ms ease-out,
              transform 80ms ease-out,
              box-shadow 150ms ease-out;
}

.tq-btn:hover {
  background: #7751E2;                /* shifts to slate blue */
  box-shadow: 0 4px 12px rgba(189, 114, 239, 0.30);
}

.tq-btn:active {
  transform: scale(0.98);             /* micro-compression on press */
}
```
The `scale(0.98)` on active is imperceptible at rest. When the user clicks,
it registers physically. It says: "this responded."

### Stat callouts
```css
/* Large metric — animate in on scroll-enter */
.tq-stat-number {
  font-size: 48px;
  font-weight: 700;
  color: #BD72EF;
  opacity: 0;
  transform: translateY(8px);
  transition: opacity 400ms ease-out,
              transform 400ms ease-out;
}

.tq-stat-number.visible {
  opacity: 1;
  transform: translateY(0);
}
```
Stats that count up or fade in on scroll create a moment of arrival.
Use sparingly — one or two per page. Every stat callout that animates
loses its effect on the ones that follow.

### Form fields and inputs
```css
.tq-input {
  border: 1px solid #D48EEF;
  border-radius: 6px;
  padding: 10px 14px;
  font-family: 'Poppins', sans-serif;
  font-size: 14px;
  color: #244495;
  transition: border-color 120ms ease-out,
              box-shadow 120ms ease-out;
  outline: none;
}

.tq-input:focus {
  border-color: #BD72EF;
  box-shadow: 0 0 0 3px rgba(189, 114, 239, 0.15);
}
```
The focus ring at 15% opacity is soft enough not to scream but present
enough to clearly indicate state. This is the kind of detail that makes
a form feel considered.

---

## Typography Craft

Poppins is the Teqfocus primary font. Used well, it reads as authoritative
and clean. Used poorly, it reads as every other B2B SaaS site.

**What elevates Poppins:**
- Clear hierarchy: 700 for titles, 600 for subheads, 400 for body — never
  two weights that are close (e.g., 600 and 700 on adjacent elements)
- Correct line-height: 1.2–1.3 for headings, 1.5–1.6 for body
- Optical sizing: large display text (40pt+) benefits from tighter tracking
  (`letter-spacing: -0.02em`)
- Never let body text run wider than 680px — readability collapses past that

**Teqfocus type scale in practice:**
```css
/* Display — used for hero headlines only */
.tq-display {
  font-size: clamp(36px, 5vw, 52px);
  font-weight: 700;
  color: #59267E;
  letter-spacing: -0.02em;
  line-height: 1.15;
}

/* Section heading */
.tq-heading {
  font-size: clamp(22px, 3vw, 30px);
  font-weight: 700;
  color: #59267E;
  line-height: 1.25;
}

/* Body */
.tq-body {
  font-size: 15px;
  font-weight: 400;
  color: #244495;
  line-height: 1.6;
  max-width: 680px;
}
```

---

## Spacing and Layout Craft

### The 8px grid
All spacing in Teqfocus interfaces should be multiples of 8:
`8 · 16 · 24 · 32 · 48 · 64 · 96`

Use 4px only for micro-spacing within components (icon-to-label gap,
badge padding). Never arbitrary values like 13px or 22px.

### Breathing room signals confidence
A Teqfocus ABM microsite with generous white space signals the same thing
as a confident CIO in a meeting — unhurried, precise, nothing to prove.
Cramped layouts signal the opposite.

Minimum section padding: `80px` top and bottom on desktop, `48px` mobile.
Minimum content margin from edge: `48px` on desktop, `24px` mobile.

### The left accent bar as spatial anchor
The 4–6px left border on cards and callout blocks is the Teqfocus spatial
signature. It:
- Creates vertical rhythm by anchoring the left edge of content
- Provides color without filling a large area
- Works at every content density

Use it on: callout boxes, case study blocks, pull quotes, CTA sections.
Do NOT use it on: navigation bars, headers, stat blocks (those have their
own visual treatment).

---

## GTM Application — Where Craft Matters Most

### ABM Microsites
These are the highest-stakes design contexts — a named CIO will land on
this page after targeted outreach. Every element signals whether Teqfocus
is worth their time.

Craft checklist for ABM microsites:
- [ ] Hero headline: no widow words (single word on last line)
- [ ] CTA button: hover state implemented — static buttons feel inactive
- [ ] Images/icons: all same visual style — mixed icon styles signal carelessness
- [ ] Mobile: verified at 375px — enterprise CIOs read on phones
- [ ] Load time: under 2 seconds — check with PageSpeed before launch
- [ ] Transitions: page sections reveal on scroll with 300–400ms ease-out

### Demo Artifacts
When Claude Code generates a Salesforce agent demo or data dashboard:
- Consistent color usage — every data visualization uses Teqfocus colors
- Numbers formatted correctly — commas, currency symbols, decimal places
- Empty states designed — what shows when there's no data?
- Loading states — skeleton screens, not spinners

### TeqTalk Carousels
- Slide 1 hook: large text, breathing room, one idea
- Every slide: consistent left-edge alignment (never centered text on body slides)
- Final slide: CTA with Teqfocus brand colors and booking link

---

## The Craft Review Pass

Before any Teqfocus UI asset ships, run this pass:

**Invisible details check:**
- [ ] All interactive elements have hover states
- [ ] All transitions use appropriate easing (not linear)
- [ ] No animation longer than 400ms on UI elements
- [ ] Form fields have focus states
- [ ] Buttons have active/pressed states

**Typography check:**
- [ ] No widow words in headings
- [ ] Body text max-width respected (680px)
- [ ] Font weight hierarchy clear at a glance
- [ ] Line heights applied correctly

**Spacing check:**
- [ ] All spacing on 8px grid
- [ ] Section padding consistent
- [ ] Content doesn't touch screen edges on mobile

**Brand check:**
- [ ] All hex codes from Teqfocus palette (see teqfocus-design skill)
- [ ] White `#FFFFFF` background throughout — no dark fills
- [ ] Poppins font applied — no Inter, Roboto, or system fallback visible
- [ ] Single CTA per page/section — no competing actions

---

## Anti-Patterns — What Undermines Teqfocus Craft

| Pattern | Why it fails |
|---|---|
| `linear` easing on any motion | Feels mechanical — like a loading bar, not a designed interface |
| Animations over 500ms on UI elements | Feels slow — the interface is getting in the way |
| Box shadows on everything | Loses its meaning — save shadows for elements that need elevation |
| Pure `#000000` text on white | Harsh — use `#244495` (Teqfocus dark blue) for body text |
| Gradient as full background | Overwhelming — gradient is an accent, not a canvas |
| Hover states that change layout | Content jumping on hover breaks spatial trust |
| 3 or more font weights on one page | Creates noise, not hierarchy |
| Icons from multiple style families | Mix of outline, filled, and line icons signals no curation |
| Animated decorations | Motion that doesn't carry functional meaning is noise |
| Button text: "Click here" / "Learn more" | Vague CTAs signal the interaction wasn't thought through |
