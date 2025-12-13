When I ask you to "write blog for reddit posts", I will specify the following information:

The subreddit name, e.g. "r/streaming"

ONE specific keyword or pain point (this represents the primary pain point for this run)

The number of blogs I want to write (default is 1)

Note: I may maintain a larger keyword/pain-point list externally, but each execution of this workflow MUST focus on exactly ONE clearly defined primary pain point to ensure stable, deterministic output.

You should generate blog posts focusing on solving a concrete, real pain point that content creators (especially game streamers or TikTok Live broadcasters) are actively discussing.
The goal is to provide practical, experience-based solutions, written in a human, creator-to-creator tone, and to reliably produce one publishable blog post and one Twitter post per run.

Follow these steps:
1. Read existing tracking data

Read the reddit-blog-tracking.json file once at the beginning.

Store all previously processed Reddit post IDs in memory.

Use this list strictly to avoid duplicate processing.

2. Select a Reddit post (stability-first)

Search the specified subreddit using the single primary keyword / pain point.

Fetch posts that meet all of the following conditions:

The post ID is not already tracked

The post is recent and actionable (not outdated or purely theoretical)

The post has meaningful discussion, indicated by:

A reasonable number of comments, and

Clear engagement (score or visible discussion depth)

If no post meets the criteria:

Continue fetching more results

Retry until at least one valid post is found

Do not exit or skip output due to low confidence — always select the best available candidate.

3. For each selected Reddit post, write exactly ONE blog post
3.1 Read Reddit content

Retrieve:

The full Reddit post content

The top 50 comments by score

Optionally, the 50 most recent comments if they add context

Do not exceed this scope to avoid dilution.

3.2 Write the blog post (solution-first, not commentary)

Use the same overall format and frontmatter style as existing posts in data/blog.

The blog must be written as a problem → solution guide, not a Reddit summary.

Mandatory structure:

Title
Clear, specific, solution-oriented. Avoid vague wording.

TL;DR
1–2 sentences explaining:

What the problem is

What actually fixes it

Introduction

Frame the pain point in real streamer context

Reference common sentiments or short paraphrased quotes from Reddit

Make the reader feel: “Yes, this is exactly my issue”

Actionable Steps

3–5 concrete steps

Each step must be:

Direct

Practical

Immediately testable

Prefer configuration changes, workflow adjustments, or decision rules

FAQ / Notes

Address recurring follow-up questions from comments

Include edge cases or “this won’t work if…” notes

Conclusion

Solution-focused

Calm, confidence-building

No sales pitch

3.3 Update tracking file

After the blog is written, update reddit-blog-tracking.json with:

post_id

title

slug

published_at (current date)

cta_onepager (leave empty if not available)

status (e.g. published)

This step is mandatory to ensure long-term stability.

4. SEO + humanization (multi-pass, mandatory)
4.1 SEO basics

Select 3–5 focused tags only
(e.g. TikTok Live, OBS, dropped frames, streaming performance)

Write a meta description (120–155 characters):

Includes the primary pain point

Written for humans, not keyword stuffing

4.2 Multi-pass humanization (do NOT skip)

After drafting the blog, perform three explicit revision passes:

Pass 1 — Structural clarity

Remove repetition

Tighten steps

Ensure logical flow

Pass 2 — Human voice

Add first-person language where appropriate

Replace generic phrasing with lived-experience wording

Allow mild, natural streamer slang if it fits

Pass 3 — De-AI polish

Remove robotic transitions

Shorten long sentences

Introduce occasional rhetorical questions

Ensure it reads like a real creator explaining something to another creator

The final output must not sound like a generic AI blog.

5. Visual assets
5.1 Banner image

Generate a 1280 × 720 banner

Include:

One clear takeaway or problem statement

Minimal text

Style: clean, practical, creator-focused

5.2 Diagrams / charts (only if they add clarity)

Use:

Mermaid for flows or logic

Matplotlib for data or comparisons

Keep diagrams vertical-friendly

Avoid decorative or redundant visuals

5.3 Explain visuals

Below each diagram:

Write a plain-language explanation

Assume the reader may skip the visual

6. Compress images

Compress all images (banner + diagrams) using TinyPNG or equivalent

Preserve readability and clarity

7. Dates

Use date +%Y-%m-%d to get the current date

Update:

Blog frontmatter date

published_at in tracking file

Dates must match exactly

8. Generate and post ONE Twitter (X) post
8.1 Tweet writing rules (strict)

Under 280 characters

Written as original, native Twitter content

Must NOT read like a blog excerpt

Requirements:

First line = strong hook

Short lines, visible spacing

First-person, opinionated tone

One clear practical insight

No blog-style summaries

Hashtags (3–5 max):

#streaming

#TikTokLIVE

Plus relevant context tags such as:

#OBS

#livestreaming

#streamtips

Attach the compressed banner image

DO NOT include the blog link in the tweet body

8.2 First comment (mandatory)

Immediately post a reply to the tweet containing:

The full blog URL:
https://ttwise.live/blog/{slug}?utm_source=twitter&utm_campaign={slug}

One short sentence explaining what the reader will learn

This step is required to ensure traffic attribution and consistency.

9. Build & deploy

Save:

Blog .mdx → data/blog/

Images → public/static/images/{slug}/

Run npm run build

Fix build errors if any

Push changes to the remote repository

10. Global constraints (do not violate)

Always produce at least one blog and one tweet

Never skip output due to uncertainty

Focus on one pain point per run

Favor stability and clarity over creativity

Additional information

All content must be written in English

Blog domain: https://ttwise.live

Blog URL format: https://ttwise.live/blog/{slug}