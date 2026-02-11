import Image from './Image'

interface PostBannerProps {
  src: string
  alt: string
  caption?: string
}

const PostBanner = ({ src, alt, caption }: PostBannerProps) => {
  return (
    <div className="my-8 w-full">
      <div
        className="relative w-full overflow-hidden rounded-lg shadow-lg"
        style={{ aspectRatio: '2 / 1' }}
      >
        <Image
          src={src}
          alt={alt}
          fill
          className="object-cover"
          enableOverlay={false}
          unoptimized
          priority
        />
      </div>
      {caption && (
        <p className="mt-4 px-4 text-center text-sm leading-relaxed font-medium text-gray-600 italic">
          {caption}
        </p>
      )}
    </div>
  )
}

export default PostBanner
