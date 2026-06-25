# Tuesday Studio

One plugin. Five jobs. One look.

`tuesday-studio` is a Claude plugin that turns a brand's raw drafts and rough briefs into finished, on-brand work. You give it a brand pack (a brand sheet plus the messy "before" materials), and it produces the polished "after" — emails, social posts, a carousel, a character video.

It carries no brand of its own. Point it at a different brand pack and it works for that brand instead.

## The four parts (this is the whole point)

A plugin is the box. It wraps the other three.

- **Skills** — five of them, one per job. The method.
- **Sub-agents** — two of them. The personas that do the work: `content-writer` and `visual-producer`.
- **Commands** — five slash commands. The buttons you press.
- **Connector** — the door to an outside service. This plugin bundles one (Higgsfield, for images and video) and uses one you already have (Gmail).

## The five jobs

| Command | Job | Agent | Connector |
|---|---|---|---|
| `/outreach` | An outreach email, drafted in your voice | content-writer | Gmail (draft) |
| `/welcome` | A branded welcome email | content-writer | Gmail (draft) |
| `/post` | An Instagram post or reel — image plus caption | visual-producer + content-writer | Higgsfield (image) |
| `/carousel` | A multi-slide branded carousel | visual-producer | Higgsfield (image) |
| `/reel` | A short AI-character video | visual-producer | Higgsfield (video) |

## Install

In Cowork: **Customize → Personal plugins**.

- From this marketplace: `/plugin marketplace add benefits-il/tuesday` then `/plugin install tuesday-studio@tuesday`.
- Or add the packaged plugin folder directly (the `.zip` from the download page).

## The two connectors

This plugin has two connectors, wired two different ways — that difference is itself worth seeing.

- **Higgsfield (images and video)** — the plugin points to it in `.mcp.json` (`https://mcp.higgsfield.ai/mcp`). Add it once as a connector: **Settings → Connectors** (claude.ai) or **Customize → Connectors** (Cowork) → **Add custom connector** → name it `Higgsfield` → paste `https://mcp.higgsfield.ai/mcp` → **Connect** → sign in with a free Higgsfield account (no card, no API key; your account credits apply). The free tier gives a basic model with a watermark, ten generations a day. The lever for good output on the free tier is a fully precise prompt — exactly what `visual-producer` builds for you from the brand sheet. Clean, watermark-free, HD output is an optional Higgsfield subscription (~$15/month).
- **Gmail (email drafts)** — not in the plugin. Gmail is a first-party connector you turn on once in **Customize → Connectors → Gmail** (a normal sign-in). The email commands always create a *draft* — they never send.

## How the brand gets in

The plugin reads what you attach, never a brand baked into the code:

- `brand-voice.md` — the voice guidelines, created with the brand-voice plugin. This is where the writing voice comes from.
- `brand-sheet.md` — colors, mark, and company facts.
- the raw "before" materials and per-job briefs — what each command turns into a finished piece.

Download the Tuesday brand pack, attach the relevant files (plus the `brand-voice.md` you made), and run the command. Swap in another brand's pack and the same plugin works for them.
