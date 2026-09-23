---
name: teqfocus-infographic
description: Produce branded Teqfocus infographics for LinkedIn posts, articles, and newsletters — choosing automatically between an HTML/CSS-built graphic (data, frameworks, comparisons) and an AI image-generation prompt (concepts, metaphors, whiteboard style). Use this skill whenever the user asks for an infographic, visual for a post, "make this visual", diagram of a framework, comparison graphic, stat visual, or whiteboard-style explainer. Always applies teqfocus-design brand rules — never produce an off-brand graphic.
---

# Teqfocus Infographic

One decision, two production paths. Data and structure get built in HTML/CSS (pixel-exact, brand-exact). Concepts and metaphors get an image-generation prompt (the whiteboard style that outperforms polished graphics on LinkedIn).

**Prerequisites:** Read `/mnt/skills/user/teqfocus-gtm/SKILL.md` and `/mnt/skills/user/teqfocus-design/SKILL.md` first. Brand tokens come from teqfocus-design — never approximate the purple.

## Path selection

| Content type | Path |
|---|---|
| Stats, comparisons, frameworks, architectures, timelines, checklists | **HTML/CSS build** — render to PNG |
| Concepts, metaphors, "how it feels", journey narratives | **AI image prompt** — whiteboard/hand-drawn style |
| Both present | Split: structure in HTML/CSS, concept as a companion whiteboard |

State the path and why in one line, then produce.

## Path A — HTML/CSS build

1. Single self-contained HTML file, 1200×1200 (feed) or 1200×1500 (portrait, higher feed real estate)
2. Teqfocus brand: primary purple, white space discipline, brand font per teqfocus-design, logo bottom corner, teqfocus.com in footer
3. Hierarchy: one headline (the takeaway, not a label) → the visual → one source/verification line. Every number carries a source or `[VERIFY]`.
4. Mobile test: legible at 400px wide. If a label fails the squint test, cut content — never shrink type below 24px equivalent.
5. Render to PNG via headless browser or screenshot tooling; deliver both HTML and PNG.

## Path B — AI image prompt (whiteboard style)

Produce a ready-to-paste prompt specifying: hand-drawn whiteboard aesthetic, black marker on white, single accent color (Teqfocus purple), the exact text to render (spelled out verbatim — image models mangle improvised text), layout description (left-to-right flow / center hub / 2×2), no photorealism, no clip-art. Include a negative-prompt line: no stock-photo style, no gradients, no watermarks.

Deliver the prompt plus a note: generated output must be reviewed for text accuracy before posting — regenerate rather than post a typo.

## Rules

- The graphic carries ONE idea. Two ideas = two graphics.
- Post copy and graphic are designed together — the graphic hooks, the copy deepens. Route post copy to linkedin-campaigns.
- No copyrighted characters, no competitor logos, no real client names without approval.
- Run teqfocus-taste on the final visual before delivering.
