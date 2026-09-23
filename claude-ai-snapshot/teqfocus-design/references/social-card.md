# Reference: Teqfocus Social Cards & Quote Cards

Applies to: LinkedIn quote cards · TeqTalk episode cards · Stat cards ·
Event announcement cards · LinkedIn carousel cover slides

Also read: `/mnt/skills/public/pdf/SKILL.md`

Build as HTML → export as PNG (1080×1080 for square, 1200×628 for landscape).

---

## Card Types

### Type 1: Quote Card (guest quote or insight)

```
Size: 1080×1080px (square) or 1200×628px (landscape)
Background: #FFFFFF

Layout:
  Top accent bar: 8px, gradient #BD71EF → #8D9BF5, full width
  Left accent bar: 8px, solid #7751E2, full height (optional — use for portrait)

  Quote text:
    Font: Poppins SemiBold, 22–26pt (square) / 20pt (landscape)
    Color: #59267E
    Position: centered vertically, 10% padding each side
    Opening quotation mark: large decorative, #BD72EF, 60pt

  Attribution line:
    Name: Poppins Bold 14pt #7751E2
    Title + Company: Poppins Regular 12pt #244495

  Bottom:
    Teqfocus logo (color): bottom-right, 100px wide
    TeqTalk badge (if applicable): bottom-left, 80px
    Bottom accent bar: 6px solid #59267E, full width
```

### Type 2: Stat Card (metric highlight)

```
Size: 1080×1080px
Background: #FFFFFF

Layout:
  Top accent bar: 8px gradient
  
  Large number:
    Font: Poppins Bold 80–96pt
    Color: #BD72EF
    Position: center, upper half
    
  Metric label:
    Font: Poppins SemiBold 20pt
    Color: #7751E2
    Position: directly below number

  Context line:
    Font: Poppins Regular 14pt
    Color: #244495
    Position: below label, 2 lines max

  Teqfocus logo: bottom-right, 100px
  Bottom accent bar: 6px #59267E
```

### Type 3: Announcement Card (event or content launch)

```
Size: 1200×628px (landscape — LinkedIn optimal)
Background: #FFFFFF

Left panel (40% width):
  Background: #FFFFFF
  Large icon or graphic: centered, 180×180px
  Icon container: circle, #D48EEF fill

Right panel (60% width):
  Thin left border: 4px solid #BD72EF separating panels
  Category label: Poppins SemiBold 11pt #7751E2, all caps
  Headline: Poppins Bold 24pt #59267E
  Supporting line: Poppins Regular 14pt #244495
  Date/detail: Poppins SemiBold 13pt #BD72EF

  Teqfocus logo: bottom-right of right panel, 100px

Bottom accent bar: 6px gradient full width
```

---

## HTML Template — Quote Card (Square)

```html
<!DOCTYPE html>
<html>
<head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: 'Poppins', sans-serif;
    background: #FFFFFF;
    width: 1080px;
    height: 1080px;
    position: relative;
    overflow: hidden;
  }
  .top-bar {
    height: 8px;
    background: linear-gradient(90deg, #BD71EF, #8D9BF5);
    width: 100%;
  }
  .content {
    padding: 60px 80px;
    height: calc(1080px - 8px - 54px);
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .quotemark {
    font-size: 80pt;
    color: #BD72EF;
    line-height: 0.8;
    margin-bottom: 16px;
    font-family: Georgia, serif;
  }
  .quote {
    font-size: 24pt;
    font-weight: 600;
    color: #59267E;
    line-height: 1.4;
    margin-bottom: 32px;
  }
  .attribution-name {
    font-size: 15pt;
    font-weight: 700;
    color: #7751E2;
  }
  .attribution-title {
    font-size: 12pt;
    color: #244495;
    margin-top: 4px;
  }
  .logo {
    position: absolute;
    bottom: 70px;
    right: 80px;
    width: 100px;
  }
  .bottom-bar {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 6px;
    background: #59267E;
  }
</style>
</head>
<body>
  <div class="top-bar"></div>
  <div class="content">
    <div class="quotemark">"</div>
    <p class="quote">[Quote text — 1–3 sentences max]</p>
    <p class="attribution-name">[Guest Name]</p>
    <p class="attribution-title">[Title, Company]</p>
  </div>
  <img class="logo" src="[TEQFOCUS_LOGO]" alt="Teqfocus">
  <div class="bottom-bar"></div>
</body>
</html>
```

---

## QA Checklist — Social Cards
- [ ] White background — no dark fills anywhere
- [ ] Top accent bar: gradient `#BD71EF` → `#8D9BF5`
- [ ] Bottom bar: solid `#59267E`
- [ ] Quote/headline text: `#59267E` Poppins SemiBold
- [ ] Attribution: `#7751E2` name, `#244495` title
- [ ] Logo present bottom-right, correct size
- [ ] No text overflow — all text within card bounds with 60px+ padding
- [ ] Font loaded: Poppins (not system fallback)
