# Reference: A/B Testing — Teqfocus Pages

Use when designing experiments to improve conversion on teqfocus.com pages,
ABM microsites, or email campaigns.

---

## What's Worth Testing vs What's Not

**Test these (high volume, high impact):**
- Homepage hero headline — most traffic, biggest leverage
- Primary CTA copy ("Book a call" vs "Get a data readiness review")
- ABM microsite headline (personalized vs generic)
- Email subject lines (volume available in HubSpot sequences)
- Case study placement (above vs below CTA)

**Don't test these (too low volume):**
- Individual service pages (not enough traffic for significance)
- Footer copy
- Minor color changes
- Navigation items

---

## Test Design Framework

Before running any test, document:

```
TEST BRIEF

Page / Asset: [URL or asset name]
Hypothesis: If we [change X], then [metric Y] will increase by [Z%] because [reason]
Primary metric: [conversions / click rate / open rate]
Secondary metric: [time on page / scroll depth]
Sample size needed: [calculate below]
Test duration: [minimum 2 weeks for statistical validity]
Traffic source: [organic / email / ABM]

CONTROL (current version):
[Describe current state]

VARIANT (what we're testing):
[Describe the change — be specific]

WINNER CRITERIA:
Declare winner when: 95% statistical confidence + minimum 100 conversions per variant
```

---

## Sample Size Guidance

For Teqfocus page traffic levels, be realistic:

| Page monthly visitors | Min test duration | Expected result |
|---|---|---|
| < 500 | Not worth testing | Not enough data for significance |
| 500–2,000 | 4–8 weeks | Possible with large effect size |
| 2,000+ | 2–4 weeks | Standard A/B testing feasible |

**Email sequences** (higher volume): 2-week test usually sufficient with 500+ sends.

---

## Teqfocus Testing Priorities

**Priority 1: Email subject lines**
Easiest to test, clearest signal, fastest data.
Test: question vs statement, personalized vs generic, short vs long.

**Priority 2: Homepage hero headline**
Highest traffic page. Even small improvement compounds.
Test: problem-led vs outcome-led, specific vs broad.

**Priority 3: CTA copy**
Test across all high-traffic pages simultaneously.
"Book a call" vs "Schedule a data readiness review" vs "Get your assessment"

**Priority 4: ABM microsite headlines**
Test personalized vs industry-specific vs pain-led for same target segment.

---

## Tools

- Website A/B testing: Google Optimize (deprecated — use VWO or Optimizely), or manual via WordPress
- Email subject line testing: HubSpot A/B testing (built in)
- Statistical significance calculator: https://www.abtestguide.com/calc/
