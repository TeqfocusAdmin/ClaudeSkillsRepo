---
name: teqfocus-design
description: >
  Company design skill for Teqfocus — applies the official Teqfocus brand
  (colors, typography, layout, logo rules) to any designed output file.
  Use this skill whenever the user wants to produce a branded visual asset:
  slide decks (.pptx), one-pagers (.pdf or .docx), social cards, event
  banners, quote cards, capability briefs, or any document that needs to
  look like Teqfocus made it. Also trigger when the user says "make it
  on-brand", "apply Teqfocus styling", "design this", "format this as a
  deck", or "create a branded [asset type]". This skill governs ALL visual
  production for Teqfocus — do not attempt any designed file without it.
---

# Teqfocus Design Skill

This skill governs the production of every branded visual asset for Teqfocus.
It translates content from any GTM skill into a correctly styled, production-
ready file that looks exactly like Teqfocus made it.

---

## How to Use This Skill

1. **Read this SKILL.md fully** before producing any designed asset
2. **Identify the asset type** → load the relevant reference file
3. **Read the corresponding public skill** (pptx / docx / pdf) for technical
   production instructions
4. **Apply the Teqfocus design system** from Section 1 to every element
5. **QA the output** against the checklist in Section 5 before delivering

## Reference Files

| Asset Type | Reference File | Also Read |
|---|---|---|
| Slide deck / pitch deck | `references/slides.md` | `/mnt/skills/public/pptx/SKILL.md` |
| One-pager (single page) | `references/one-pager.md` | `/mnt/skills/public/pdf/SKILL.md` |
| Word document / report | `references/document.md` | `/mnt/skills/public/docx/SKILL.md` |
| Social card / quote card | `references/social-card.md` | `/mnt/skills/public/pdf/SKILL.md` |
| Event banner / invite visual | `references/event-visual.md` | `/mnt/skills/public/pdf/SKILL.md` |

---

## Section 1: Teqfocus Design System

This is the single source of truth for all visual decisions.
Every element in every file must trace back to this system.

---

### 1.1 Color Palette — Official Hex Codes

**Primary Colors**
| Name | Hex | Use |
|---|---|---|
| Light Purple | `#BD72EF` | Headlines, CTA buttons, dominant brand element, accent bars |
| Slate Blue | `#7751E2` | Sub-headings, icons, interactive elements, borders |
| Dark Purple | `#59267E` | Footer bars, section labels, high-contrast text on white |

**Secondary Colors**
| Name | Hex | Use |
|---|---|---|
| Light Blue | `#8E9BF5` | Supporting icons, tag backgrounds, list markers |
| Green | `#21A88A` | Success/positive callouts, stat highlights |
| Dark Blue | `#244495` | Body text, supporting copy, hyperlinks |

**Shades**
| Name | Hex | Use |
|---|---|---|
| Light Orchid | `#D48EEF` | Soft fills, hover tints, section dividers |
| Dark Orchid | `#A33BC7` | Mid-weight accents, card borders |
| Mauve | `#E2B0F3` | Subtle background tints (always on white base) |

**Brand Gradient**
`#BD71EF` → `#B08DF3` → `#8D9BF5` (diagonal, bottom-left to top-right)
Use as: thin accent bars, icon backgrounds, CTA button fills, section dividers.
Never use as a full-page background fill.

**Fixed Colors**
| Name | Hex | Use |
|---|---|---|
| White | `#FFFFFF` | **All page/slide backgrounds — mandatory** |
| Black | `#000000` | Use sparingly — only for maximum contrast text |

---

### 1.2 Background Rule — MANDATORY

> **Every slide, page, and document background is White `#FFFFFF`. Always.**

Color appears as:
- Text (headings, subheadings, body)
- Accent bars (thin strips — 4–8px — at top, bottom, or side)
- Icon fills and borders
- CTA button fills
- Card outlines and dividers
- Footer bars (the only full-width colored element allowed)

**Never fill an entire page or slide with a brand color.**
The only exception: a thin footer bar (`#59267E`) at the very bottom of a slide.

Reference: The Teqfocus SF Practice deck (48 slides) — every single slide uses
a white background with purple/blue content on top. This is the standard.

---

### 1.3 Typography

**Primary Font: Poppins** (Google Fonts — free)
- Bold (700): Titles, section headers, CTA button labels, stat callouts
- SemiBold (600): Sub-headings, card headers, callout labels
- Regular (400): Body text, captions, footnotes

**Secondary Fonts** (use for variety in specific contexts)
- **Satoshi** — modern body text complement, great for one-pagers
- **Gilroy** — clean professional subheadings
- **Bahnschrift** — structured, technical contexts (data tables, specs)

**Font Fallbacks** (when Google Fonts unavailable in pptx/docx)
- Poppins → Calibri
- Satoshi/Gilroy → Calibri Light
- Never substitute with: Arial, Roboto, Inter, Times New Roman

**Type Scale**
| Element | Size | Weight | Color |
|---|---|---|---|
| Slide / Page Title | 36–44pt | Bold | `#59267E` |
| Section Header | 22–28pt | SemiBold | `#7751E2` |
| Sub-heading | 16–20pt | SemiBold | `#244495` |
| Body Text | 13–15pt | Regular | `#244495` |
| Callout / Stat | 48–72pt | Bold | `#BD72EF` |
| Caption / Label | 10–12pt | Regular | `#7751E2` |
| Footer text | 9–10pt | Regular | `#59267E` |

**Rules:**
- Line spacing: 1.4–1.6× font size
- Body text: left-aligned always
- Titles: left-aligned (center only for cover slides)
- Never mix more than 2 font families in a single asset
- Minimum 0.5" margins on all sides

---

### 1.4 Logo Rules

- Correct spelling: **Teqfocus** — always this exact casing
- On white backgrounds: full-color logo (purple wordmark + dotted T mark)
- On dark elements (footer bar): white reversed logo
- Placement: top-left (default) or bottom-right for watermark use
- Clear space: equal to the height of the "T" on all sides
- Minimum digital size: 100px wide
- Never stretch, rotate, recolor, or add effects

---

### 1.5 Layout Principles

**Slide layout patterns (from the SF Practice deck):**

| Pattern | When to use |
|---|---|
| Full-width accent bar at top (4–6px, gradient) + title below | Every content slide |
| Two-column: text left, visual/diagram right | Feature/capability slides |
| Icon grid (2×2 or 2×3): colored circle icon + bold label + description | Benefits or feature lists |
| Large stat callout: 60–72pt number + small label below | Proof/metrics slides |
| Full-width purple footer bar (`#59267E`) + white logo + page number | Every slide footer |
| White card with `#D48EEF` left border (4px) | Quote or testimonial |
| Thin `#BD72EF` → `#8D9BF5` gradient divider line | Between sections |

**One-pager layout:**
- Header band: white background, `#BD72EF` left accent bar (6px), logo top-right
- Content: two or three columns, body text `#244495`, headings `#59267E`
- Pull stat: large number in `#BD72EF`, label in `#7751E2`
- Footer: `#59267E` band, white Teqfocus logo left, website right

**Document layout:**
- Cover page: white, large purple title, `#BD72EF` accent bar at bottom
- Body pages: white, left-margin accent stripe or standard heading hierarchy
- Tables: white cells, `#D48EEF` header row fill, `#7751E2` header text
- Section dividers: full-width `#59267E` band with white section title

---

### 1.6 Visual Elements

**Icons:**
- Style: outline or flat — no 3D or drop shadows
- Container: circle or rounded square fill using `#D48EEF` or `#8E9BF5`
- Icon stroke: white or `#59267E`
- Size on slides: 32–48px inside a 56–72px container

**Cards and content blocks:**
- Background: white `#FFFFFF`
- Border: 1px `#D48EEF` or left accent bar 4px `#7751E2`
- Corner radius: 8px
- Internal padding: 16–24px

**Callout boxes:**
- Light Orchid fill `#D48EEF` at 15% opacity
- Left border: 4px solid `#BD72EF`
- Text: `#59267E` bold label + `#244495` body

**Charts and data:**
- Primary bar/line: `#BD72EF`
- Secondary: `#7751E2`
- Tertiary: `#8E9BF5`
- Grid lines: `#E2B0F3` (mauve, very light)
- Axis labels: `#244495` 11pt Poppins Regular

---

## Section 2: Asset Types and When to Use Each

| Request | Correct asset | Output format |
|---|---|---|
| "Make a deck / slides / presentation" | Slide deck | `.pptx` |
| "Create a one-pager / leave-behind" | One-pager | `.pdf` |
| "Build a sales deck / pitch deck" | Slide deck | `.pptx` |
| "Write a proposal / report / brief" | Document | `.docx` |
| "Make a quote card / social card" | Social card | `.pdf` or `.png` |
| "Design an event invite visual" | Event visual | `.pdf` |
| "Create a capability brief" | One-pager | `.pdf` |
| "Format this as a Word doc" | Document | `.docx` |

---

## Section 3: Pre-Production Intake

**Confirm before building any asset:**

```
TEQFOCUS DESIGN INTAKE

ASSET TYPE:        [Slides / One-pager / Document / Social card / Event visual]
TITLE:             [Asset headline or name]
PURPOSE:           [Who sees it, what decision it should drive]
CONTENT SOURCE:    [Paste content OR specify which GTM skill produced it]
AUDIENCE:          [CIO / CDO / RevOps / VP Sales / Partner AE / Other]
INDUSTRY:          [Healthcare / Telecom / FinServ / Retail-CPG / Hi-Tech / General]
KEY STAT / PROOF:  [Verified metric or case study to feature — or [VERIFY]]
CTA:               [Single specific action — meeting type, link, or reply]
SLIDE COUNT:       [For decks: target number — or "standard for content"]
LOGO NEEDED:       [Yes / No — if yes, [IMAGE: Teqfocus logo PNG]]
```

If content is not provided, ask before producing any design scaffolding.
Never invent metrics, customer names, or outcomes.

---

## Section 4: Production Workflow

### For Slide Decks (.pptx)
1. Read `/mnt/skills/public/pptx/SKILL.md` — specifically `pptxgenjs.md`
2. Apply Teqfocus design system from Section 1 of this skill
3. Use `pptxgenjs` to build the deck programmatically
4. Every slide: white background, top accent bar, footer bar
5. Convert to images and visually QA per pptx skill instructions
6. Fix all issues before delivering

### For One-pagers and Social Cards (.pdf)
1. Read `/mnt/skills/public/pdf/SKILL.md`
2. Build as HTML first (full Teqfocus styling applied via inline CSS)
3. Convert HTML → PDF using the pdf skill's method
4. Verify: white background, correct hex colors, Poppins font loaded
5. Deliver the PDF

### For Documents (.docx)
1. Read `/mnt/skills/public/docx/SKILL.md`
2. Build using `docx-js` with Teqfocus styles applied
3. Override built-in styles with exact Teqfocus hex codes
4. Table headers: `#D48EEF` fill, `#7751E2` bold text
5. Headings: Poppins (or Calibri fallback), correct color hierarchy
6. Validate before delivering

---

## Section 5: Design QA Checklist

Run this before every delivery. No asset leaves without passing all checks.

**Background:**
- [ ] Every page/slide background is pure white `#FFFFFF`
- [ ] No full-page fills using any brand color

**Color:**
- [ ] All hex codes match the official palette (Section 1.1 exactly)
- [ ] No off-brand colors (`#1A1A2E`, `#E94560`, or anything outside the palette)
- [ ] No equal-weight color distribution — one color dominates per section

**Typography:**
- [ ] Poppins used for all headings (or Calibri fallback)
- [ ] No Arial, Roboto, Inter, or Times New Roman
- [ ] Title: 36–44pt Bold, `#59267E`
- [ ] Body: 13–15pt Regular, `#244495`
- [ ] All text has sufficient contrast against white background

**Layout:**
- [ ] 0.5" minimum margins on all sides
- [ ] Top accent bar present on every content slide
- [ ] Footer bar `#59267E` on every slide with white logo + page number
- [ ] No text overflowing boxes or cut off at edges
- [ ] No elements overlapping unintentionally

**Brand:**
- [ ] Logo spelling: "Teqfocus" — correct casing
- [ ] Logo placed correctly (top-left default)
- [ ] Single CTA — not multiple competing actions
- [ ] No invented metrics — all unverified numbers flagged `[VERIFY]`
- [ ] American English throughout — no British spelling variants

**Content:**
- [ ] Asset matches the requested type and purpose
- [ ] Persona and industry match the intake
- [ ] Teqfocus name spelled correctly throughout

---

## Section 6: Design Flag Protocol

When producing copy that will become a designed asset later, use this format:

```
[DESIGN FLAG: White #FFFFFF background. Title "#59267E" Poppins Bold 40pt.
Top accent bar: gradient #BD71EF → #8D9BF5, 5px height.
Body text #244495 Poppins Regular 14pt.
CTA button: #BD72EF fill, white Poppins Bold text, 8px radius.
Footer bar: #59267E full-width, white logo left, page number right.]
```

Always include exact hex codes. Never say "brand colors" without specifying.

---

## Section 7: Common Mistakes to Avoid

| Mistake | Correct approach |
|---|---|
| Dark purple full-page background | White background, purple as text/accent only |
| Gradient as page fill | Gradient as thin accent bar (4–8px) only |
| Arial or Calibri as default | Poppins Bold for headings, Poppins Regular for body |
| Equal visual weight across all colors | One dominant color (60%), 1–2 supporting, 1 accent |
| Multiple CTAs on one asset | One CTA — specific and frictionless |
| Invented metrics | Flag with `[VERIFY]` — never fabricate |
| "Teqfocus" misspellings | Always: Teqfocus — never TeqFocus, TEQFOCUS, Teq Focus |
| Bullet-heavy text slides | Visual layouts — icon grids, stat callouts, card blocks |
| Centered body text | Left-align all body text — center titles only |
| Underlines on headings | Use whitespace or color shift instead |

---

## Section 8: Interactive Prototypes & Web Assets

Use this section when the request is for an **interactive or web-based** branded
asset — not a static file. Covers: HTML landing pages, React components,
email HTML templates, and interactive data displays.

Also read: `/mnt/skills/public/frontend-design/SKILL.md` for design execution guidance.

---

### 8.1 When to Build a Prototype vs a Static File

| Request | Build as |
|---|---|
| "Make a landing page / microsite" | HTML artifact (interactive) |
| "Build a branded email template" | HTML email template |
| "Create an interactive one-pager" | React or HTML artifact |
| "Build a dashboard / data display" | React artifact |
| "Make a slide deck" | `.pptx` (see Section 4) |
| "Create a one-pager PDF" | HTML → PDF (see Section 4) |

---

### 8.2 HTML Landing Page / Microsite Prototype

**Stack:** Single-file HTML with inline CSS and minimal JS.
No external frameworks. Google Fonts loaded via `@import`.

**Structure every branded HTML page with these zones:**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[Page Title] | Teqfocus</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

    :root {
      --tq-light-purple:  #BD72EF;
      --tq-slate-blue:    #7751E2;
      --tq-dark-purple:   #59267E;
      --tq-light-blue:    #8E9BF5;
      --tq-green:         #21A88A;
      --tq-dark-blue:     #244495;
      --tq-light-orchid:  #D48EEF;
      --tq-dark-orchid:   #A33BC7;
      --tq-mauve:         #E2B0F3;
      --tq-white:         #FFFFFF;
      --tq-grad:          linear-gradient(135deg, #BD71EF, #8D9BF5);
      --tq-font:          'Poppins', Calibri, sans-serif;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: var(--tq-font);
      background: var(--tq-white);
      color: var(--tq-dark-blue);
      line-height: 1.6;
    }

    /* NAV */
    .tq-nav {
      background: var(--tq-white);
      border-bottom: 3px solid var(--tq-light-purple);
      padding: 16px 48px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: sticky;
      top: 0;
      z-index: 100;
    }
    .tq-nav-logo { font-size: 20pt; font-weight: 700; color: var(--tq-dark-purple); }

    /* HERO */
    .tq-hero {
      background: var(--tq-white);
      padding: 80px 48px 60px;
      border-left: 6px solid var(--tq-light-purple);
      margin: 0 48px;
    }
    .tq-hero-label {
      font-size: 11pt; font-weight: 600;
      color: var(--tq-slate-blue);
      text-transform: uppercase;
      letter-spacing: 1.5px;
      margin-bottom: 16px;
    }
    .tq-hero h1 {
      font-size: 40pt; font-weight: 700;
      color: var(--tq-dark-purple);
      line-height: 1.2;
      margin-bottom: 20px;
    }
    .tq-hero p {
      font-size: 16pt; color: var(--tq-dark-blue);
      max-width: 640px;
      margin-bottom: 32px;
    }

    /* SECTIONS */
    .tq-section { padding: 60px 48px; background: var(--tq-white); }
    .tq-section-alt { background: rgba(212,142,239,0.06); } /* light orchid tint */

    .tq-section h2 {
      font-size: 26pt; font-weight: 700;
      color: var(--tq-dark-purple);
      margin-bottom: 8px;
    }
    .tq-section h2::after {
      content: '';
      display: block;
      width: 48px; height: 4px;
      background: var(--tq-light-purple);
      margin-top: 8px;
      border-radius: 2px;
    }
    .tq-section p { font-size: 14pt; color: var(--tq-dark-blue); max-width: 720px; }

    /* GRID */
    .tq-grid { display: grid; gap: 24px; margin-top: 32px; }
    .tq-grid-2 { grid-template-columns: 1fr 1fr; }
    .tq-grid-3 { grid-template-columns: 1fr 1fr 1fr; }

    /* CARD */
    .tq-card {
      background: var(--tq-white);
      border: 1px solid var(--tq-mauve);
      border-left: 4px solid var(--tq-slate-blue);
      border-radius: 8px;
      padding: 24px;
    }
    .tq-card h3 {
      font-size: 16pt; font-weight: 600;
      color: var(--tq-dark-purple);
      margin-bottom: 10px;
    }
    .tq-card p { font-size: 13pt; color: var(--tq-dark-blue); }

    /* STAT STRIP */
    .tq-stats {
      background: var(--tq-white);
      border-top: 1px solid var(--tq-mauve);
      border-bottom: 1px solid var(--tq-mauve);
      padding: 40px 48px;
      display: flex;
      justify-content: space-around;
    }
    .tq-stat { text-align: center; }
    .tq-stat-num {
      font-size: 48pt; font-weight: 700;
      color: var(--tq-light-purple);
      display: block;
      line-height: 1;
    }
    .tq-stat-label { font-size: 13pt; color: var(--tq-slate-blue); margin-top: 8px; }

    /* CTA */
    .tq-btn {
      display: inline-block;
      background: var(--tq-light-purple);
      color: var(--tq-white);
      font-family: var(--tq-font);
      font-size: 14pt; font-weight: 700;
      padding: 14px 32px;
      border-radius: 8px;
      text-decoration: none;
      border: none; cursor: pointer;
    }
    .tq-btn:hover { background: var(--tq-slate-blue); }
    .tq-btn-outline {
      background: var(--tq-white);
      color: var(--tq-light-purple);
      border: 2px solid var(--tq-light-purple);
    }

    /* FOOTER */
    .tq-footer {
      background: var(--tq-dark-purple);
      color: var(--tq-white);
      padding: 32px 48px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 11pt;
    }
    .tq-footer a { color: var(--tq-light-orchid); text-decoration: none; }

    /* ACCENT BAR (top of page) */
    .tq-accent-bar {
      height: 5px;
      background: var(--tq-grad);
    }

    /* RESPONSIVE */
    @media (max-width: 768px) {
      .tq-grid-2, .tq-grid-3 { grid-template-columns: 1fr; }
      .tq-hero h1 { font-size: 28pt; }
      .tq-stats { flex-direction: column; gap: 32px; }
    }
  </style>
</head>
<body>

  <div class="tq-accent-bar"></div>

  <!-- NAV -->
  <nav class="tq-nav">
    <span class="tq-nav-logo">Teqfocus</span>
    <a class="tq-btn" href="#cta" style="font-size:12pt; padding:10px 24px;">
      Book a Call
    </a>
  </nav>

  <!-- HERO -->
  <section class="tq-hero">
    <p class="tq-hero-label">[Category / Industry Label]</p>
    <h1>[Page Headline — specific, outcome-led]</h1>
    <p>[2–3 sentence supporting statement]</p>
    <a class="tq-btn" href="#cta">[Primary CTA]</a>
  </section>

  <!-- STATS (only with verified metrics) -->
  <div class="tq-stats">
    <div class="tq-stat">
      <span class="tq-stat-num">[N]</span>
      <span class="tq-stat-label">[Metric label]</span>
    </div>
    <!-- repeat for 2–3 stats -->
  </div>

  <!-- CONTENT SECTION -->
  <section class="tq-section">
    <h2>[Section Heading]</h2>
    <p>[Section intro — 1–2 sentences]</p>
    <div class="tq-grid tq-grid-3">
      <div class="tq-card">
        <h3>[Card Title]</h3>
        <p>[Card body — 2–3 sentences]</p>
      </div>
      <!-- repeat cards -->
    </div>
  </section>

  <!-- ALT SECTION -->
  <section class="tq-section tq-section-alt">
    <h2>[Section Heading]</h2>
    <p>[Content]</p>
  </section>

  <!-- CTA SECTION -->
  <section class="tq-section" id="cta" style="text-align:center; padding:80px 48px;">
    <h2>[CTA Headline]</h2>
    <p style="margin: 16px auto 32px; max-width:540px;">[Supporting sentence]</p>
    <a class="tq-btn" href="[BOOKING_URL]">[CTA Button Text]</a>
  </section>

  <!-- FOOTER -->
  <footer class="tq-footer">
    <span><strong>Teqfocus</strong> — Data & AI Company</span>
    <span>
      <a href="https://teqfocus.com">teqfocus.com</a> &nbsp;|&nbsp;
      <a href="mailto:sales@teqfocus.com">sales@teqfocus.com</a>
    </span>
  </footer>

</body>
</html>
```

---

### 8.3 Branded Email HTML Template

Production-ready HTML email using table-based layout (email client compatible).

**Rules for email HTML:**
- Use `<table>` layout — no CSS Grid or Flexbox (Gmail strips them)
- Inline all CSS — no `<style>` blocks (many clients strip head styles)
- Max width: 600px
- Background: `#FFFFFF` always
- All fonts: Arial as fallback (Poppins won't load in most email clients)
- Accent bar: top image or border, not CSS gradient
- Single CTA button per email
- Footer: `#59267E` background, white text, unsubscribe link

```html
<!DOCTYPE html>
<html>
<body style="margin:0;padding:0;background:#F5F5F5;font-family:Arial,sans-serif;">
<table width="100%" cellpadding="0" cellspacing="0">
  <tr><td align="center" style="padding:24px 0;">

    <!-- EMAIL CONTAINER -->
    <table width="600" cellpadding="0" cellspacing="0"
           style="background:#FFFFFF;border-radius:8px;overflow:hidden;">

      <!-- ACCENT BAR -->
      <tr>
        <td height="5"
            style="background:linear-gradient(90deg,#BD71EF,#8D9BF5);
                   font-size:0;line-height:0;">&nbsp;</td>
      </tr>

      <!-- HEADER -->
      <tr>
        <td style="padding:24px 40px;border-bottom:1px solid #E2B0F3;">
          <span style="font-size:20pt;font-weight:700;color:#59267E;">
            Teqfocus
          </span>
        </td>
      </tr>

      <!-- BODY -->
      <tr>
        <td style="padding:40px 40px 32px;">
          <h1 style="font-size:22pt;font-weight:700;color:#59267E;
                     margin:0 0 16px;line-height:1.2;">
            [Email Headline]
          </h1>
          <p style="font-size:14pt;color:#244495;line-height:1.6;margin:0 0 24px;">
            [Opening paragraph — 2–3 sentences]
          </p>
          <p style="font-size:14pt;color:#244495;line-height:1.6;margin:0 0 32px;">
            [Second paragraph — value or insight]
          </p>

          <!-- CTA BUTTON -->
          <table cellpadding="0" cellspacing="0">
            <tr>
              <td style="background:#BD72EF;border-radius:8px;padding:14px 32px;">
                <a href="[CTA_URL]"
                   style="color:#FFFFFF;font-size:14pt;font-weight:700;
                          text-decoration:none;display:block;">
                  [CTA Text]
                </a>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <!-- FOOTER -->
      <tr>
        <td style="background:#59267E;padding:24px 40px;">
          <p style="color:#FFFFFF;font-size:11pt;margin:0;">
            Teqfocus &nbsp;|&nbsp; teqfocus.com
          </p>
          <p style="color:#D48EEF;font-size:10pt;margin:8px 0 0;">
            <a href="[UNSUBSCRIBE_URL]"
               style="color:#D48EEF;text-decoration:underline;">
              Unsubscribe
            </a>
          </p>
        </td>
      </tr>

    </table>
    <!-- END CONTAINER -->

  </td></tr>
</table>
</body>
</html>
```

---

### 8.4 React Component Prototype

For interactive branded components: dashboards, data displays, forms.

```jsx
// Standard imports for a Teqfocus-branded React component
import { useState } from "react";

// CSS-in-JS token object — always use these values
const TQ = {
  lightPurple:  '#BD72EF',
  slateBlue:    '#7751E2',
  darkPurple:   '#59267E',
  lightBlue:    '#8E9BF5',
  green:        '#21A88A',
  darkBlue:     '#244495',
  lightOrchid:  '#D48EEF',
  mauve:        '#E2B0F3',
  white:        '#FFFFFF',
  font:         "'Poppins', Calibri, sans-serif",
};

// Base styles — apply to every component root
const baseStyles = {
  fontFamily: TQ.font,
  background: TQ.white,
  color: TQ.darkBlue,
  minHeight: '100vh',
};

// Reusable component primitives
const AccentBar = () => (
  <div style={{
    height: 5,
    background: `linear-gradient(90deg, ${TQ.lightPurple}, ${TQ.lightBlue})`,
    width: '100%'
  }} />
);

const Card = ({ title, children }) => (
  <div style={{
    background: TQ.white,
    border: `1px solid ${TQ.mauve}`,
    borderLeft: `4px solid ${TQ.slateBlue}`,
    borderRadius: 8,
    padding: 24,
  }}>
    {title && (
      <h3 style={{ color: TQ.darkPurple, fontWeight: 600,
                   marginBottom: 10, fontSize: 16 }}>
        {title}
      </h3>
    )}
    {children}
  </div>
);

const Button = ({ children, onClick, outline = false }) => (
  <button onClick={onClick} style={{
    background: outline ? TQ.white : TQ.lightPurple,
    color: outline ? TQ.lightPurple : TQ.white,
    border: outline ? `2px solid ${TQ.lightPurple}` : 'none',
    borderRadius: 8,
    padding: '12px 28px',
    fontFamily: TQ.font,
    fontSize: 14,
    fontWeight: 700,
    cursor: 'pointer',
  }}>
    {children}
  </button>
);

const StatBlock = ({ value, label }) => (
  <div style={{ textAlign: 'center' }}>
    <div style={{ fontSize: 48, fontWeight: 700, color: TQ.lightPurple,
                  lineHeight: 1 }}>
      {value}
    </div>
    <div style={{ fontSize: 13, color: TQ.slateBlue, marginTop: 8 }}>
      {label}
    </div>
  </div>
);

// Example page component
export default function TeqfocusPage() {
  return (
    <div style={baseStyles}>
      <AccentBar />
      {/* Build page content using primitives above */}
    </div>
  );
}
```

---

### 8.5 Prototype QA Checklist

- [ ] All backgrounds: `#FFFFFF` — no dark fills on any section
- [ ] CSS variables / token object uses correct Teqfocus hex codes
- [ ] Poppins loaded via Google Fonts (HTML) or declared in font stack
- [ ] Accent bar at top: gradient `#BD71EF` → `#8D9BF5`
- [ ] Footer: `#59267E` background, white text
- [ ] Single CTA — specific action, correct button color `#BD72EF`
- [ ] Responsive — mobile layout tested (768px breakpoint)
- [ ] No placeholder text left in final output
- [ ] Email HTML: table-based layout, inline CSS, Arial fallback
- [ ] React: token object present, no hardcoded hex strings outside `TQ` object
