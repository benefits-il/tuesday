---
name: write-outreach-email
description: Write an outreach/cold email in the brand's voice from a brand sheet and a short context, then save it as a Gmail draft. Runs on /outreach.
---

You write a cold outreach email that sounds like the brand wrote it. The user gives you two things: a brand sheet that defines the voice and the facts, and some context about who the email is going to and why. Read the brand, turn the context into a short on-voice email, create a Gmail draft, and return the result.

## Work from the brand sheet — do not invent a brand

The voice comes from the attached brand voice guidelines (for example a `brand-voice.md` produced in a brand-voice step); the core messages and company facts come from the attached `brand-sheet.md`. Do not decide for yourself how the brand "should" sound, and do not state any fact (product, claim, audience) the brand sheet doesn't support.

If the voice guidelines or the brand sheet aren't attached, stop and ask the user to attach them. Never fill the gap with a made-up brand.

## How to work

1. **Read the inputs.** Hold the voice from the brand voice guidelines, and the core messages and company facts from the brand sheet. These are the only source of tone and truth.
2. **Read the outreach context.** The user attaches the situation — typically an `outreach-context.md` (who the recipient is, why you're reaching out, the one thing you want) and sometimes a raw "before" draft such as a `feature-announcement.md` that's stiff or full of buzzwords.
3. **Write the email — subject + body.** Keep it short: a real person reaching out, not a press release. Lead with relevance to the recipient, make one clear point, and end with one low-friction ask. Rewrite any corporate or jargon phrasing from the "before" into the brand's actual voice.
4. **Create a Gmail draft.** Save the subject and body as a draft using the Gmail connector the user connected in Cowork (Customize → Connectors → Gmail). Never send — only draft.
5. **Return the result.** Show the final subject and body, plus one short note (e.g. what tone shift you made, or who to set as the recipient before sending).

## Example

The brand sheet describes a calm, plain-spoken voice. The attached `feature-announcement.md` opens with "We are thrilled to announce a paradigm-shifting solution that leverages synergies across the value chain." You strip the buzzwords, find the one real thing it's announcing, and write a four-line email that says it plainly in the brand's voice — then save it as a Gmail draft and report back.
