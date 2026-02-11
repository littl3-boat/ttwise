import { visit } from 'unist-util-visit'

type ElementLike = {
  type: string
  tagName?: string
  properties?: Record<string, unknown>
  children?: unknown[]
}

/**
 * Rehype plugin that adds className "mermaid" to <pre> elements that wrap
 * <code class="language-mermaid">. This allows client-side Mermaid rendering
 * without any build-time processing (no rehype-mermaid / Playwright).
 */
export function rehypeMermaidPre() {
  return (tree: import('unist').Node) => {
    visit(tree, 'element', (node: ElementLike) => {
      if (node.tagName !== 'pre') return
      const children = node.children || []
      const first = children[0] as ElementLike | undefined
      const code =
        first && first.type === 'element' && first.tagName === 'code' && children.length === 1
          ? first
          : null
      if (!code?.properties?.className) return
      const cn = code.properties.className
      const hasMermaid = Array.isArray(cn)
        ? cn.includes('language-mermaid')
        : String(cn).includes('language-mermaid')
      if (!hasMermaid) return
      const preClass = node.properties?.className
      const arr = Array.isArray(preClass) ? [...preClass] : preClass ? [String(preClass)] : []
      if (!arr.includes('mermaid')) arr.push('mermaid')
      node.properties = { ...node.properties, className: arr }
    })
  }
}
