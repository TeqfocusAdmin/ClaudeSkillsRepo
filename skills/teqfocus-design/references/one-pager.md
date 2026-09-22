# Reference: Teqfocus One-Pager Production

Applies to: Capability briefs · Service one-pagers · Leave-behinds · Proposal summaries

Also read: `/mnt/skills/public/pdf/SKILL.md`

Build as HTML → convert to PDF. This gives the most reliable brand color fidelity.

---

## One-Pager Layout Spec

```
Page size: US Letter (8.5" × 11") or A4
Background: #FFFFFF — entire page
Margins: 0.5" all sides
```

### Zone 1: Header Band (top, full width)
```
Height: 80px
Background: #FFFFFF
Left accent bar: 6px solid #BD72EF, full height of band
Content:
  Left: Deck/page title — Poppins Bold 22pt #59267E
  Sub-title: Poppins Regular 13pt #7751E2
  Right: Teqfocus logo (color version), 120px wide
Border bottom: 1px solid #D48EEF
```

### Zone 2: Hero Statement (optional — use for strong opening hook)
```
Width: full content width
Padding: 16px 0
Headline: Poppins Bold 26–30pt #BD72EF, left-aligned
Supporting line: Poppins Regular 15pt #244495
```

### Zone 3: Content Body (main area)
```
Layout: 2 or 3 equal columns with 24px gutters

Each column:
  Section label: Poppins SemiBold 12pt #7751E2, all caps, letter-spacing 0.5px
  Divider line: 2px #BD72EF, full column width, below label
  Content: Poppins Regular 13pt #244495, line-height 1.5

Card variant (for feature blocks):
  Background: #FFFFFF
  Border: 1px #D48EEF
  Left accent: 4px solid #7751E2
  Radius: 6px
  Padding: 14px
  Title: Poppins SemiBold 14pt #59267E
  Body: Poppins Regular 12pt #244495
```

### Zone 4: Stat/Proof Strip (full width, use when metrics available)
```
Background: #D48EEF at 12% opacity (very light orchid tint)
Border-top / border-bottom: 1px solid #D48EEF
Padding: 20px 0
Layout: 3 stats evenly spaced, center-aligned
  Number: Poppins Bold 40pt #BD72EF
  Label: Poppins Regular 12pt #7751E2
Separator: 1px vertical #D48EEF between stats
```

### Zone 5: CTA Block
```
Background: #FFFFFF
Border-left: 6px solid #BD72EF
Padding: 16px 20px
Headline: Poppins SemiBold 16pt #59267E
CTA text: Poppins Regular 13pt #244495
Button (if included):
  Fill: #BD72EF
  Text: white Poppins Bold 13pt
  Radius: 6px
  Padding: 10px 24px
```

### Zone 6: Footer Band (bottom, full width)
```
Height: 48px
Background: #59267E
Content:
  Left: Teqfocus logo (white reversed), 100px wide
  Center: teqfocus.com — Poppins Regular 10pt white
  Right: Salesforce Summit Partner badge or contact info — white 10pt
```

---

## HTML Production Template

```html
<!DOCTYPE html>
<html>
<head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    font-family: 'Poppins', Calibri, sans-serif;
    background: #FFFFFF;
    color: #244495;
    width: 816px; /* 8.5in at 96dpi */
    min-height: 1056px; /* 11in */
    padding: 48px;
  }

  .header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    padding: 0 0 16px 16px;
    border-left: 6px solid #BD72EF;
    border-bottom: 1px solid #D48EEF;
    margin-bottom: 24px;
  }

  h1 { font-size: 22pt; font-weight: 700; color: #59267E; }
  h2 { font-size: 18pt; font-weight: 700; color: #7751E2; }
  h3 { font-size: 13pt; font-weight: 600; color: #7751E2;
       text-transform: uppercase; letter-spacing: 0.5px;
       border-bottom: 2px solid #BD72EF; padding-bottom: 4px; margin-bottom: 8px; }

  .columns { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
  .columns-3 { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px; }

  p { font-size: 13pt; line-height: 1.5; color: #244495; }

  .card {
    background: #FFFFFF;
    border: 1px solid #D48EEF;
    border-left: 4px solid #7751E2;
    border-radius: 6px;
    padding: 14px;
  }
  .card h3 { font-size: 14pt; font-weight: 600; color: #59267E;
             border: none; text-transform: none; letter-spacing: 0; }

  .stats-strip {
    background: rgba(212, 142, 239, 0.12);
    border-top: 1px solid #D48EEF;
    border-bottom: 1px solid #D48EEF;
    padding: 20px 0;
    display: flex;
    justify-content: space-around;
    margin: 24px 0;
  }
  .stat { text-align: center; }
  .stat-number { font-size: 40pt; font-weight: 700; color: #BD72EF; display: block; }
  .stat-label { font-size: 12pt; color: #7751E2; }

  .cta-block {
    border-left: 6px solid #BD72EF;
    padding: 16px 20px;
    margin-top: 24px;
  }
  .cta-block h2 { font-size: 16pt; color: #59267E; margin-bottom: 8px; }

  .btn {
    display: inline-block;
    background: #BD72EF;
    color: #FFFFFF;
    font-family: 'Poppins', sans-serif;
    font-size: 13pt;
    font-weight: 700;
    padding: 10px 24px;
    border-radius: 6px;
    text-decoration: none;
    margin-top: 12px;
  }

  .footer {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 48px;
    background: #59267E;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 48px;
    color: #FFFFFF;
    font-size: 10pt;
  }
</style>
</head>
<body>
  <!-- HEADER -->
  <div class="header">
    <div>
      <h1>[PAGE TITLE]</h1>
      <p style="color:#7751E2; font-size:13pt;">[Sub-title or descriptor]</p>
    </div>
    <img src="[TEQFOCUS_LOGO]" width="120" alt="Teqfocus">
  </div>

  <!-- HERO STATEMENT (optional) -->
  <h2 style="font-size:26pt; color:#BD72EF; margin-bottom:8px;">[Hero headline]</h2>
  <p style="margin-bottom:24px;">[Supporting statement — 1–2 sentences]</p>

  <!-- TWO-COLUMN CONTENT -->
  <div class="columns">
    <div>
      <h3>[Section Label]</h3>
      <p>[Content]</p>
    </div>
    <div>
      <h3>[Section Label]</h3>
      <p>[Content]</p>
    </div>
  </div>

  <!-- STATS STRIP (use when metrics available) -->
  <div class="stats-strip">
    <div class="stat"><span class="stat-number">[N]</span><span class="stat-label">[Label]</span></div>
    <div class="stat"><span class="stat-number">[N]</span><span class="stat-label">[Label]</span></div>
    <div class="stat"><span class="stat-number">[N]</span><span class="stat-label">[Label]</span></div>
  </div>

  <!-- CTA BLOCK -->
  <div class="cta-block">
    <h2>[CTA headline]</h2>
    <p>[Supporting sentence]</p>
    <a class="btn" href="[URL]">[CTA text]</a>
  </div>

  <!-- FOOTER -->
  <div class="footer">
    <span>Teqfocus</span>
    <span>teqfocus.com</span>
    <span>sales@teqfocus.com</span>
  </div>

</body>
</html>
```

---

## QA Checklist — One-Pager
- [ ] White background throughout
- [ ] Header left accent bar: `#BD72EF`
- [ ] All hex codes match the palette exactly
- [ ] Poppins font loaded (Google Fonts import present)
- [ ] Stats block only if metrics are verified
- [ ] Single CTA — not multiple
- [ ] Footer: `#59267E` background, white text
- [ ] No text overflow or cut-off at page edges
- [ ] Logo present with correct placement
