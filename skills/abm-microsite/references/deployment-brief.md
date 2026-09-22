# Reference: Developer Deployment Brief (`deployment-[slug].md`)

This reference defines the exact format and content Claude must generate
for the developer deployment brief that accompanies every microsite build.

---

## Template to Generate

```markdown
# Deployment Brief: [Company Name] ABM Microsite
**URL target:** `teqfocus.com/abm/[slug]`
**Date generated:** [DATE]
**Account tier:** [Tier 1 / 2 / 3]

---

## Files in This Delivery

| File | Action Required |
|---|---|
| `page-[slug].php` | Add to active theme root directory |
| `microsite-[slug].css` | Add to theme `/css/` directory (create if it doesn't exist) |

---

## Step 1 — Add the Template File

Copy `page-[slug].php` into the active theme root:

```
/wp-content/themes/[active-theme]/page-[slug].php
```

---

## Step 2 — Add the Stylesheet

Copy `microsite-[slug].css` into the theme's CSS directory:

```
/wp-content/themes/[active-theme]/css/microsite-[slug].css
```

---

## Step 3 — Enqueue the Stylesheet in `functions.php`

Add this block to the active theme's `functions.php`.
It loads the stylesheet **only** on this microsite page — zero impact on any other page.

```php
/**
 * Enqueue ABM microsite stylesheet: [Company Name]
 */
function teqfocus_enqueue_abm_[safe_slug]() {
    if ( is_page( '[slug]' ) ) {
        wp_enqueue_style(
            'abm-[slug]',
            get_template_directory_uri() . '/css/microsite-[slug].css',
            array(),
            '1.0.0'
        );
    }
}
add_action( 'wp_enqueue_scripts', 'teqfocus_enqueue_abm_[safe_slug]' );
```

> Note: `[safe_slug]` = slug with hyphens replaced by underscores for PHP function name validity.
> Example: `apollo-hospitals` → `teqfocus_enqueue_abm_apollo_hospitals()`

---

## Step 4 — Create the WordPress Page

In **WP Admin → Pages → Add New**:

| Field | Value |
|---|---|
| **Title** | `[Company Name] \| Teqfocus` |
| **Slug** | `[slug]` |
| **Page Template** | Select **"ABM Microsite – [Company Name]"** from the template dropdown |
| **Parent Page** | Set to `abm` (see Step 5) |
| **Status** | Set to **Private** for internal review first |

---

## Step 5 — Set Up the `/abm/` URL Namespace (One-Time Setup)

This step only needs to be done once. If the parent `abm` page already exists, skip it.

1. In **WP Admin → Pages → Add New**
2. Title: `ABM` · Slug: `abm` · Template: Default · Status: **Published**
3. This page can be blank — it exists only to create the `/abm/` URL prefix
4. Set all microsite pages' **Parent** to this `abm` page
5. WordPress generates `teqfocus.com/abm/[slug]` automatically

---

## Step 6 — Verify After Publishing

Run through this checklist after publishing:

- [ ] Page loads at `teqfocus.com/abm/[slug]`
- [ ] Browser tab title reads: `[Company Name] | Teqfocus`
- [ ] Active theme header renders correctly above the `.abm-microsite` div
- [ ] Active theme footer renders correctly below the `.abm-microsite` div
- [ ] CSS is **not** loading on any other page (open homepage, check DevTools → Sources)
- [ ] CTA buttons link to: `[CTA_URL]`
- [ ] Page is mobile-responsive at 375px (check via DevTools device emulation)
- [ ] Scroll animations trigger correctly on `.abm-reveal` elements

---

## Step 7 — Remove Password / Set Live

When internal review is complete and outreach is ready to send:

1. **WP Admin → Pages → [Microsite Page] → Edit**
2. Set **Visibility** from Private to **Public**
3. Send the companion outreach email (`email-[slug].md`) to the primary contact

---

## Removing a Microsite (When No Longer Active)

To cleanly remove a microsite without affecting anything else:

1. Set the WordPress page status to **Draft** or **Trash** it
2. Remove the `functions.php` enqueue block for this slug
3. Optionally archive (do not delete) the `.php` and `.css` files in the theme

The rest of the site is completely unaffected.

---

## Notes for This Specific Page

[Claude: add any account-specific notes here — e.g. image dependencies flagged
with [IMAGE: description], booking link placeholder status, any [VERIFY] flags
on metrics that need confirmation before going live]
```

---

## Rules for Claude When Generating This Brief

- Replace `[safe_slug]` with the slug using underscores (e.g. `apollo_hospitals`)
- List every `[IMAGE: description]` flag from the template file in the Notes section
- List every `[VERIFY]` flag from the template file in the Notes section
- List every `[BOOKING_LINK_PLACEHOLDER]` in the Notes section with a reminder to update
- The functions.php snippet must use the correct safe slug in the function name
- Confirm the one-time `/abm/` parent page step is marked clearly as one-time-only
