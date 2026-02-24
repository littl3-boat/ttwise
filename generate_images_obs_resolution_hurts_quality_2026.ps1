Add-Type -AssemblyName System.Drawing

function Draw-TextCentered {
    param(
        $graphics,
        $text,
        $font,
        $brush,
        $rect
    )
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    $rectF = [System.Drawing.RectangleF]$rect
    $graphics.DrawString($text, $font, $brush, $rectF, $format)
}

function Draw-Box {
    param(
        $graphics,
        $text,
        $x,
        $y,
        $w,
        $h,
        $color,
        $font
    )
    $rect = New-Object System.Drawing.Rectangle $x, $y, $w, $h
    $brush = New-Object System.Drawing.SolidBrush($color)
    $graphics.FillRectangle($brush, $rect)
    $graphics.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $graphics $text $font ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $x, $y, $w, $h)
}

$slug = "obs-resolution-hurts-tiktok-live-quality-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(16, 20, 28))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$leftRect = New-Object System.Drawing.Rectangle 40, 80, 520, 380
$rightRect = New-Object System.Drawing.Rectangle 640, 80, 520, 380

$g.FillRectangle([System.Drawing.Brushes]::DarkSlateGray, $leftRect)
$g.FillRectangle([System.Drawing.Brushes]::DimGray, $rightRect)
$g.DrawRectangle([System.Drawing.Pens]::White, $leftRect)
$g.DrawRectangle([System.Drawing.Pens]::White, $rightRect)

Draw-TextCentered $g "OBS Preview" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 40, 100, 520, 40)
Draw-TextCentered $g "1080x1920 @ 60" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 40, 160, 520, 40)
Draw-TextCentered $g "Looks sharp" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 40, 210, 520, 40)

Draw-TextCentered $g "TikTok Live Output" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 640, 100, 520, 40)
Draw-TextCentered $g "Re-encoded + Scaled" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 640, 160, 520, 40)
Draw-TextCentered $g "Soft + blocky" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 640, 210, 520, 40)

$penArrow = New-Object System.Drawing.Pen ([System.Drawing.Color]::Gold), 4
$g.DrawLine($penArrow, 560, 270, 640, 270)
$g.DrawLine($penArrow, 630, 260, 640, 270)
$g.DrawLine($penArrow, 630, 280, 640, 270)
Draw-TextCentered $g "Resolution + Bitrate squeeze" $fontSmall ([System.Drawing.Brushes]::Gold) (New-Object System.Drawing.RectangleF 420, 300, 360, 40)

Draw-TextCentered $g "OBS Resolution Choices Hurt TikTok Live Quality" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 490, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontHeader = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "Why Resolution Choices Break TikTok Quality" $fontHeader ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 40)

$boxW = 640
$boxH = 70
$x = 80
$y = 100
$gap = 40

Draw-Box $g "Canvas 1080x1920" $x $y $boxW $boxH ([System.Drawing.Color]::LightSteelBlue) $fontNode
$g.DrawLine([System.Drawing.Pens]::Black, 400, $y + $boxH, 400, $y + $boxH + $gap)
$y += $boxH + $gap

Draw-Box $g "Output 1080x1920 @ 60" $x $y $boxW $boxH ([System.Drawing.Color]::Lavender) $fontNode
$g.DrawLine([System.Drawing.Pens]::Black, 400, $y + $boxH, 400, $y + $boxH + $gap)
$y += $boxH + $gap

Draw-Box $g "Bitrate 3500-4500" $x $y $boxW $boxH ([System.Drawing.Color]::MistyRose) $fontNode
$g.DrawLine([System.Drawing.Pens]::Black, 400, $y + $boxH, 400, $y + $boxH + $gap)
$y += $boxH + $gap

Draw-Box $g "Bits per pixel collapse" $x $y $boxW $boxH ([System.Drawing.Color]::Moccasin) $fontNode
$g.DrawLine([System.Drawing.Pens]::Black, 400, $y + $boxH, 400, $y + $boxH + $gap)
$y += $boxH + $gap

Draw-Box $g "TikTok re-encodes again" $x $y $boxW $boxH ([System.Drawing.Color]::LightYellow) $fontNode
$g.DrawLine([System.Drawing.Pens]::Black, 400, $y + $boxH, 400, $y + $boxH + $gap)
$y += $boxH + $gap

Draw-Box $g "Soft + blocky on phones" $x $y $boxW $boxH ([System.Drawing.Color]::LightGray) $fontNode

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::WhiteSmoke)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$left = New-Object System.Drawing.Rectangle 60, 80, 520, 440
$right = New-Object System.Drawing.Rectangle 620, 80, 520, 440

$g.FillRectangle([System.Drawing.Brushes]::Honeydew, $left)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $right)
$g.DrawRectangle([System.Drawing.Pens]::Black, $left)
$g.DrawRectangle([System.Drawing.Pens]::Black, $right)

Draw-TextCentered $g "Stable Profile" $fontSub ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 60, 100, 520, 40)
Draw-TextCentered $g "720x1280 @ 30" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 60, 160, 520, 30)
Draw-TextCentered $g "Match Base = Output" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 60, 200, 520, 30)
Draw-TextCentered $g "Bitrate 3000-4500" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 60, 240, 520, 30)
Draw-TextCentered $g "Phone looks clean" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 60, 280, 520, 30)

Draw-TextCentered $g "Risky Profile" $fontSub ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 620, 100, 520, 40)
Draw-TextCentered $g "1080x1920 @ 60" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 620, 160, 520, 30)
Draw-TextCentered $g "Low bits per pixel" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 620, 200, 520, 30)
Draw-TextCentered $g "TikTok re-encodes hard" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 620, 240, 520, 30)
Draw-TextCentered $g "Soft or blocky playback" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 620, 280, 520, 30)

Draw-TextCentered $g "Resolution choice decides how much TikTok has to fix" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 520, 1200, 60)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
