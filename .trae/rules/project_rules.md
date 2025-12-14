When I ask you to "write blog for reddit posts", I will specify the following information:

- The subreddit name, e.g. "r/streaming"
- One or more specific keywords or pain points (optional but recommended)
- The number of blogs I want to write

Your task is to ALWAYS generate and publish blog posts to our official website
AND generate and post corresponding tweets from our official Twitter account.

The task is NOT considered complete unless:
- At least one new blog post (.mdx) is written to data/blog/
- The blog is built and deployed via git push
- A tweet is posted
- The first comment of the tweet contains the blog link

Follow ALL steps below IN ORDER. Do NOT skip any step.

--------------------------------------------------
1. Read tracking file
--------------------------------------------------

1. Read the `reddit-blog-tracking.json` file ONCE.
2. Store all existing Reddit post IDs in memory to avoid duplication.

--------------------------------------------------
2. Find Reddit source posts
--------------------------------------------------

1. Search the specified subreddit using the provided keyword(s) or pain point(s).
2. Select the top N Reddit posts that:
   - Are NOT already tracked in `reddit-blog-tracking.json`
   - Have meaningful discussion (comments > engagement threshold)
   - Represent real, practical pain points for TikTok game streamers or live creators

If no suitable posts are found:
- Select the closest relevant post
- Or synthesize a blog based on recurring pain points commonly discussed in that subreddit
- STILL proceed with blog generation (do NOT stop)

--------------------------------------------------
3. Write and SAVE the blog post (MANDATORY)
--------------------------------------------------

For EACH selected Reddit post:

1. Read the Reddit post content AND comments:
   - Fetch the TOP 50 comments by score
   - AND the MOST RECENT 50 comments if available
   (Do NOT exceed this limit)

2. Write a full blog post and SAVE it as a `.mdx` file:
   - Location: `data/blog/`
   - File MUST be written, not described
   - Format MUST match existing blog posts in that directory

3. Blog structure MUST be:

   - Title (problem + outcome focused, not clickbait)
   - TL;DR (1–2 sentences)
   - Introduction (context + pain point, referencing Reddit discussion)
   - Actionable Steps (3–5 concrete, practical steps)
   - FAQ / Notes (common objections or variations from comments)
   - Conclusion (solution-oriented, confidence-building)

4. The blog MUST:
   - Be written in English
   - Be practical and experience-driven
   - Avoid generic or theoretical advice

--------------------------------------------------
4. Humanize and vary the blog content (CONTENT ONLY)
--------------------------------------------------

After the first draft is written, refine the CONTENT ONLY (do NOT affect file paths or execution):

- Rewrite language to sound human and natural
- Use first-person and second-person voice where appropriate
- Avoid repeated phrasing across posts
- Vary:
  - Sentence length
  - Section framing
  - Opening style (question, scenario, mistake, insight)

Perform up to 2 internal rewrite passes for tone and clarity.
Do NOT add new steps or change the structure.

--------------------------------------------------
5. SEO + visuals (MANDATORY, but execution-safe)
--------------------------------------------------

1. SEO:
   - Select 3–5 focused tags only
   - Write a meta description (120–155 chars)

2. Banner image:
   - Create a banner image (1280x720)
   - Save it under:
     `public/static/images/{blog-slug}/`

3. Diagrams or charts:
   - Use Mermaid for process diagrams
   - Use Matplotlib ONLY for data-based charts
   - Render diagrams to PNG
   - Keep diagrams vertically compact (not too wide)

4. Under each diagram:
   - Add a clear, structured explanation in plain language

--------------------------------------------------
6. Compress assets (MANDATORY)
--------------------------------------------------

Compress:
- Banner image
- All diagram/chart images

Using TinyPNG (or equivalent).

--------------------------------------------------
7. Update dates and tracking (MANDATORY)
--------------------------------------------------

1. Fetch system date using:
   `date +%Y-%m-%d`

2. Update:
   - Blog frontmatter date
   - `published_at` in `reddit-blog-tracking.json`

3. Update tracking file with:
   - post_id
   - title
   - slug
   - published_at
   - status = successful

--------------------------------------------------
8. Build and deploy blog (MANDATORY)
--------------------------------------------------

1. Run:
   `npm run build`

2. If build errors occur:
   - Fix them
   - Re-run build until successful

3. Git commit and git push ALL changes.
Deployment MUST happen.

--------------------------------------------------
9. Generate and POST Twitter content (DEPENDENT ON BLOG)
--------------------------------------------------

1. Generate ONE tweet (<280 characters):
   - First line MUST be a strong hook
   - Short lines, high readability
   - First-person, creator-style tone
   - Actionable insight
   - NO blog link in the tweet body

2. Attach the compressed banner image.

3. Include 3–5 hashtags, always including:
   - #streaming
   - #TikTokLIVE
   Plus relevant tags like:
   - #OBS
   - #livestreaming
   - #streamtips
   - #TikTokGaming

--------------------------------------------------
10. Post FIRST COMMENT with blog link (MANDATORY)
--------------------------------------------------

Immediately after posting the tweet:

1. Post the FIRST COMMENT containing:
   - Blog link:
     https://ttwise.live/blog/{slug}?utm_source=twitter&utm_campaign={slug}
   - One short sentence explaining what readers will learn

--------------------------------------------------
Completion rule
--------------------------------------------------

The task is ONLY complete when:
- Blog file exists in data/blog/
- Blog is built and deployed
- Tweet is posted
- First comment contains the blog link

Do NOT mark the task as completed unless ALL conditions above are met.
