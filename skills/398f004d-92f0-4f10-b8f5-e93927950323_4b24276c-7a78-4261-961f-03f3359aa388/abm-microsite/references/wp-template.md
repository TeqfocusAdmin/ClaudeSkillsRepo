# Reference: WordPress Page Template (`page-[slug].php`)

This file defines the exact structure and code patterns Claude must follow
when generating the WordPress custom page template for every ABM microsite.

---

## Full File Structure

```php
<?php
/*
 * Template Name: ABM Microsite – [Company Name]
 * Description: Personalized ABM page for [Company Name]
 */
get_header(); ?>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=[DISPLAY_FONT]&family=[BODY_FONT]&display=swap" rel="stylesheet">

<div class="abm-microsite abm-[slug]">

  <!-- 1. MINIMAL NAV -->
  <nav class="abm-nav">
    <a href="<?php echo home_url(); ?>" class="abm-logo">Teqfocus</a>
    <a href="[CTA_URL]" class="abm-nav-cta">[CTA_LABEL]</a>
  </nav>

  <!-- 2. HERO -->
  <section class="abm-hero">
    <div class="abm-container">
      <p class="abm-eyebrow">[INDUSTRY] · [SERVICE_FOCUS]</p>
      <h1 class="abm-hero-headline">[SPECIFIC PROBLEM HEADLINE FOR THIS COMPANY]</h1>
      <p class="abm-hero-sub">[TEQFOCUS POV — ONE SENTENCE ON HOW THIS GETS SOLVED]</p>
      <a href="[CTA_URL]" class="abm-btn abm-btn-primary">[CTA_LABEL]</a>
    </div>
  </section>

  <!-- 3. THE SIGNAL -->
  <section class="abm-section abm-signal">
    <div class="abm-container">
      <h2>Why we're reaching out to [Company Name] now</h2>
      <div class="abm-signal-body">
        <p>[PARA 1: Specific company context — industry situation + their trigger]</p>
        <p>[PARA 2: What this means for their business right now]</p>
        <p>[PARA 3: Why Teqfocus's specific experience is relevant to this moment]</p>
      </div>
    </div>
  </section>

  <!-- 4. OUR PERSPECTIVE -->
  <section class="abm-section abm-perspective">
    <div class="abm-container">
      <h2>What we'd focus on for [Company Name]</h2>
      <div class="abm-recommendations">

        <div class="abm-rec abm-reveal">
          <span class="abm-rec-number">01</span>
          <h3>[RECOMMENDATION TITLE]</h3>
          <p>[2-LINE DESCRIPTION — specific to their situation]</p>
          <p class="abm-rec-outcome">Expected outcome: [MEASURABLE RESULT]</p>
        </div>

        <div class="abm-rec abm-reveal">
          <span class="abm-rec-number">02</span>
          <h3>[RECOMMENDATION TITLE]</h3>
          <p>[2-LINE DESCRIPTION]</p>
          <p class="abm-rec-outcome">Expected outcome: [MEASURABLE RESULT]</p>
        </div>

        <div class="abm-rec abm-reveal">
          <span class="abm-rec-number">03</span>
          <h3>[RECOMMENDATION TITLE]</h3>
          <p>[2-LINE DESCRIPTION]</p>
          <p class="abm-rec-outcome">Expected outcome: [MEASURABLE RESULT]</p>
        </div>

      </div>
    </div>
  </section>

  <!-- 5. HOW WE'VE DONE THIS -->
  <section class="abm-section abm-proof">
    <div class="abm-container">
      <p class="abm-eyebrow">Proof of work</p>
      <h2>How we've done this before</h2>
      <div class="abm-case-study">
        <div class="abm-cs-block">
          <h4>The challenge</h4>
          <p>[CHALLENGE — 2–3 sentences, industry-matched]</p>
        </div>
        <div class="abm-cs-block">
          <h4>What we built</h4>
          <p>[SOLUTION — 2–3 sentences, technology specifics included]</p>
        </div>
        <div class="abm-cs-block abm-cs-outcome">
          <h4>The outcome</h4>
          <p>[OUTCOME — verified metrics only, flag with [VERIFY] if uncertain]</p>
        </div>
      </div>
    </div>
  </section>

  <!-- 6. ABOUT TEQFOCUS -->
  <section class="abm-section abm-about">
    <div class="abm-container">
      <h2>About Teqfocus</h2>
      <p>[3 SENTENCES MAX: Who Teqfocus is, what they do, Summit credential surfaced naturally once]</p>
      <a href="<?php echo home_url(); ?>" class="abm-link">teqfocus.com →</a>
    </div>
  </section>

  <!-- 7. FOOTER CTA -->
  <section class="abm-footer-cta">
    <div class="abm-container">
      <h2>Ready to explore what this looks like for [Company Name]?</h2>
      <a href="[CTA_URL]" class="abm-btn abm-btn-primary">[CTA_LABEL]</a>
    </div>
  </section>

  <footer class="abm-footer">
    <div class="abm-container">
      <a href="<?php echo home_url(); ?>" class="abm-logo">Teqfocus</a>
      <p class="abm-footer-legal">© <?php echo date('Y'); ?> Teqfocus. All rights reserved.</p>
    </div>
  </footer>

</div><!-- .abm-microsite -->

<script>
// Scroll-triggered reveal animations
(function() {
  const reveals = document.querySelectorAll('.abm-reveal');
  if (!reveals.length) return;

  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(function(entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('abm-revealed');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.15 });

  reveals.forEach(function(el) { observer.observe(el); });
})();
</script>

<?php get_footer(); ?>
```

---

## Rules When Filling This Template

**Headlines:**
- Hero h1: Must name the specific problem for this company. No generic statements.
- Section h2s: Can reference company name directly when natural.
- Recommendation h3s: Action-oriented titles — what Teqfocus will do, not what they offer.

**The Signal section:**
- Para 1: Opens with an industry or company-specific observation — not about Teqfocus.
- Para 2: What the implication is for this business specifically.
- Para 3: Why this moment and why Teqfocus. Keep the Teqfocus reference brief here.

**Recommendations:**
- 3 recommendations only — never 4 or 5. Focus over comprehensiveness.
- Each must feel like a practitioner's brief, not a services menu item.
- Outcomes must be specific (e.g. "reduces duplicate records by ~40% in 90 days") not vague ("improves data quality").

**Proof / Case Study:**
- Must be industry-matched to the target account.
- Use approved proof points from the knowledge base only.
- Never invent metrics — flag with [VERIFY] if uncertain.

**About Teqfocus:**
- 3 sentences maximum.
- Summit Partnership surfaces naturally in one of the 3 sentences.
- Not a company bio — focus on what Teqfocus does for companies like this one.

**CTA:**
- Use the exact `cta_url` from the intake. If placeholder: `[BOOKING_LINK_PLACEHOLDER]`.
- CTA label should match the `cta_type` — e.g. "Book an Architecture Review" not just "Contact Us".
