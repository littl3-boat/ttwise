'use client'

import { useEffect, useRef, type ComponentProps } from 'react'
import Pre from 'pliny/ui/Pre'

/**
 * Renders <pre> blocks. For elements with className "mermaid", runs the Mermaid
 * library in the browser to render the diagram (used when rehype-mermaid
 * strategy is 'pre-mermaid' so build does not require Playwright on Vercel).
 */
export default function MermaidPre(props: ComponentProps<'pre'>) {
  const preRef = useRef<HTMLPreElement>(null)
  const isMermaid = props.className?.includes?.('mermaid')

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
    return <pre {...props} ref={preRef} />
  }
  return <Pre>{props.children}</Pre>
}
