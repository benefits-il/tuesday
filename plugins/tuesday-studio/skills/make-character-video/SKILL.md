---
name: make-character-video
description: Create a short on-brand AI-character video or reel from a brand sheet and a character brief. Use whenever someone asks for a character video or runs /reel. Reads the brand the user provides, builds a precise video prompt, and calls the video connector to produce a real clip.
---

# Make a character video

You make a short AI-character video — a reel of a character who speaks or moves in a single brief scene. The user gives you a **brand sheet** (the brand's colors, type, mark, and mood) and a **character brief** (a description of the character, a short fifteen-second script, and the brand styling). Read the brand, turn the brief into a precise video-generation prompt, call the video connector, and return the clip.

## Work from the brand sheet — do not invent a brand

- Find the brand sheet the user points you to — for example a `brand-sheet.md` they downloaded. Read its colors, type, mark, and mood.
- Read the character brief the user points you to (for example a `character-brief.md`): who the character is and how they look, the fifteen-second script they speak, and the brand style the scene should carry.
- If no brand sheet is provided, ask for one. Do not fall back to a generic look or guess a brand.

## How to work

1. Read the brand sheet and the character brief. If anything is vague, make one confident interpretation rather than interrogating the user.
2. Build a **fully-precise video prompt** that names: the character's exact look (age, build, clothing, expression), the setting and background, the motion and camera (what the character does, how the shot moves), the on-brand styling (the brand's exact colors, mark and where it sits, mood), and the spoken or on-screen line in quotes. A clip is only fifteen seconds — every second has to be specified.
3. Call the video connector — the image/video connector bundled in this plugin's `.mcp.json` (Higgsfield; the video models are Soul 2 and Seedance) — with that prompt.
4. Return the clip plus one short line on what you made, and offer one variation.

## Why the prompt has to be precise

The bundled video connector runs on a free tier by default — a basic model with a watermark and mediocre output unless you steer it hard. A complete, exact prompt is the only lever for good output on the free tier: the character look, the setting, the motion, the styling, and the spoken line all named, nothing left to the model. The user can optionally upgrade to a paid Higgsfield subscription (around fifteen dollars a month) for clean, high-definition output.

## Example

If the brand sheet says the brand is near-black with one bright yellow accent, a heavy geometric type, and an upward-arrow mark, and the character brief describes a calm young founder in a plain dark hoodie who says "We built this so you never wait again," you send the connector a prompt like: *a fifteen-second reel, a calm young founder in a plain dark hoodie, medium close-up, soft frontal light, near-black studio background, one bright yellow accent light edge, a small upward-arrow mark in the lower-right corner, the character looks into the camera and says "We built this so you never wait again," steady slow push-in, confident mood, no gradients, no stock footage.*
