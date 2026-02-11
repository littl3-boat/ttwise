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

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const srcString = typeof src === 'string' ? src : (src as any).src || ''
  const isSvg = srcString.toLowerCase().split('?')[0].endsWith('.svg')
  const isUnsized = !rest.width && !rest.height && !rest.fill

  // Prepend basePath for img tag if src is a local path
  const finalSrc =
    srcString.startsWith('/') && basePath ? `${basePath.replace(/\/$/, '')}${srcString}` : srcString

  // Handle fill prop for img tag branch
  const imgStyle: React.CSSProperties = rest.fill
    ? {
        position: 'absolute',
        height: '100%',
        width: '100%',
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        objectFit: (rest.className?.includes('object-cover')
          ? 'cover'
          : 'contain') as React.CSSProperties['objectFit'],
        ...rest.style,
      }
    : {
        display: 'block',
        maxWidth: '100%',
        height: 'auto',
        ...rest.style,
      }

  return (
    <>
      {isUnsized || isSvg ? (
        // eslint-disable-next-line @next/next/no-img-element, jsx-a11y/no-noninteractive-element-interactions
        <img
          src={finalSrc}
          alt={rest.alt || ''}
          width={rest.width}
          height={rest.height}
          onClick={shouldEnableOverlay ? handleClick : undefined}
          onKeyDown={
            shouldEnableOverlay
              ? (e) => {
                  if (e.key === 'Enter' || e.key === ' ') handleClick()
                }
              : undefined
          }
          role={shouldEnableOverlay ? 'button' : undefined}
          tabIndex={shouldEnableOverlay ? 0 : undefined}
          className={`${rest.className || ''} ${shouldEnableOverlay ? 'cursor-pointer' : ''}`}
          style={imgStyle}
        />
      ) : (
        <NextImage
          src={src}
          {...rest}
          unoptimized={rest.unoptimized}
          onClick={shouldEnableOverlay ? handleClick : undefined}
          className={`${rest.className || ''} ${shouldEnableOverlay ? 'cursor-pointer' : ''}`}
          style={{ ...rest.style }}
        />
      )}
      {shouldEnableOverlay && (
        <ImageOverlay
          src={src}
          alt={rest.alt || ''}
          isOpen={isOverlayOpen}
          onClose={() => setIsOverlayOpen(false)}
        />
      )}
    </>
  )
}

export default Image
