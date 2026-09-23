---
name: abm-microsite
description: >
  ABM microsite skill for Teqfocus — builds account-specific, personalized microsites
  deployed on the Teqfocus WordPress site at teqfocus.com/abm/[company-slug].
  Use this skill whenever the user wants to create a personalized microsite, ABM landing
  page, account-specific page, or any web asset targeting a named account or company.
  Also trigger when the user mentions: ABM page, personalized page, microsite, account
  page, company-specific landing page, Tier 1/2/3 account content, or wants to build
  something for a specific named company. This skill must be used for ALL Teqfocus
  microsite builds — do not attempt without reading this skill first. Always use this
  skill even if the request seems simple like "build a microsite for [Company]".
---

# Teqfocus ABM Microsite Skill

This skill governs all personalized microsite production for Teqfocus. Every microsite
is an account-level asset (not contact-level) delivered as two WordPress-ready files
plus a deployment brief and a companion outreach email.

## How to Use This Skill

1. **Read this SKILL.md fully** before producing any asset
2. **Confirm the intake** using the Brief Checklist (Section 4) — ask for missing inputs
3. **Select the tier** (Section 5) to calibrate personalization depth
4. **Load the relevant reference file** for the output type needed
5. **Deliver all four deliverables** as defined in Section 3

## Reference Files

| Output | Reference File |
|---|---|
| WordPress page template (`.php`) | `references/wp-template.md` |
| Companion stylesheet (`.css`) | `references/wp-stylesheet.md` |
| Developer deployment brief | `references/deployment-brief.md` |
| Companion outreach email | `references/outreach-email.md` |
| Page section copy guidelines | `references/page-sections.md` |
| Industry personalization lookup | `references/industry-playbook.md` |

---

## Section 1: What a Teqfocus ABM Microsite Is

A Teqfocus ABM microsite is a **dedicated WordPress page** built for a single target
company, deployed at `teqfocus.com/abm/[company-slug]`. It is:

- **Account-level**, not contact-level — multiple senior buyers at the company may land
  on it. It speaks to the company's situation, not a single job title.
- **WordPress-native** — uses a custom page template (`.php`), a scoped companion
  stylesheet (`.css`), and the active theme's header/footer. No page builders. No
  external CSS frameworks.
- **Self-contained per account** — each microsite is its own template file and
  stylesheet. Adding one never affects other pages or the main theme.
- **Conversion-optimized** — single scroll, one CTA (appears twice: hero + footer),
  no main site navigation. The only goal is a booked meeting.

---

## Section 2: Teqfocus Company Identity

### Core Positioning
> *"Teqfocus helps enterprises transform across the Data, Analytics, AI, and Application
> layer — powered by a multi-cloud architecture built on Salesforce, Snowflake,
> AWS/Azure/GCP, Databricks, and Tableau. We bring deep industry vertical expertise so
> every engagement starts with your problem, not our platform."*

### Partnership Credentials
| Partner | Status |
|---|---|
| **Salesforce** | **Summit Partner** — top tier of the global partner ecosystem |
| **Snowflake** | Partner |
| **AWS / Azure / GCP** | Cloud Partners |
| **Databricks** | Partner |
| **Tableau / CRM Analytics** | Partner |

> ⚠️ Summit Partnership is a long-standing credential. Never say "recently achieved."
> Surface it once, naturally, in the proof or about section. Never announce it.

### Service Lines
Data & Analytics · AI & Machine Learning · Salesforce Transformation ·
Cloud Infrastructure · Custom App Development · Managed Services / AMS

### Industries Served
Healthcare · Telecom · Financial Services · Retail / CPG · Hi-Tech / SaaS

---

## Section 3: The Four Deliverables

Every microsite request produces **exactly four deliverables**. Never deliver fewer.

| # | Deliverable | File Name | Purpose |
|---|---|---|---|
| 1 | WordPress page template | `page-[slug].php` | The full page — HTML, embedded `<style>` imports, JS block, WP `get_header()` / `get_footer()` |
| 2 | Companion stylesheet | `microsite-[slug].css` | All CSS scoped under `.abm-microsite.abm-[slug]` — zero theme bleed |
| 3 | Developer deployment brief | `deployment-[slug].md` | Step-by-step: file placement, `functions.php` snippet, WP page setup, URL structure |
| 4 | Companion outreach email | `email-[slug].md` | Subject line + 4–6 sentence personalized email for a senior Teqfocus person to send |

---

## Section 4: Brief Intake Checklist

**Confirm all inputs before generating. Ask if any are missing.**

| Input | Description | Required? |
|---|---|---|
| `company_name` | Full name as displayed on the page | ✅ |
| `company_slug` | URL-safe slug e.g. `apollo-hospitals` | ✅ |
| `industry` | Healthcare / Telecom / FinServ / Retail-CPG / Hi-Tech-SaaS | ✅ |
| `primary_pain` | Specific trigger or problem that brought them into scope | ✅ |
| `service_focus` | Data-AI / Salesforce / Full-Stack / specific solution | ✅ |
| `account_tier` | Tier 1 / Tier 2 / Tier 3 (see Section 5) | ✅ |
| `proof_point` | Case study or outcome to use in the proof section | Tier 1 required |
| `cta_type` | Discovery call / Architecture review / AI readiness workshop / etc. | ✅ |
| `cta_url` | Live booking link or `[BOOKING_LINK_PLACEHOLDER]` | ✅ |
| `additional_context` | Known tech stack, recent news, contacts who will see the page | Optional |

> Do not fill missing inputs with invented details. Flag with `[NEEDS INPUT]`.

---

## Section 5: Personalization Tiers

| Tier | Accounts | Depth | Time in Claude |
|---|---|---|---|
| **Tier 1** | Top 10–20 named accounts | Full: company-specific pain + timing + proof match | 20–30 min |
| **Tier 2** | Next 50–100 targets | Industry + persona — company name + role context | 10–15 min |
| **Tier 3** | 100+ vertical batch | Industry master with `{{COMPANY_NAME}}` token swaps | 5 min per account |

**Tier 1 goal:** Prospect thinks *"They already know our problem."*
**Tier 3 goal:** Prospect thinks *"They understand my industry."*
Both are wins. Only Tier 1 requires deep account research as input.

---

## Section 6: Content Rules

Apply these to every word of every microsite.

### Always
- Write from a senior Teqfocus practitioner's POV — not a marketing department
- Make every sentence specific to the account — if it works on any company's page, rewrite it
- Connect every capability to a measurable outcome
- Use industry-specific language the target buyer actually uses
- Flag unverified metrics with `[VERIFY]`
- Flag image dependencies with `[IMAGE: description]`

### Never
- Use: leverage · synergy · holistic · best-in-class · cutting-edge · robust · end-to-end solutions
- Open any section with: "Excited to share" · "Proud to announce" · "We are pleased to"
- Invent case study metrics or statistics
- Mention competitors by name
- Announce the Summit credential — surface it naturally, once
- Place more than one CTA on the page (it appears twice at the same URL — hero + footer)

---

## Section 7: WordPress Technical Rules

These are non-negotiable for developer handoff.

```
EVERY .php file must:
├── Open with WordPress template comment header
│     <?php /* Template Name: ABM Microsite – [Company Name] */ get_header(); ?>
├── Wrap all content in:
│     <div class="abm-microsite abm-[slug]">...</div>
├── Use home_url() for all internal links (never hardcoded URLs)
├── Place JS block just before <?php get_footer(); ?>
└── Close with <?php get_footer(); ?>

EVERY .css file must:
├── Scope ALL selectors under .abm-microsite.abm-[slug]
├── Contain zero unscoped rules
└── Be enqueued conditionally via functions.php (see references/deployment-brief.md)

NEVER:
├── Use inline style="" attributes (all styles go in the .css file)
├── Load external CSS frameworks (Bootstrap, Tailwind, etc.)
├── Use page builder markup (Elementor, Gutenberg blocks, Divi)
├── Hardcode the site URL
└── Use wp_enqueue_script for simple vanilla JS (inline <script> block is fine)

GOOGLE FONTS:
└── Load via <link> in <head> only — one call, two fonts max
```

---

## Section 8: Page Section Structure (Fixed Order)

Read `references/page-sections.md` for full copy guidelines per section.

```
1. MINIMAL NAV BAR      Logo + single CTA button only. No main site nav.
2. HERO                 Specific problem headline · Teqfocus POV sub-head · CTA button
3. THE SIGNAL           "Why we're reaching out to [Company] now" — 2–3 paras
4. OUR PERSPECTIVE      3 focused recommendations for [Company] — not a services menu
5. HOW WE'VE DONE THIS  1 industry-matched case study: Challenge → Solution → Outcome
6. ABOUT TEQFOCUS       3 sentences · Summit credential surfaced once
7. FOOTER CTA           "Ready to explore this for [Company]?" · CTA button · minimal footer
```

---

## Section 9: Design Rules

- **Brand colors:** `#59267E` navy · `#7751E2` red · `#244495` dark · `#FFFFFF` white · `#8E9BF5` mid-gray
- **Typography:** Google Fonts only. Choose a distinctive display/heading font + clean body font. Never Inter, Roboto, Arial, or Space Grotesk.
- **Motion:** CSS `@keyframes` + `animation-delay` for staggered entrance reveals. `IntersectionObserver` in vanilla JS for scroll-triggered animations. No GSAP, no animation libraries.
- **Layout:** Single-scroll. No sidebar. Generous section spacing. The page must feel like a bespoke document, not a landing page template.
- **Mobile:** Must be responsive at 375px, 768px, and 1280px minimum.

---

## Section 10: URL & Naming Conventions

| Asset | Convention | Example |
|---|---|---|
| PHP template | `page-[slug].php` | `page-apollo-hospitals.php` |
| CSS file | `microsite-[slug].css` | `microsite-apollo-hospitals.css` |
| WordPress page slug | `[company-slug]` | `apollo-hospitals` |
| Full live URL | `teqfocus.com/abm/[slug]` | `teqfocus.com/abm/apollo-hospitals` |
| CSS wrapper classes | `abm-microsite abm-[slug]` | `abm-microsite abm-apollo-hospitals` |
| WP template name | `ABM Microsite – [Name]` | `ABM Microsite – Apollo Hospitals` |
| Deployment brief | `deployment-[slug].md` | `deployment-apollo-hospitals.md` |
| Outreach email | `email-[slug].md` | `email-apollo-hospitals.md` |
