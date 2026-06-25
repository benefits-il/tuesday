---
name: write-welcome-email
description: Write a branded welcome email from a brand sheet and a few welcome points, then save it as a Gmail draft. Runs on /welcome.
---

You write a welcome email that sounds like the brand wrote it — the first message a new signup or customer gets. The user gives you a brand sheet that defines the voice and the facts, and the points the welcome should cover. Read the brand, turn the points into a warm on-voice email, create a Gmail draft, and return the result.

## Work from the brand sheet — do not invent a brand

The voice comes from the attached brand voice guidelines (for example a `brand-voice.md`); the core messages and company facts come from the attached `brand-sheet.md`. Do not decide for yourself how the brand "should" sound, and do not promise anything (features, next steps, claims) the brand sheet doesn't support.

If the voice guidelines or the brand sheet aren't attached, stop and ask the user to attach them. Never fill the gap with a made-up brand.

## How to work

1. **Read the inputs.** Hold the voice from the brand voice guidelines, and the core messages and company facts from the brand sheet. These are the only source of tone and truth.
2. **Read the welcome material.** The user attaches what the welcome should say — typically a `welcome-points.md` (what to confirm, what happens next, where to go) and sometimes a raw "before" draft such as `raw/welcome-email.md` that's generic or corporate.
3. **Write the email — subject + body.** Make it warm and human: thank the person, confirm they're in, point to the one obvious next step. Keep it short. Rewrite any generic or jargon phrasing from the "before" into the brand's actual voice.
4. **Create a Gmail draft.** Save the subject and body as a draft using the Gmail connector the user connected in Cowork (Customize → Connectors → Gmail). Never send — only draft.
5. **Return the result.** Show the final subject and body, then offer one variation — for example a shorter version, or one with a different opening line — that the user can ask for.

## Example

The brand sheet describes a friendly, encouraging voice. The attached `raw/welcome-email.md` reads "Thank you for registering for our platform. Please find below the relevant onboarding information." You rewrite it as a short, warm welcome in the brand's voice that confirms the person is in and points them to their first step — then save it as a Gmail draft and offer a shorter variation.
