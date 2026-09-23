# Reference: Teqfocus Slide Deck Production

Applies to: Sales decks · Pitch decks · Capability decks · Event decks · Partner decks

Also read: `/mnt/skills/public/pptx/SKILL.md` (full pptxgenjs technical instructions)

---

## Slide Architecture — Every Deck

### Required Slide Structure

```
1. Cover slide
2. Problem / Context slide (why this matters now)
3. Solution / Teqfocus approach (1–2 slides)
4. Capability / Service detail (1–3 slides)
5. Proof / Case study (1–2 slides)
6. Team / Credentials (optional — 1 slide)
7. Next step / CTA slide
```

Adapt length to content — never pad. A 7-slide deck that lands is better than 20 slides that lose the room.

---

## Slide Templates — Detailed Specs

### Template 1: Cover Slide

```
Background: #FFFFFF
Top accent bar: 6px, gradient #BD71EF → #8D9BF5, full width
[Teqfocus logo: top-left, 140px wide, clear space maintained]

Center of slide:
  Company/client name or deck title
  Font: Poppins Bold, 40–44pt, #59267E
  Sub-title or deck purpose
  Font: Poppins Regular, 18pt, #7751E2

Bottom:
  Footer bar: #59267E, full width, 40px tall
  Footer text: "teqfocus.com" — Poppins Regular 10pt, white, right-aligned
```

### Template 2: Standard Content Slide

```
Background: #FFFFFF
Top accent bar: 5px, gradient #BD71EF → #8D9BF5, full width

Slide title:
  Position: top-left, below accent bar, 0.5" margin
  Font: Poppins Bold, 28–32pt, #59267E

Content area:
  Starts 1.2" from top
  Body text: Poppins Regular, 14pt, #244495
  Bullet markers: replace with #BD72EF dot or #7751E2 dash
  Sub-headings within content: Poppins SemiBold, 16pt, #7751E2

Bottom:
  Footer bar: #59267E, full width, 32px tall
  Page number: white, 10pt, right-aligned
  Logo: white reversed, left-aligned (40px wide)
```

### Template 3: Two-Column Layout

```
Background: #FFFFFF
Top accent bar: 5px gradient
Slide title: Poppins Bold 28pt #59267E, full width

Left column (50% width):
  Text content — body, bullets, sub-points
  Body: Poppins Regular 14pt #244495

Right column (48% width, 2% gap):
  Visual: diagram, icon group, image, or stats block
  If stats: large number 56pt Poppins Bold #BD72EF
             label below: 12pt Poppins Regular #7751E2

Footer bar as standard
```

### Template 4: Icon Grid Slide (2×2 or 2×3)

```
Background: #FFFFFF
Top accent bar + title as standard

Grid items (each):
  Icon container: circle, 56px, fill #D48EEF or #8E9BF5
  Icon: outline style, white, 28px
  Bold label: Poppins SemiBold 15pt #59267E, below icon
  Description: Poppins Regular 12pt #244495, 2 lines max

Grid spacing: 0.4" between items
Grid alignment: centered or left-aligned — consistent across all items

Footer bar as standard
```

### Template 5: Proof / Stats Slide

```
Background: #FFFFFF
Top accent bar + title as standard

Large stat callout (1–3 stats):
  Number: Poppins Bold 64–72pt #BD72EF
  Label: Poppins Regular 13pt #7751E2, directly below
  Visual separator: thin 1px #D48EEF vertical line between stats

Case study block (if included):
  Left border: 4px solid #BD72EF
  Background: #FFFFFF
  Company name: Poppins SemiBold 14pt #59267E
  Outcome: Poppins Regular 13pt #244495
  Result metric: Poppins Bold 18pt #7751E2

Footer bar as standard
```

### Template 6: CTA / Close Slide

```
Background: #FFFFFF
Top accent bar: 6px gradient (slightly thicker than content slides)

Centered content:
  Headline: Poppins Bold 36pt #59267E
  Supporting line: Poppins Regular 18pt #7751E2
  
CTA button:
  Fill: #BD72EF
  Text: white Poppins Bold 14pt
  Radius: 8px
  Padding: 14px 32px
  Width: auto to content

Contact/next step:
  Poppins Regular 13pt #244495
  Email or booking link below button

Footer bar: #59267E, Teqfocus logo white center or left
```

---

## pptxgenjs Color Reference

```javascript
// Always use these exact values in pptxgenjs
const TEQFOCUS = {
  lightPurple:  'BD72EF',  // primary — headlines, CTAs
  slateBlue:    '7751E2',  // sub-heads, icons
  darkPurple:   '59267E',  // footer, labels
  lightBlue:    '8E9BF5',  // supporting icons
  green:        '21A88A',  // success states
  darkBlue:     '244495',  // body text
  lightOrchid:  'D48EEF',  // soft fills
  darkOrchid:   'A33BC7',  // mid accents
  mauve:        'E2B0F3',  // subtle tints
  white:        'FFFFFF',  // ALL backgrounds
  gradStart:    'BD71EF',  // gradient start
  gradEnd:      '8D9BF5',  // gradient end
};

// Accent bar (top of every slide)
pptx.addShape(pptx.shapes.RECTANGLE, {
  x: 0, y: 0, w: '100%', h: 0.06,
  fill: { type: 'gradient', stops: [
    { color: TEQFOCUS.gradStart, position: 0 },
    { color: TEQFOCUS.gradEnd, position: 100 }
  ]}
});

// Footer bar (bottom of every slide)
pptx.addShape(pptx.shapes.RECTANGLE, {
  x: 0, y: 6.9, w: '100%', h: 0.35,
  fill: { color: TEQFOCUS.darkPurple }
});

// Title text
slide.addText('Slide Title Here', {
  x: 0.5, y: 0.15, w: 9, h: 0.6,
  fontFace: 'Poppins', fontSize: 28, bold: true,
  color: TEQFOCUS.darkPurple
});

// Body text
slide.addText('Body content here', {
  x: 0.5, y: 1.0, w: 9, h: 4,
  fontFace: 'Poppins', fontSize: 14,
  color: TEQFOCUS.darkBlue
});
```

---

## Slide-by-Slide QA

After generating, convert to images and check:
- [ ] White background on every slide — no dark fills
- [ ] Top accent bar present and gradient correctly applied
- [ ] Footer bar `#59267E` on every slide
- [ ] No text overflowing boxes
- [ ] Poppins font rendered (not substituted with Arial)
- [ ] Correct color for each element type (title vs body vs callout)
- [ ] Logo placed correctly with clear space
- [ ] No underlines on headings
- [ ] Consistent margins (0.5" minimum)
