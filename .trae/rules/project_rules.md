When I ask you to "write blog for reddit posts", I would specify the following information:

- The subreddit name, e.g. "r/streaming"
- The keyword (optional)
- The number of blogs I want to write

Then you should write me blog posts following the steps below:

1. Read the reddit-blog-tracking.json file to understand the blog posts that have been written, remember the post ids
2. Search the hottest posts in the subreddit with the keyword (if provided), and get the top N posts that are not tracked in the reddit-blog-tracking.json file (use the post id to check if it is tracked)
3. For each post, you should write a blog post following the steps below:
    - Read the reddit post details (including comments, comment limit is 300)
    - Write the blog based on the reddit post details with the same format as the other blog posts in the data/blog directory
    - Update the reddit-blog-tracking.json file with the new blog post details
4. Once the blog is written, you should update it for better SEO:
    - Make sure the tags are focused, don't include too many tags
    - Humanize the blog content to make it more natural and engaging and not like written by AI
    - Generate a proper banner image of 1280(w)*720(h) ratio
    - Analyze the blog to generate appropriate diagrams or charts using mermaid or matplotlib(use matplotlib when generating charts for data analysis, otherwise use mermaid), then render them to png images of high quality and resolution using mermaid-cli (for mermaid) or python matplotlib (for matplotlib) and insert them into the blog appropriately. Note that the diagram should not span too widely horizontally, try to extend it vertically when necessary.
    - Below the diagrams, please use comprehensive and structured words to explain the diagram in details.
5. Compress the banner image and diagrams or charts by tinypng
6. Check the computer dates with command `date +%Y-%m-%d` and update the dates in the blog and the reddit-blog-tracking.json file
7. Generate and post a tweet with less than 280 characters with the banner image and blog link and hashtags #streaming #TikTokLIVE
8. Git push all the changes to the remote repository to deploy the blog

Blog structure:
- The blog post .mdx file should be saved in the data/blog directory
- All the images should be saved in the public/static/images/{blog}/, where {blog} is the blog post file name
- After all done, use command `yarn run build` to build the blog, fix the build errors if any

Extra info:
- The blog post should be written in English
- The blog domain is https://ttwise.live