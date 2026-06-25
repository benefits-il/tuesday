---
name: make-social-post
description: Create an on-brand Instagram post or reel image from a brand sheet and a topic. Use whenever someone asks for a social post image or runs /post. Reads the brand the user provides, builds a precise image prompt, and calls the image connector to produce a real image.
---

# Make a social post

You make a single on-brand social image — an Instagram post or reel cover — that matches a brand and speaks to a topic. The user gives you a **brand sheet** (the brand's colors, type, mark, and mood) and a **topic** (what the post is about). Read the brand, turn the topic into a precise image-generation prompt that carries that brand, call the image connector, and return the result.

## Work from the brand sheet — do not invent a brand

- Find the brand sheet the user points you to — for example a `brand-sheet.md` they downloaded. Read its colors, type, logo or mark, and mood.
- If no brand sheet is provided, ask for one. Do not fall back to a generic look or guess a brand.
- Apply the brand faithfully: its exact colors, its type feel, its mark, its mood. The image should look like it came from that brand's own team, not like a generic AI picture.

## How to work

1. Read the brand sheet. Read the topic from the seed the user points you to (for example a `social-seed.md`) and any visual reference they attach (for example a `visual-brief.md`). If the topic is vague, make one confident interpretation rather than interrogating the user.
2. Decide the format from the brief: a square Instagram post or a vertical reel cover. Choose sensible dimensions for that format.
3. Build a **fully-precise image prompt** that bakes in the brand from the sheet — name the exact background, the exact accent color or colors, the type feel, the mark and where it sits, the layout, the mood, and any on-image text in quotes so the model renders it. Spell every choice out; do not leave the look to the model.
4. Call the image connector — the image/video connector bundled in this plugin's `.mcp.json` (Higgsfield) — with that prompt.
5. Return the image plus one short line on what you made, and offer one variation.

## Why the prompt has to be precise

The bundled image connector runs on a free tier by default — a basic model with a watermark and mediocre output unless you steer it hard. A complete, exact prompt is the only lever for good output on the free tier: every visual choice named, nothing left to chance. The user can optionally upgrade to a paid Higgsfield subscription (around fifteen dollars a month) for clean, high-definition output.

## The caption

This skill produces the image only. The caption text that goes with the post is written by the **content-writer** agent in the brand's voice — using the brand voice guidelines (for example a `brand-voice.md`) — and `make-social-post` pairs with a caption from that agent. If the user needs the words too, point them there.

## Example

If the brand sheet says the brand is near-black with one bright yellow accent, a heavy geometric type, and an upward-arrow mark, and the topic is "we just shipped a faster checkout," you send the connector a prompt like: *a square Instagram post, near-black background, one bright yellow accent, heavy geometric uppercase headline reading "CHECKOUT, NOW TWICE AS FAST", a clean upward-arrow mark in the lower-right corner, bold high-contrast centered layout, confident mood, no gradients, no stock photography.*
