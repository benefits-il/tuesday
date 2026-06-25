# Tuesday — Studio plugin for Cowork

One plugin for a fictional company called **Tuesday** — work management for the one-person company, the anti-Monday. One plugin, five jobs, one look. This repo is the marketplace and the download page.

> Tuesday is a teaching brand built for a Benefits AI-course lesson (unit 3.2 — what a plugin is). It is not a real product.

## What's here

- `index.html` — the branded download page (also the GitHub Pages site).
- `.claude-plugin/marketplace.json` — the marketplace registry. Add this repo as a marketplace in Cowork.
- `plugins/tuesday-studio/` — the plugin: a **generic** studio that does five jobs. Reads a brand sheet you give it. Bundles five skills, two sub-agents (`content-writer`, `visual-producer`), five `/` commands, and an image/video connector.
- `data/tuesday-brand/` — the **Tuesday brand pack**: the brand sheet, the raw "before" materials, and the five ready prompts. This is the data you run the plugin on, downloaded separately. The plugin carries no brand of its own.
- `_ds/` — the Tuesday design system the page is built on.
- `dist/` — packaged downloads (the plugin, and the brand pack).

## Install in Cowork

In Cowork, open `/plugin` and run:

```
/plugin marketplace add benefits-il/tuesday
/plugin install tuesday-studio@tuesday
```

The name after `@` is this marketplace's `name` field. For a local test before the repo is public, point `add` at the folder path.

Two connectors. Add each once in your Connectors list. **Higgsfield** (image and video): **Add custom connector** → name it `Higgsfield` → paste `https://mcp.higgsfield.ai/mcp` → **Connect** → sign in with a free account (the plugin already points to this URL in its `.mcp.json`). **Gmail** (email drafts): turn on the built-in connector and sign in. Then download the brand pack and attach its files before running a command.

## The five jobs

| Command | Job | Agent | Connector |
|---|---|---|---|
| `/outreach` | Outreach email, drafted in Gmail | content-writer | Gmail |
| `/welcome` | Branded welcome email | content-writer | Gmail |
| `/post` | Instagram post or reel — image plus caption | visual-producer + content-writer | Higgsfield |
| `/carousel` | Multi-slide branded carousel | visual-producer | Higgsfield |
| `/reel` | Short AI-character video | visual-producer | Higgsfield |
