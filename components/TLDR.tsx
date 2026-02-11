import React from 'react'

const TLDR = ({ children }) => {
  return (
    <div className="border-primary-500/20 bg-primary-50/50 dark:bg-primary-900/10 my-8 rounded-xl border p-6">
      <div className="text-primary-600 dark:text-primary-400 mb-4 flex items-center gap-2 text-xl font-bold">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
        >
          <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />
          <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />
        </svg>
        TL;DR
      </div>
      <div className="prose-sm prose prose-slate dark:prose-invert max-w-none [&>li]:mb-2 [&>li]:flex [&>li]:gap-2 [&>li]:before:content-['✅'] [&>ul]:m-0 [&>ul]:list-none [&>ul]:p-0">
        {children}
      </div>
    </div>
  )
}

export default TLDR
