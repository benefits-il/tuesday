# Tuesday — Design System

A small, deliberate brand kit for the Tuesday plugin world (course unit 3.2, station 2). It dresses the download page and the four Tuesday plugins in one coherent company look, so the learner downloads something that feels like a real brand kit — not a course handout.

## The look

Sharp black ground. One bright yellow. Heavy geometric type. Hard edges, offset shadows, no rounding. The idiom comes from the **GIVE U MORE** wordmark Ben supplied: a bold yellow letterform with circle badges carrying blocky/pixel letters. We adopt the language, not the words.

Tuesday is named after **Tyr** — the Norse god of war and justice, whose day is Tuesday (Tiw's day). The mark is the **Tiwaz rune** (an upward arrow). Positioning: the anti-Monday. Monday is for the company; Tuesday is for the one-person company.

## Files

| File | What it is |
|---|---|
| `tokens.css` | Color, type, space, and geometry custom properties. Import first. |
| `patterns.css` | Component classes built on the tokens: `.tue-kicker`, `.tue-badge`, `.tue-btn`, `.tue-card`, `.tue-mark`. |
| `mark.svg` | The Tiwaz mark (yellow, on transparent). |
| `showcase.html` | One page that demonstrates the whole kit. Open it to see the look. |

## Fonts (free, pinned via Google Fonts)

- **Archivo Black** — display, headlines, wordmark, buttons.
- **Silkscreen** — kickers and badge letters (the pixel motif).
- **Space Grotesk** — body.

## How to use

Link the two stylesheets and the fonts, then use the component classes:

```html
<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=Silkscreen:wght@400;700&family=Space+Grotesk:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="_ds/tokens.css">
<link rel="stylesheet" href="_ds/patterns.css">
```

## Voice

Warm, direct, dry, self-aware. Short punches. Talks to the solo operator as a peer who knows the grind. No corporate gloss, no empty superlatives, no exclamation marks, no emojis.
