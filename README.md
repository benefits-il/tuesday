# Tuesday — demo brand pack for the plugin unit

A fictional company called **Tuesday** — work management for the one-person company, the anti-Monday. This repo is the demo brand pack and download page for unit 3.2 of the Benefits AI course (what a plugin is). It is the data, not the plugin.

> Tuesday is a teaching brand built for a Benefits lesson. It is not a real product.

The unit is a two-station chain:

- **Station 1 — build the voice.** Install `brand-voice` (from the built-in `anthropics/knowledge-work-plugins` library), feed it Tuesday's scattered raw materials, and it distills `brand-voice.md`.
- **Station 2 — use the voice.** Install the generic `brand-studio` plugin (in its own repo, `benefits-il/brand-studio`), attach `brand-voice.md` plus the brand pack, and produce real content (emails via Gmail drafts, images and video via Higgsfield).

The generic plugin engine used to live here; it moved to **`benefits-il/brand-studio`** so it carries no brand of its own.

## What's here

- `index.html` — the branded demo page (also the GitHub Pages site): the two-station story, the install pointer to `brand-studio`, two downloads, and the five ready prompts as copy blocks.
- `data/tuesday-brand/` — the **English** brand pack; `data/tuesday-brand-he/` — the **Hebrew** brand pack. Each holds:
  - `raw/` — the messy "before" materials (station 1 input).
  - `brand-sheet.md`, `visual-brief.md`, and the five briefs (station 2 input).
  - `prompts/` — the engineered prompts, the source of truth for the copy blocks on the page. Not shipped in any zip.
  - `backup/brand-voice.md` — a ready voice file, a fallback only for learners stuck in station 1.
- `_ds/` — the Tuesday design system the page is built on.
- `dist/` — the four packaged downloads (two stations × two languages).

## The downloads (Hebrew kit + English kit)

The page is fully bilingual: the language toggle switches the prompts and the download links together, so a learner gets a complete Hebrew kit or a complete English kit.

| Pack | File | Contains |
|---|---|---|
| Station 1 · EN | `dist/tuesday-station1-raw-en.zip` | `raw/` only — the scattered "before" materials |
| Station 1 · HE | `dist/tuesday-station1-raw-he.zip` | same, in Hebrew |
| Station 2 · EN | `dist/tuesday-station2-brand-pack-en.zip` | brand sheet, visual brief, five briefs, and `backup/brand-voice.md` |
| Station 2 · HE | `dist/tuesday-station2-brand-pack-he.zip` | same, in Hebrew |

The prompts are NOT in any zip — they live as copy blocks on `index.html`, in both languages.

## Rebuild the downloads

```
pwsh ./scripts/package.ps1
```

Builds both zips with forward-slash paths, each wrapped in one root folder.
