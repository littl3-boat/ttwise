'use client'

import { useState } from 'react'
import NextImage, { ImageProps } from 'next/image'
import ImageOverlay from './ImageOverlay'

const basePath = process.env.BASE_PATH

interface ImageWithOverlayProps extends ImageProps {
  enableOverlay?: boolean
}

const Image = ({ src, enableOverlay = true, ...rest }: ImageWithOverlayProps) => {
  const [isOverlayOpen, setIsOverlayOpen] = useState(false)

  // Disable overlay for images with fill prop (like in PostBanner) or if explicitly disabled
  const shouldEnableOverlay = enableOverlay && !rest.fill

  const handleClick = () => {
    if (shouldEnableOverlay) {
      setIsOverlayOpen(true)
    }
  }

  // If width and height are missing and it's not a fill image, use a regular img tag
  // to avoid Next.js Image component errors in MDX
  const isUnsized = !rest.width && !rest.height && !rest.fill

  return (
    <>
      {isUnsized ? (
        <img
          src={`${basePath || ''}${src}`}
          alt={rest.alt || ''}
          onClick={shouldEnableOverlay ? handleClick : undefined}
          className={`${rest.className || ''} ${shouldEnableOverlay ? 'cursor-pointer' : ''}`}
          style={{ ...rest.style, maxWidth: '100%', height: 'auto' }}
        />
      ) : (
        <NextImage
          src={`${basePath || ''}${src}`}
          {...rest}
          onClick={shouldEnableOverlay ? handleClick : undefined}
          className={`${rest.className || ''} ${shouldEnableOverlay ? 'cursor-pointer' : ''}`}
          style={{ ...rest.style }}
        />
      )}
      {shouldEnableOverlay && (
        <ImageOverlay
          src={`${basePath || ''}${src}`}
          alt={rest.alt || ''}
          isOpen={isOverlayOpen}
          onClose={() => setIsOverlayOpen(false)}
        />
      )}
    </>
  )
}

export default Image
