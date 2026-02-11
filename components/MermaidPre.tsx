'use client'

import { useEffect, useRef, type ComponentProps } from 'react'
import Pre from 'pliny/ui/Pre'

function isMermaidChild(children: React.ReactNode): boolean {
  const c = Array.isArray(children) ? children[0] : children
  if (!c || typeof c !== 'object' || !('props' in c)) return false
  const props = (c as React.ReactElement<{ className?: string | string[] }>).props
  const className = props?.className
  if (typeof className === 'string') return className.split(' ').includes('language-mermaid')
  if (Array.isArray(className)) return className.includes('language-mermaid')
  return false
}

/**
 * Renders <pre> blocks. For mermaid code blocks (class "mermaid" or
 * code.language-mermaid), runs Mermaid in the browser. No build-time rendering.
 */
export default function MermaidPre(props: ComponentProps<'pre'>) {
  const preRef = useRef<HTMLPreElement>(null)
  const isMermaid = props.className?.includes?.('mermaid') || isMermaidChild(props.children)

  useEffect(() => {
    if (!isMermaid || !preRef.current) return
    let cancelled = false
    import('mermaid')
      .then((mod) => {
        if (cancelled) return
        const mermaid = mod.default
        mermaid.run({
          nodes: [preRef.current!],
          suppressErrors: true,
        })
      })
      .catch(() => {
        // Ignore: diagram will stay as code block
      })
    return () => {
      cancelled = true
    }
  }, [isMermaid])

  if (isMermaid) {
    const className = [props.className, 'mermaid'].filter(Boolean).join(' ')
    return <pre {...props} className={className} ref={preRef} />
  }
  return <Pre>{props.children}</Pre>
}
