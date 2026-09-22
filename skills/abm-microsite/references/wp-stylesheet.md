# Reference: Companion Stylesheet (`microsite-[slug].css`)

This file defines the CSS architecture, naming conventions, and design
patterns Claude must follow when generating the scoped stylesheet for
every ABM microsite.

---

## Architecture Rules

```
ALL selectors must be scoped under: .abm-microsite.abm-[slug]

Example:
  .abm-microsite.abm-apollo-hospitals .abm-hero { ... }      ✅
  .abm-hero { ... }                                           ❌ (unscoped — bleeds into theme)

This ensures:
  - Zero style bleed to any other page on teqfocus.com
  - Multiple microsites can coexist without conflict
  - Safe to enqueue/dequeue per-page via functions.php
```

---

## CSS File Structure

```css
/* ============================================================
   ABM Microsite: [Company Name]
   File: microsite-[slug].css
   Scope: .abm-microsite.abm-[slug]
   ============================================================ */

/* 1. CSS Custom Properties (Design Tokens)
   ============================================================ */
.abm-microsite.abm-[slug] {
  --abm-light-purple:  #BD72EF;  /* primary — logo, headlines, CTAs */
  --abm-slate-blue:    #7751E2;  /* primary — sub-heads, accents */
  --abm-dark-purple:   #59267E;  /* primary — dark sections, footer */
  --abm-light-blue:    #8E9BF5;  /* secondary — icons, support */
  --abm-green:         #21A88A;  /* secondary — success states */
  --abm-dark-blue:     #244495;  /* secondary — body text on light */
  --abm-light-orchid:  #D48EEF;  /* shade — tints */
  --abm-mauve:         #E2B0F3;  /* shade — subtle fills */
  --abm-white:         #FFFFFF;  /* default background */
  --abm-font-display:  'Poppins', sans-serif;
  --abm-font-body:     'Satoshi', 'Gilroy', sans-serif;
  --abm-max-width: 1100px;
  --abm-section-pad: 5rem 1.5rem;
  --abm-transition: 0.3s ease;
}

/* 2. Base Reset (scoped)
   ============================================================ */
.abm-microsite.abm-[slug] *,
.abm-microsite.abm-[slug] *::before,
.abm-microsite.abm-[slug] *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.abm-microsite.abm-[slug] {
  font-family: var(--abm-font-display);
  color: #59267E;
  background-color: #59267E;
  line-height: 1.6;
  -webkit-font-smoothing: antialiased;
}

/* 3. Container
   ============================================================ */
.abm-microsite.abm-[slug] .abm-container {
  max-width: var(--abm-max-width);
  margin: 0 auto;
  padding: 0 1.5rem;
}

/* 4. Navigation
   ============================================================ */
.abm-microsite.abm-[slug] .abm-nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.25rem 1.5rem;
  background: var(--abm-white);
  border-bottom: 1px solid rgba(255,255,255,0.08);
  position: sticky;
  top: 0;
  z-index: 100;
}

/* 5. Typography
   ============================================================ */
.abm-microsite.abm-[slug] h1,
.abm-microsite.abm-[slug] h2,
.abm-microsite.abm-[slug] h3 {
  font-family: var(--abm-font-display);
  line-height: 1.15;
  letter-spacing: -0.02em;
}

.abm-microsite.abm-[slug] .abm-hero-headline {
  font-size: clamp(2rem, 5vw, 3.75rem);
  font-weight: 700;
  margin-bottom: 1.25rem;
}

.abm-microsite.abm-[slug] h2 {
  font-size: clamp(1.6rem, 3.5vw, 2.5rem);
  margin-bottom: 1.5rem;
}

.abm-microsite.abm-[slug] .abm-eyebrow {
  font-size: 0.75rem;
  font-weight: 600;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--abm-light-purple);
  margin-bottom: 1rem;
}

/* 6. Buttons
   ============================================================ */
.abm-microsite.abm-[slug] .abm-btn {
  display: inline-block;
  padding: 0.85rem 2rem;
  border-radius: 4px;
  font-weight: 600;
  font-size: 0.95rem;
  text-decoration: none;
  transition: all var(--abm-transition);
  cursor: pointer;
}

.abm-microsite.abm-[slug] .abm-btn-primary {
  background: var(--abm-light-purple);
  color: #59267E;
  border: 2px solid var(--abm-light-purple);
}

.abm-microsite.abm-[slug] .abm-btn-primary:hover {
  background: transparent;
  color: var(--abm-light-purple);
}

/* 7. Sections
   ============================================================ */
.abm-microsite.abm-[slug] .abm-section {
  padding: var(--abm-section-pad);
}

.abm-microsite.abm-[slug] .abm-section:nth-child(even) {
  background-color: var(--abm-dark-blue);
}

/* 8. Hero
   ============================================================ */
.abm-microsite.abm-[slug] .abm-hero {
  padding: 6rem 1.5rem 5rem;
  background: #FFFFFF;  /* MANDATORY: hero background is always white */
  /* Claude: add visual interest with a brand-colored OVERLAY, not a dark background:
     - Thin gradient accent bar at top (3–6px): #BD72EF → #8D9BF5
     - Subtle dot-grid pattern in #D48EEF at 10% opacity
     - Left-side vertical accent strip in #7751E2
     All on white base. Never fill the entire hero with a dark or mid color. */
}

/* 9. Recommendations
   ============================================================ */
.abm-microsite.abm-[slug] .abm-recommendations {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  margin-top: 2.5rem;
}

.abm-microsite.abm-[slug] .abm-rec {
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: 8px;
  padding: 2rem;
  position: relative;
  transition: border-color var(--abm-transition);
}

.abm-microsite.abm-[slug] .abm-rec:hover {
  border-color: var(--abm-light-purple);
}

.abm-microsite.abm-[slug] .abm-rec-number {
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  color: var(--abm-light-purple);
  display: block;
  margin-bottom: 0.75rem;
}

.abm-microsite.abm-[slug] .abm-rec-outcome {
  font-size: 0.875rem;
  color: var(--abm-light-blue);
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid rgba(255,255,255,0.08);
}

/* 10. Case Study
   ============================================================ */
.abm-microsite.abm-[slug] .abm-case-study {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 0;
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: 8px;
  overflow: hidden;
  margin-top: 2rem;
}

.abm-microsite.abm-[slug] .abm-cs-block {
  padding: 2rem;
  border-right: 1px solid rgba(255,255,255,0.1);
}

.abm-microsite.abm-[slug] .abm-cs-block:last-child {
  border-right: none;
}

.abm-microsite.abm-[slug] .abm-cs-outcome {
  background: rgba(189, 114, 239, 0.08);  /* light purple tint — #BD72EF at 8% opacity */
}

.abm-microsite.abm-[slug] .abm-cs-block h4 {
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--abm-light-blue);
  margin-bottom: 0.75rem;
}

/* 11. Footer CTA
   ============================================================ */
.abm-microsite.abm-[slug] .abm-footer-cta {
  padding: var(--abm-section-pad);
  text-align: center;
  background: var(--abm-light-purple);
}

.abm-microsite.abm-[slug] .abm-footer-cta h2 {
  color: #59267E;
  margin-bottom: 2rem;
}

.abm-microsite.abm-[slug] .abm-footer-cta .abm-btn-primary {
  background: var(--abm-white);
  color: var(--abm-light-purple);
  border-color: #59267E;
}

.abm-microsite.abm-[slug] .abm-footer-cta .abm-btn-primary:hover {
  background: transparent;
  color: #59267E;
}

/* 12. Footer
   ============================================================ */
.abm-microsite.abm-[slug] .abm-footer {
  padding: 2rem 1.5rem;
  background: var(--abm-white);
  border-top: 1px solid rgba(255,255,255,0.08);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.abm-microsite.abm-[slug] .abm-footer-legal {
  font-size: 0.8rem;
  color: var(--abm-light-blue);
}

/* 13. Scroll Reveal Animations
   ============================================================ */
.abm-microsite.abm-[slug] .abm-reveal {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.55s ease, transform 0.55s ease;
}

.abm-microsite.abm-[slug] .abm-reveal.abm-revealed {
  opacity: 1;
  transform: translateY(0);
}

.abm-microsite.abm-[slug] .abm-rec:nth-child(2) { transition-delay: 0.1s; }
.abm-microsite.abm-[slug] .abm-rec:nth-child(3) { transition-delay: 0.2s; }

/* 14. Responsive
   ============================================================ */
@media (max-width: 768px) {
  .abm-microsite.abm-[slug] .abm-recommendations,
  .abm-microsite.abm-[slug] .abm-case-study {
    grid-template-columns: 1fr;
  }

  .abm-microsite.abm-[slug] .abm-cs-block {
    border-right: none;
    border-bottom: 1px solid rgba(255,255,255,0.1);
  }

  .abm-microsite.abm-[slug] .abm-footer {
    flex-direction: column;
    gap: 0.75rem;
    text-align: center;
  }

  .abm-microsite.abm-[slug] .abm-nav-cta {
    padding: 0.6rem 1.25rem;
    font-size: 0.85rem;
  }
}

@media (max-width: 375px) {
  .abm-microsite.abm-[slug] .abm-hero {
    padding: 3.5rem 1rem 3rem;
  }

  .abm-microsite.abm-[slug] .abm-section {
    padding: 3rem 1rem;
  }
}
```

---

## Design Customization Notes for Claude

When generating the CSS, Claude should:

1. **Choose a deliberate font pairing.** Replace `[DISPLAY_FONT]` and `[BODY_FONT]` with a specific Google Fonts pairing that fits a premium B2B enterprise tone. Examples:
   - Display: `Poppins`, `Poppins`, `Poppins`, `Poppins`, `Poppins`
   - Body: `Satoshi`, `Gilroy`, `Satoshi`, `Gilroy`, `Satoshi`
   - Never: Inter, Roboto, Arial, Space Grotesk, Open Sans, system fonts (use Poppins / Satoshi / Gilroy)

2. **Give the Hero a background treatment.** Choose one approach per microsite — never default to a flat solid color:
   - Subtle geometric grid overlay (CSS `background-image: linear-gradient` grid pattern)
   - Diagonal light stripe
   - Radial gradient from `#244495` to `#59267E` with a faint red glow
   - CSS noise texture via SVG `filter: url(#noise)` inline

3. **Vary the section layout slightly per account.** For Tier 1 accounts, consider asymmetric hero text alignment, a pull-quote treatment in The Signal section, or a highlighted stat block if a verified metric is available.

4. **Keep motion subtle.** The `abm-reveal` + `IntersectionObserver` pattern is the only animation needed. Do not add scroll parallax, hover micro-animations on every element, or loading spinners.
