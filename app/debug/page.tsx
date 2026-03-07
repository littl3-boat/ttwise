import { allBlogs } from 'contentlayer/generated'
import { sortPosts, allCoreContent } from 'pliny/utils/contentlayer'
import SectionContainer from '@/components/SectionContainer'

export const dynamic = 'force-dynamic'

export default function DebugPage() {
  const posts = allCoreContent(sortPosts(allBlogs))
  return (
    <SectionContainer>
      <div className="p-10">
        <h1 className="mb-4 text-2xl font-bold">Debug Blog Posts ({posts.length})</h1>
        <ul className="list-disc pl-5">
          {posts.map((post) => (
            <li key={post.slug} className="mb-2">
              <strong>{post.title}</strong> - {post.date} (Draft: {String(post.draft)})
            </li>
          ))}
        </ul>
      </div>
    </SectionContainer>
  )
}
