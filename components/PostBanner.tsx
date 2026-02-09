import Image from './Image'
import Bleed from 'pliny/ui/Bleed'

interface PostBannerProps {
  src: string
  alt: string
}

const PostBanner = ({ src, alt }: PostBannerProps) => {
  return (
    <div className="w-full my-8">
      <Bleed>
        <div className="relative aspect-[2/1] w-full overflow-hidden rounded-lg">
          <Image
            src={src}
            alt={alt}
            fill
            className="object-cover"
            enableOverlay={false}
          />
        </div>
      </Bleed>
    </div>
  )
}

export default PostBanner
