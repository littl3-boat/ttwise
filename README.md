# TTWise - TikTok Live Streaming Blog

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/git/external?repository-url=https://github.com/littl3-boat/ttwise)

**TTWise** is your trusted guide for everything related to **TikTok Live streaming**. Whether you're just getting started or already going live regularly, this blog provides practical tips, tool breakdowns, livestream strategies, and real creator insights to help you grow faster, stream smarter, and engage deeper.

## 🎯 About TTWise

TikTok Live is one of the most exciting and fastest-growing spaces for creators, sellers, educators, and entertainers. But it can also be overwhelming:

- What gear and tools should I use?
- How can I attract and retain viewers?
- Why is my stream lagging or being throttled?
- How do I monetize effectively?

TTWise provides **clear, focused, and beginner-friendly guidance** with no gatekeeping or confusing jargon — just real strategies that work.

## 🧭 What You'll Find

- ✅ **Step-by-step tutorials** for TikTok Live setup and optimization
- 🛠 **Tool reviews** to help you pick the right software and gear
- 💡 **Livestream content ideas** that actually work
- 📊 **Growth and analytics insights** to improve performance
- 💬 **Creator interviews and case studies** to learn from the best
- ⚠ **Troubleshooting guides** for common livestream issues

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ 
- Yarn or npm

### Installation

1. Clone the repository:
```bash
git clone https://github.com/littl3-boat/ttwise.git
cd ttwise
```

2. Install dependencies:
```bash
yarn install
```

3. Start the development server:
```bash
yarn dev
```

4. Open [http://localhost:3000](http://localhost:3000) to view the blog.

## 📝 Adding Content

### Blog Posts

Add new blog posts in the `data/blog/` directory as `.mdx` files. Use the following frontmatter structure:

```yaml
---
title: "Your Post Title"
description: "Brief description of your post"
date: 2025-01-01
tags: ["tiktok live", "streaming tips", "tools"]
categories: ["Tutorial"]
slug: "your-post-slug"
draft: false
---
```

### Configuration

- **Site Metadata**: Edit `data/siteMetadata.js` to update site information
- **Authors**: Add author information in `data/authors/`
- **Navigation**: Modify `data/headerNavLinks.ts` to customize navigation
- **Projects**: Update `data/projectsData.ts` for the projects page

## 🎨 Customization

### Styling

- **Tailwind CSS**: Modify `tailwind.config.js` and `css/tailwind.css`
- **Code Highlighting**: Customize `css/prism.css` for code block styles
- **Components**: Edit components in the `components/` directory

### Layouts

Three post layouts are available:
- `PostLayout` - Default 2-column layout with meta and author info
- `PostSimple` - Simplified version of PostLayout
- `PostBanner` - Features a banner image

## 🚀 Deployment

### Vercel (Recommended)

The easiest way to deploy is using [Vercel](https://vercel.com):

1. Push your code to GitHub
2. Import your repository in Vercel
3. Deploy automatically

### Other Platforms

For static hosting (GitHub Pages, Netlify, etc.):

```bash
EXPORT=1 UNOPTIMIZED=1 yarn build
```

Then deploy the generated `out` folder.

## 📚 Tech Stack

- **Framework**: [Next.js 14](https://nextjs.org/) with App Router
- **Styling**: [Tailwind CSS](https://tailwindcss.com/)
- **Content**: [Contentlayer](https://www.contentlayer.dev/) for MDX
- **Analytics**: [Pliny](https://github.com/timlrx/pliny) integration
- **Comments**: Giscus, Utterances, or Disqus
- **Search**: Kbar or Algolia
- **Newsletter**: Multiple provider support

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

This blog is built on the excellent [Tailwind Nextjs Starter Blog](https://github.com/timlrx/tailwind-nextjs-starter-blog) template by Timothy Lin.

---

**Let's go live, the smart way! 🚀**

*Built with ❤️ for the TikTok Live community* 