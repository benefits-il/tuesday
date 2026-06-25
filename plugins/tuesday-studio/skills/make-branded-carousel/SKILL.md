---
name: make-branded-carousel
description: Create a multi-slide branded Instagram carousel — several images that share one exact look — from a brand sheet and a per-slide outline. Use whenever someone asks for a carousel or runs /carousel. Reads the brand the user provides and calls the image connector once per slide.
---

# Make a branded carousel

You make a multi-slide Instagram carousel: several images that read as one set because they share the exact same look. The user gives you a **brand sheet** (the brand's colors, type, mark, and mood), a **carousel outline** (the content of each slide), and optionally the brand's **design tokens** (its `_ds` colors and type, if provided). Read the brand, design one visual system, then build a precise prompt per slide so every slide matches, call the image connector once per slide, and return the set.

## Work from the brand sheet — do not invent a brand

- Find the brand sheet the user points you to — for example a `brand-sheet.md` they downloaded. Read its colors, type, logo or mark, and mood.
- Read the carousel outline the user points you to (for example a `carousel-outline.md`) for the per-slide content — what each slide says and shows.
- If the brand provides a design tokens reference (its `_ds` colors and type), read it and use those exact values.
- If no brand sheet is provided, ask for one. Do not fall back to a generic look or guess a brand.

## How to work

1. Read the brand sheet, the carousel outline, and the design tokens reference if provided.
2. Decide ONE precise visual system for the whole set before generating anything: the exact background, the exact accent color or colors, the type feel, the mark and where it sits, and a fixed slide layout. Write this system down so it is identical for every slide.
3. For each slide, build a **fully-precise image prompt** that reuses that exact same system and adds only the slide's own content and on-image text in quotes. The background, accent, type, mark placement, and layout stay constant across all slides; only the words and any per-slide focal element change. Spell every choice out.
4. Call the image connector — the image/video connector bundled in this plugin's `.mcp.json` (Higgsfield) — once per slide, in order.
5. Return the full set in slide order plus one short line, and offer one variation (for example a different layout applied consistently across all slides).

## Consistency is the whole point

A carousel only works if the slides look like siblings. Lock the visual system once and repeat it word-for-word in every slide prompt — same background, same accent, same type, same mark placement, same layout. If you let any of these drift between prompts, the slides will not match and the set falls apart. Vary the content, never the system.

## Why each prompt has to be precise

The bundled image connector runs on a free tier by default — a basic model with a watermark and mediocre output unless you steer it hard. A complete, exact prompt per slide is the only lever for good, consistent output on the free tier: every visual choice named, repeated identically across slides. The user can optionally upgrade to a paid Higgsfield subscription (around fifteen dollars a month) for clean, high-definition output.

## Example

If the brand sheet says the brand is near-black with one bright yellow accent, a heavy geometric type, and an upward-arrow mark, and the outline has three slides ("THE PROBLEM", "WHAT WE BUILT", "TRY IT"), you lock one system — *square slide, near-black background, one bright yellow accent, heavy geometric uppercase headline, upward-arrow mark in the lower-right corner, centered layout, no gradients, no stock photography* — and send the connector that exact system three times, changing only the headline text in quotes per slide.
