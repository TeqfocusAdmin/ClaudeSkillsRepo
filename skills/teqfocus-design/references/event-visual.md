# Reference: Teqfocus Event Visuals

Applies to: CXO Dinner invites · Dreamforce event cards · Snowflake Summit
banners · Webinar registration headers · Event leave-behinds

Also read: `/mnt/skills/public/pdf/SKILL.md`

Build as HTML → PDF or PNG.

---

## Event Card Types

### Type 1: CXO Executive Dinner Invite Card
```
Size: 1200×628px (LinkedIn) or A5 landscape PDF
Background: #FFFFFF

Layout:
  Top bar: 8px gradient #BD71EF → #8D9BF5
  Left panel (35%):
    Background tint: rgba(189, 114, 239, 0.08) — very light purple
    Event type label: Poppins SemiBold 11pt #7751E2, all caps, letter-spacing 1px
    Event name: Poppins Bold 22pt #59267E
    Date + city: Poppins SemiBold 14pt #BD72EF

  Right panel (65%):
    Thin left border: 3px #BD72EF
    Headline: Poppins Bold 20pt #59267E
    Description: Poppins Regular 13pt #244495, 3 lines max
    RSVP CTA: Poppins Bold 13pt white on #BD72EF button, radius 6px

  Bottom: 6px solid #59267E
  Logo: Teqfocus color logo, bottom-right of left panel or top-right overall
```

### Type 2: Conference Presence Banner
```
Size: 1200×628px or 1920×1080px (full width)
Background: #FFFFFF

Layout:
  Thin top bar: 6px gradient
  
  Center content:
    Event name badge: rounded pill, #D48EEF fill, #59267E text
    Main headline: Poppins Bold 32pt #59267E
    Sub-line: Poppins Regular 16pt #7751E2
    Booth / meeting detail: Poppins SemiBold 14pt #BD72EF

  Visual element: abstract dot-arc pattern in #D48EEF at 20% opacity (right side)
  
  Logo: top-left, standard placement
  Bottom bar: 6px #59267E
```

### Type 3: Webinar Registration Header
```
Size: 1200×400px
Background: #FFFFFF

Layout:
  Left accent bar: 6px #BD72EF, full height
  Content (with 40px padding):
    Category: Poppins SemiBold 11pt #7751E2 all caps
    Webinar title: Poppins Bold 26pt #59267E
    Date + time: Poppins SemiBold 14pt #BD72EF
    Presenter name: Poppins Regular 13pt #244495

  Logo: top-right
  Bottom gradient bar: 4px
```

---

## HTML Template — CXO Dinner Card

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
    width: 1200px;
    height: 628px;
    position: relative;
    overflow: hidden;
  }
  .top-bar {
    height: 8px;
    background: linear-gradient(90deg, #BD71EF, #8D9BF5);
  }
  .layout {
    display: flex;
    height: calc(628px - 8px - 6px);
  }
  .left-panel {
    width: 35%;
    background: rgba(189, 114, 239, 0.08);
    padding: 40px 32px;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .event-type {
    font-size: 11pt;
    font-weight: 600;
    color: #7751E2;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 12px;
  }
  .event-name {
    font-size: 22pt;
    font-weight: 700;
    color: #59267E;
    line-height: 1.2;
    margin-bottom: 16px;
  }
  .event-detail {
    font-size: 14pt;
    font-weight: 600;
    color: #BD72EF;
  }
  .right-panel {
    width: 65%;
    padding: 40px 48px;
    border-left: 3px solid #BD72EF;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .headline {
    font-size: 20pt;
    font-weight: 700;
    color: #59267E;
    margin-bottom: 16px;
    line-height: 1.3;
  }
  .description {
    font-size: 13pt;
    color: #244495;
    line-height: 1.5;
    margin-bottom: 24px;
  }
  .btn {
    display: inline-block;
    background: #BD72EF;
    color: #FFFFFF;
    font-size: 13pt;
    font-weight: 700;
    padding: 10px 28px;
    border-radius: 6px;
    text-decoration: none;
    width: fit-content;
  }
  .logo {
    position: absolute;
    top: 24px;
    right: 40px;
    width: 110px;
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
  <div class="layout">
    <div class="left-panel">
      <p class="event-type">CXO Executive Dinner</p>
      <p class="event-name">[Event Name]</p>
      <p class="event-detail">[Date · City]</p>
    </div>
    <div class="right-panel">
      <h2 class="headline">[Dinner theme or question]</h2>
      <p class="description">[2–3 sentence description of the conversation]</p>
      <a class="btn" href="[RSVP_LINK]">Reserve Your Seat</a>
    </div>
  </div>
  <img class="logo" src="[TEQFOCUS_LOGO]" alt="Teqfocus">
  <div class="bottom-bar"></div>
</body>
</html>
```

---

## QA Checklist — Event Visuals
- [ ] White background throughout
- [ ] Top bar: gradient `#BD71EF` → `#8D9BF5`
- [ ] Bottom bar: `#59267E`
- [ ] Headline: Poppins Bold `#59267E`
- [ ] Date/detail: `#BD72EF` — stands out without going off-brand
- [ ] Single CTA — clear and frictionless
- [ ] Logo placed correctly — color version on white, reversed if on dark element
- [ ] No text overflow — all content within bounds
- [ ] Correct dimensions for intended use (LinkedIn / PDF / banner)
