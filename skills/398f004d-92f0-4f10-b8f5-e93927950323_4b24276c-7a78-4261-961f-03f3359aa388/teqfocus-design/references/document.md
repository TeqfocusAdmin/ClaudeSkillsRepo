# Reference: Teqfocus Document Production (.docx)

Applies to: Proposals · Reports · Case studies · QBR decks · Capability briefs ·
Partner guides · Technical assessments

Also read: `/mnt/skills/public/docx/SKILL.md`

---

## Document Structure

```
1. Cover page
2. Executive summary (1 page max)
3. Body sections (content-dependent)
4. Appendix (if needed)
```

---

## Style Definitions — docx-js

```javascript
const { Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
        AlignmentType, HeadingLevel, BorderStyle, WidthType, ShadingType } = require('docx');

const doc = new Document({
  styles: {
    default: {
      document: { run: { font: "Calibri", size: 26, color: "244495" } }
      // Calibri is Poppins fallback — correct for docx production
    },
    paragraphStyles: [
      {
        id: "Heading1",
        name: "Heading 1",
        basedOn: "Normal",
        next: "Normal",
        quickFormat: true,
        run: { font: "Calibri", size: 40, bold: true, color: "59267E" },
        paragraph: {
          spacing: { before: 320, after: 160 },
          outlineLevel: 0,
          border: { bottom: {
            style: BorderStyle.SINGLE, size: 3,
            color: "BD72EF", space: 1
          }}
        }
      },
      {
        id: "Heading2",
        name: "Heading 2",
        basedOn: "Normal",
        next: "Normal",
        quickFormat: true,
        run: { font: "Calibri", size: 32, bold: true, color: "7751E2" },
        paragraph: { spacing: { before: 240, after: 120 }, outlineLevel: 1 }
      },
      {
        id: "Heading3",
        name: "Heading 3",
        basedOn: "Normal",
        next: "Normal",
        quickFormat: true,
        run: { font: "Calibri", size: 26, bold: true, color: "244495" },
        paragraph: { spacing: { before: 180, after: 80 }, outlineLevel: 2 }
      },
    ]
  }
});
```

---

## Cover Page Spec

```javascript
// Cover page section — separate from body
{
  properties: {
    page: { size: { width: 12240, height: 15840 } }
  },
  children: [
    // Top accent bar — simulate with thick border paragraph
    new Paragraph({
      border: { bottom: { style: BorderStyle.SINGLE, size: 24, color: "BD72EF" } },
      spacing: { before: 0, after: 480 }
    }),

    // Document title
    new Paragraph({
      children: [new TextRun({
        text: "[DOCUMENT TITLE]",
        font: "Calibri", size: 56, bold: true, color: "59267E"
      })],
      spacing: { before: 1440, after: 240 }
    }),

    // Sub-title
    new Paragraph({
      children: [new TextRun({
        text: "[Sub-title or descriptor]",
        font: "Calibri", size: 28, color: "7751E2"
      })],
      spacing: { after: 2880 }
    }),

    // Prepared for / date
    new Paragraph({
      children: [new TextRun({
        text: "Prepared for: [Client/Recipient]",
        font: "Calibri", size: 22, color: "244495"
      })],
      spacing: { after: 120 }
    }),
    new Paragraph({
      children: [new TextRun({
        text: "[Month Year]",
        font: "Calibri", size: 22, color: "244495"
      })],
      spacing: { after: 0 }
    }),

    // Bottom accent
    new Paragraph({
      border: { top: { style: BorderStyle.SINGLE, size: 24, color: "59267E" } },
      spacing: { before: 2400, after: 0 }
    }),
  ]
}
```

---

## Body Content — Key Patterns

### Section heading with accent
```javascript
// H1 with bottom border in #BD72EF — defined in styles above
new Paragraph({
  heading: HeadingLevel.HEADING_1,
  children: [new TextRun("Section Title")]
})
```

### Callout box (key insight)
```javascript
// Simulate with table — single cell, left border accent
new Table({
  width: { size: 9360, type: WidthType.DXA },
  columnWidths: [9360],
  rows: [new TableRow({
    children: [new TableCell({
      borders: {
        top: { style: BorderStyle.NONE },
        bottom: { style: BorderStyle.NONE },
        right: { style: BorderStyle.NONE },
        left: { style: BorderStyle.SINGLE, size: 18, color: "BD72EF" }
      },
      shading: { fill: "F5EAFC", type: ShadingType.CLEAR },
      // F5EAFC = very light orchid tint
      margins: { top: 120, bottom: 120, left: 200, right: 120 },
      children: [
        new Paragraph({
          children: [new TextRun({
            text: "[Callout label]",
            font: "Calibri", size: 24, bold: true, color: "59267E"
          })]
        }),
        new Paragraph({
          children: [new TextRun({
            text: "[Callout body text]",
            font: "Calibri", size: 22, color: "244495"
          })]
        })
      ]
    })]
  })]
})
```

### Data table
```javascript
// Header row: #D48EEF fill, #7751E2 bold text
// Body rows: white, #244495 regular text
// Border: #D48EEF 1px all sides

new TableRow({
  tableHeader: true,
  children: columns.map(col => new TableCell({
    shading: { fill: "D48EEF", type: ShadingType.CLEAR },
    borders: { /* all sides: SINGLE size 4 color D48EEF */ },
    margins: { top: 80, bottom: 80, left: 120, right: 120 },
    children: [new Paragraph({
      children: [new TextRun({
        text: col, font: "Calibri", size: 22, bold: true, color: "7751E2"
      })]
    })]
  }))
})
```

### Stat highlight inline
```javascript
// Large number in body copy context
new Paragraph({
  children: [
    new TextRun({
      text: "[N]",
      font: "Calibri", size: 56, bold: true, color: "BD72EF"
    }),
    new TextRun({
      text: "  [metric label]",
      font: "Calibri", size: 24, color: "7751E2"
    })
  ],
  spacing: { before: 240, after: 240 }
})
```

---

## Footer — Every Page

```javascript
// In section properties
footers: {
  default: new Footer({
    children: [
      new Paragraph({
        border: { top: { style: BorderStyle.SINGLE, size: 4, color: "59267E" } },
        children: [
          new TextRun({ text: "Teqfocus  |  teqfocus.com", font: "Calibri", size: 18, color: "59267E" }),
          new TextRun({ text: "  |  Page ", font: "Calibri", size: 18, color: "59267E" }),
          new SimpleField("PAGE"),
        ],
        alignment: AlignmentType.RIGHT
      })
    ]
  })
}
```

---

## QA Checklist — Document
- [ ] Cover page: white background, `#59267E` title, `#BD72EF` accent bar
- [ ] H1: `#59267E`, H2: `#7751E2`, H3: `#244495`, body: `#244495`
- [ ] Table headers: `#D48EEF` fill, `#7751E2` bold text
- [ ] Callout boxes: light orchid tint left border `#BD72EF`
- [ ] Footer: `#59267E` top border, Teqfocus branding, page number
- [ ] Page size: US Letter (12240 × 15840 DXA)
- [ ] No Arial, Times New Roman, or system default fonts
- [ ] No invented metrics — `[VERIFY]` flagged where needed
- [ ] Validated with `validate.py` before delivery
