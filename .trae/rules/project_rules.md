When I ask you to "write blog for reddit posts", I will specify the following information:

- The subreddit name, e.g. "r/streaming"
- A specific keyword or pain point (optional but recommended)
- The number of blogs I want to write

You should generate blog posts focusing on **solving specific pain points** that content creators (especially game streamers or TikTok Live broadcasters) are discussing. The goal is to provide practical solutions or advice for these pain points, ensuring that the content is actionable and relevant.

Follow these steps:

1. **Read the `reddit-blog-tracking.json` file** once to get all previously written blog posts, and store the post IDs in memory for easy lookup during this process.
2. **Search for the most relevant posts** in the subreddit using the specified keyword (if provided). Fetch the top N posts based on the following criteria:
   - The post is not already tracked (check the post ID against the list from the `reddit-blog-tracking.json` file).
   - The post has a **sufficient number of comments** (to ensure that it's a meaningful discussion).
   - The post has **good engagement** (consider score or comment-to-upvote ratio).
   
   Ensure that only **fresh, actionable posts** are selected. If no posts meet the criteria, fetch more or retry until a valid post is found.

3. For each selected post, follow these steps to write the blog post:

   - **Read the Reddit post details**:  
     Retrieve the full content of the Reddit post, including the post text and the first **50 top comments** (if available). You may also fetch the **50 most recent comments** if needed for additional context.
     
   - **Write the blog based on the Reddit post**:  
     - Use the same format as other blog posts in the `data/blog` directory.  
     - Structure the blog as follows:  
       - **Title**: (clear and concise, matching the problem and solution)  
       - **TL;DR**: (1-2 sentences summary of the issue and solution)  
       - **Introduction**: (Describe the problem in context, citing relevant quotes from Reddit)  
       - **Actionable Steps**: (3-5 clear, copy-paste actions to resolve the issue, based on the comments)  
       - **FAQ / Notes**: (any frequently mentioned solutions or additional advice from Reddit)  
       - **Conclusion**: (sum up with a solution-focused message)

   - **Update the `reddit-blog-tracking.json` file**:  
     After writing the blog, update the tracking file with the following details for the new post:  
     - **post_id** (Reddit post ID)  
     - **title** (generated blog title)  
     - **slug** (blog file name)  
     - **published_at** (current date)  
     - **cta_onepager** (URL to the 1-page action checklist, if available)  
     - **status** (successful, pending review, etc.)

   This will ensure that each blog is properly recorded and indexed in the tracking file to prevent duplication.

4. **Once the blog is written, follow these steps for better SEO and content quality**:

   - **SEO Optimization**:  
     - Ensure the **tags are focused**: Select **3–5 highly relevant tags** for the blog post. Tags should focus on the specific topics related to the blog post, such as [game streaming, TikTok Live, OBS tips, streamer engagement]. Avoid overly generic tags like "gaming" or "streaming" unless they are directly related.
     - **Meta description**: Write a clear, concise meta description (120–155 characters), including the main keyword, to improve the blog's search visibility and click-through rate.
   
   - **Humanizing the blog**:  
     - Make the blog **sound more natural and engaging**. Ensure it reads like a conversation between streamers, offering **practical advice** in a **friendly, relatable tone**.
     - **Strengthen the tone** by using personal pronouns (I, we, you). **Avoid overly formal language**, and make it clear that this is **real-world advice** based on personal experience.
     - **Multiple passes for humanization**: After the initial blog draft, **review and rewrite** it to:
       1. Improve the conversational tone
       2. Avoid robotic phrasing and overly technical jargon
       3. Add **first-person sentences** where appropriate (e.g., "I tested this and it worked for me" or "This tip helped me solve a similar problem").
       4. Introduce some minor **rhetorical questions** (e.g., “Ever had your stream freeze right before a big donation?”)
       - **Pass 1**: Generate a draft with clear points, focused structure.
       - **Pass 2**: Rework to ensure **more personal, natural tone**, using a bit of slang and humor where relevant.
       - **Pass 3**: Ensure **clarity** and remove redundant sentences. Make the language **more casual** and engaging, perfect for a creator’s community.

   - **Generate Banner Image**:  
     - Create a banner with a **1280x720** ratio, featuring a **concise title or main point** from the blog.  
     - Use **Canva**, **Photoshop**, or a similar tool to create a clean, visually appealing banner that reflects the blog’s content.

   - **Create Diagrams/Charts**:
     - **Diagrams**: Use **Mermaid** for simple flow diagrams or process visuals. For **data-heavy charts**, use **Matplotlib** to create high-quality PNG charts.
     - **Diagram Guidelines**:  
       - The diagram should not be **too wide horizontally**. **Try to make it more vertical** to fit well into the blog layout.
       - If using **Matplotlib**, ensure that the chart has clear axes, labels, and a readable title.
       - If using **Mermaid**, make sure the diagram is clear and simple, using arrows, boxes, and text labels.

   - **Explanation of Diagrams**:
     - Below each diagram, provide a **clear and structured explanation** of what the diagram illustrates.
     - Ensure the explanation uses **simple, easy-to-understand language** and complements the visual.  
     - The explanation should be detailed enough to give value to users who may skip the diagram itself.

5. **Compress the banner image and diagrams or charts**:  
   - Use **TinyPNG API** (or any equivalent API) to **automatically compress** the banner image and any diagrams or charts created using Mermaid or Matplotlib.  
   - Ensure that the **compression preserves high quality** while reducing the file size for faster loading and better SEO performance.  
   - **Note**: Do not manually upload the images for compression, integrate it directly into the workflow for full automation.

6. **Update dates**:  
   - Automatically fetch the current date using the `date +%Y-%m-%d` command and update all relevant date fields:  
     - **In the blog's frontmatter**: Set the `date` field to the current date.
     - **In the `reddit-blog-tracking.json` file**: Update the `published_at` field with the same date.
   - Ensure that the dates across the entire workflow are consistent and accurate to avoid any discrepancies between files.

7. **Generate and post a tweet with less than 280 characters**:
   - **Main tweet**:
     - **Hook**: Start with a **strong, engaging hook** in the first line to grab attention (e.g., “Ever lost a big donation due to stream lag?”).
     - **Short sentences**: Use **concise, impactful sentences**. Each sentence should be **short** and **easy to digest**.  
     - **Line breaks**: Use **line breaks** to increase readability and make the tweet visually appealing.  
     - **Clear action**: The tweet should offer **clear, actionable advice**. For example, "Here’s a quick fix to stop stream freezes," followed by a brief solution.
     - **Personality**: Write in a **first-person, conversational style**. Use personal anecdotes or insights, such as "I tried this, and it worked for me!" to make it more authentic.
     - **Tone**: Avoid corporate or overly formal language. The tone should feel **personal, casual, and relatable**—as if written by a real streamer.
     - **Hashtags**: Use **3–5 hashtags**, including:  
       - `#streaming`  
       - `#TikTokLIVE`  
       - Add relevant, specific tags like:  
         - `#OBS`  
         - `#gamedev`  
         - `#livestreaming`  
         - `#streamtips`  
     - **Banner image**: Attach the **compressed banner image** created in Step 5.
     - **First comment link**: **Do not include the blog link in the tweet itself**. Post the link in the **first comment** below the tweet.
   - **Post the tweet**:  
     - Publish the tweet with the banner image attached.  
     - Immediately post the **first comment** containing the blog link with UTM parameters (e.g., `https://ttwise.live/blog/{slug}?utm_source=twitter&utm_campaign={slug}`).  
     - Ensure the tweet has an engaging hook and is easy to read, leveraging short lines and a strong call to action in the first comment.

**Blog Structure**:
1. **File Saving Locations**:
   - The blog post `.mdx` file should be saved in the `data/blog` directory, using the blog post title as the file name (e.g., `game-streaming-tips.mdx`).
   - All images (banner, charts, etc.) should be saved in `public/static/images/{blog}`, where `{blog}` is the same name as the `.mdx` file (e.g., `game-streaming-tips/`). This ensures all media assets are correctly linked to the blog post.

2. **Build Process**:
   - After writing the blog, use the command `npm run build` to build the blog.
   - If **build errors occur**, refer to the following steps to troubleshoot:
     - Review the **build logs** to identify any file path or dependency issues.
     - Ensure that all image paths and references in the `.mdx` file match the folder structure.
     - If there are **missing dependencies** or package issues, run `npm install` to ensure all required packages are present.
     - If errors are related to **formatting**, check the markdown syntax (e.g., incorrect headings, mismatched tags) and correct them.
   - After fixing any errors, re-run `npm run build` to verify that the blog is successfully built.

3. **Additional Information**:
   - All blog posts must be written in **English** to maintain consistency across content.
   - The blog domain is: `https://ttwise.live`  
     Ensure the URL structure for each blog is correct, e.g., `https://ttwise.live/blog/{slug}`.
