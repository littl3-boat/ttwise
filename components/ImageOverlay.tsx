'use client'

import { useState, useEffect, useRef } from 'react'
import Image, { ImageProps } from 'next/image'

interface ImageOverlayProps {
  src: ImageProps['src']
  alt: string
  isOpen: boolean
  onClose: () => void
}

export default function ImageOverlay({ src, alt, isOpen, onClose }: ImageOverlayProps) {
  const [scale, setScale] = useState(1)
  const [position, setPosition] = useState({ x: 0, y: 0 })
  const [isDragging, setIsDragging] = useState(false)
  const [dragStart, setDragStart] = useState({ x: 0, y: 0 })
  const overlayRef = useRef<HTMLDivElement>(null)
  const imageRef = useRef<HTMLDivElement>(null)

  // Reset state when overlay opens/closes
  useEffect(() => {
    if (isOpen) {
      setScale(1)
      setPosition({ x: 0, y: 0 })
    }
  }, [isOpen])

  // Handle escape key
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        onClose()
      }
    }

    if (isOpen) {
      document.addEventListener('keydown', handleKeyDown)
      document.body.style.overflow = 'hidden'
    }

    return () => {
      document.removeEventListener('keydown', handleKeyDown)
      document.body.style.overflow = 'unset'
    }
  }, [isOpen, onClose])

  // Handle mouse wheel zoom
  const handleWheel = (e: React.WheelEvent) => {
    e.preventDefault()
    const delta = e.deltaY > 0 ? 0.9 : 1.1
    const newScale = Math.min(Math.max(scale * delta, 0.1), 5)
    setScale(newScale)
  }

  // Handle mouse down for dragging
  const handleMouseDown = (e: React.MouseEvent) => {
    if (scale > 1) {
      setIsDragging(true)
      setDragStart({
        x: e.clientX - position.x,
        y: e.clientY - position.y,
      })
    }
  }

  // Handle mouse move for dragging
  const handleMouseMove = (e: React.MouseEvent) => {
    if (isDragging && scale > 1) {
      setPosition({
        x: e.clientX - dragStart.x,
        y: e.clientY - dragStart.y,
      })
    }
  }

  // Handle mouse up
  const handleMouseUp = () => {
    setIsDragging(false)
  }

  // Handle double click to reset zoom
  const handleDoubleClick = () => {
    setScale(1)
    setPosition({ x: 0, y: 0 })
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const srcString = typeof src === 'string' ? src : (src as any).src || ''
  const isSvg = srcString.toLowerCase().split('?')[0].endsWith('.svg')
  const basePath = process.env.BASE_PATH
  const finalSrc = srcString.startsWith('/') && basePath ? `${basePath}${srcString}` : srcString

  if (!isOpen) return null

  return (
    // eslint-disable-next-line jsx-a11y/no-noninteractive-element-interactions
    <div
      ref={overlayRef}
      className="bg-opacity-90 fixed inset-0 z-50 flex items-center justify-center bg-black"
      onClick={onClose}
      onWheel={handleWheel}
      onKeyDown={(e) => e.key === 'Escape' && onClose()}
      role="dialog"
      aria-modal="true"
      aria-label="Image overlay"
      tabIndex={-1}
    >
      <div
        ref={imageRef}
        className="relative max-h-full max-w-full cursor-grab active:cursor-grabbing"
        onMouseDown={handleMouseDown}
        onMouseMove={handleMouseMove}
        onMouseUp={handleMouseUp}
        onMouseLeave={handleMouseUp}
        onDoubleClick={handleDoubleClick}
        onClick={(e) => e.stopPropagation()}
        role="button"
        tabIndex={0}
        onKeyDown={(e) => {
          if (e.key === 'Escape') {
            onClose()
          }
        }}
        style={{
          transform: `translate(${position.x}px, ${position.y}px) scale(${scale})`,
          transformOrigin: 'center center',
          transition: isDragging ? 'none' : 'transform 0.1s ease-out',
        }}
      >
        {isSvg ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={finalSrc}
            alt={alt}
            className="max-h-[90vh] max-w-[90vw] object-contain"
            style={{ width: 'auto', height: 'auto' }}
          />
        ) : (
          <Image
            src={src}
            alt={alt}
            width={1200}
            height={800}
            className="max-h-[90vh] max-w-[90vw] object-contain"
            priority
          />
        )}
      </div>

      {/* Close button */}
      <button
        onClick={onClose}
        className="bg-opacity-50 hover:bg-opacity-75 absolute top-4 right-4 z-10 rounded-full bg-black p-2 text-white focus:ring-2 focus:ring-white focus:outline-none"
        aria-label="Close image overlay"
      >
        <svg className="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
      </button>

      {/* Zoom tip */}
      <div className="absolute bottom-4 left-1/2 -translate-x-1/2 text-sm text-white opacity-75">
        <p>Scroll to zoom • Drag to pan • Double-click to reset</p>
      </div>
    </div>
  )
}
