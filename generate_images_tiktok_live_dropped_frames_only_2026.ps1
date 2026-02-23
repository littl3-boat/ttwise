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

$slug = "tiktok-live-dropped-frames-only-on-tiktok-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.Clear([System.Drawing.Color]::White)

$leftRect = New-Object System.Drawing.Rectangle 0, 0, 600, 600
$rightRect = New-Object System.Drawing.Rectangle 600, 0, 600, 600
$g.FillRectangle([System.Drawing.Brushes]::Honeydew, $leftRect)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $rightRect)

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "OTHER PLATFORMS" $fontTitle ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 0, 40, 600, 60)
Draw-TextCentered $g "Smooth stream" $fontSub ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 0, 100, 600, 40)

$g.FillRectangle([System.Drawing.Brushes]::DarkGreen, 120, 220, 360, 80)
Draw-TextCentered $g "OBS: 0 Dropped Frames" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 120, 220, 360, 80)

$g.FillRectangle([System.Drawing.Brushes]::DarkGreen, 120, 340, 360, 80)
Draw-TextCentered $g "Upload Stable" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 120, 340, 360, 80)

Draw-TextCentered $g "TIKTOK LIVE" $fontTitle ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 600, 40, 600, 60)
Draw-TextCentered $g "Dropped Frames" $fontSub ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 600, 100, 600, 40)

$g.FillRectangle([System.Drawing.Brushes]::DarkRed, 720, 220, 360, 80)
Draw-TextCentered $g "OBS: Network Dropped" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 720, 220, 360, 80)

$g.FillRectangle([System.Drawing.Brushes]::OrangeRed, 720, 340, 360, 80)
Draw-TextCentered $g "Ingest Path Unstable" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 720, 340, 360, 80)

Draw-TextCentered $g "Same PC, different server behavior" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 500, 1200, 60)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1000, 750
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "Why TikTok Drops Frames When Others Don’t" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$boxW = 760
$boxH = 90

$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 120, 140, $boxW, $boxH)
Draw-TextCentered $g "OBS render is stable (no encoding lag)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 140, $boxW, $boxH)

$g.FillRectangle([System.Drawing.Brushes]::LightYellow, 120, 280, $boxW, $boxH)
Draw-TextCentered $g "TikTok ingest path is strict + jitter sensitive" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 280, $boxW, $boxH)

$g.FillRectangle([System.Drawing.Brushes]::LightCoral, 120, 420, $boxW, $boxH)
Draw-TextCentered $g "Network dropped frames spike in OBS" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 420, $boxW, $boxH)

$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 4)
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, 500, 230, 500, 280)
$g.DrawLine($penArrow, 500, 370, 500, 420)

Draw-TextCentered $g "Misattribution: you blame GPU/CPU, but it’s the path" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 120, 560, $boxW, 50)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1000, 700
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "TikTok-Only Dropped Frames: 3 Targeted Fixes" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$boxW = 280
$boxH = 220
$y = 200

$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 60, $y, $boxW, $boxH)
Draw-TextCentered $g "1. Ingest Path" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, $y, $boxW, 40)
Draw-TextCentered $g "Use closest RTMP server" $fontLabel ([System.Drawing.Brushes]::Navy) (New-Object System.Drawing.RectangleF 60, ($y + 50), $boxW, 60)
Draw-TextCentered $g "Avoid generic URLs" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 60, ($y + 120), $boxW, 60)

$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 360, $y, $boxW, $boxH)
Draw-TextCentered $g "2. Bitrate Control" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 360, $y, $boxW, 40)
Draw-TextCentered $g "CBR 3000–4000" $fontLabel ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 360, ($y + 50), $boxW, 60)
Draw-TextCentered $g "Keyframe = 2s" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 360, ($y + 120), $boxW, 60)

$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 660, $y, $boxW, $boxH)
Draw-TextCentered $g "3. Upload Stability" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 660, $y, $boxW, 40)
Draw-TextCentered $g "Wired test session" $fontLabel ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 660, ($y + 50), $boxW, 60)
Draw-TextCentered $g "Disable bufferbloat" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 660, ($y + 120), $boxW, 60)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()

Write-Host "Done"
