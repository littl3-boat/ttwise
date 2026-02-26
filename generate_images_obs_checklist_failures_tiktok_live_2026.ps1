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

function Draw-Rect {
    param(
        $graphics,
        $brush,
        $rect
    )
    $graphics.FillRectangle($brush, $rect)
    $graphics.DrawRectangle([System.Drawing.Pens]::Black, $rect)
}

$slug = "obs-output-checklists-fail-tiktok-live-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$fontTitle = New-Object System.Drawing.Font("Arial", 34, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 22, 28))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$leftRect = New-Object System.Drawing.Rectangle 60, 100, 520, 360
$rightRect = New-Object System.Drawing.Rectangle 620, 100, 520, 360

Draw-Rect $g ([System.Drawing.Brushes]::DarkSlateGray) $leftRect
Draw-Rect $g ([System.Drawing.Brushes]::DarkOliveGreen) $rightRect

Draw-TextCentered $g "Checklist Pass" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 120, 520, 40)
Draw-TextCentered $g "CBR + 2s keyframes" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 180, 520, 30)
Draw-TextCentered $g "720x1280 @ 30" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 220, 520, 30)
Draw-TextCentered $g "Still looks soft" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 60, 260, 520, 30)

Draw-TextCentered $g "Real Bottleneck" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 120, 520, 40)
Draw-TextCentered $g "Ingest path" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 180, 520, 30)
Draw-TextCentered $g "Upload headroom" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 220, 520, 30)
Draw-TextCentered $g "Phone playback" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 260, 520, 30)

$penArrow = New-Object System.Drawing.Pen ([System.Drawing.Color]::Gold), 4
$g.DrawLine($penArrow, 580, 280, 620, 280)
$g.DrawLine($penArrow, 610, 270, 620, 280)
$g.DrawLine($penArrow, 610, 290, 620, 280)

Draw-TextCentered $g "Why Output Checklists Fail on TikTok Live" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 480, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

Draw-TextCentered $g "Checklist Failure Map" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 40)

Draw-Rect $g ([System.Drawing.Brushes]::LightSteelBlue) (New-Object System.Drawing.Rectangle 100, 100, 600, 120)
Draw-TextCentered $g "Checklist says: 720p30 + CBR" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "Reality: Still soft" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 100, 150, 600, 40)

$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 230),
    (New-Object System.Drawing.Point 380, 250),
    (New-Object System.Drawing.Point 420, 250)
))

Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 100, 260, 600, 120)
Draw-TextCentered $g "Hidden issue: Upload spikes" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 270, 600, 40)
Draw-TextCentered $g "TikTok re-encodes hard" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)

$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 390),
    (New-Object System.Drawing.Point 380, 410),
    (New-Object System.Drawing.Point 420, 410)
))

Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) (New-Object System.Drawing.Rectangle 100, 420, 600, 120)
Draw-TextCentered $g "Fix: Measure ingest path + phone test" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 430, 600, 40)
Draw-TextCentered $g "Adjust after symptoms, not before" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 100, 470, 600, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

Draw-TextCentered $g "Symptom → Cause → Fix Matrix" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1200, 40)

$left = New-Object System.Drawing.Rectangle 60, 100, 340, 420
$mid = New-Object System.Drawing.Rectangle 430, 100, 340, 420
$right = New-Object System.Drawing.Rectangle 800, 100, 340, 420

Draw-Rect $g ([System.Drawing.Brushes]::AliceBlue) $left
Draw-Rect $g ([System.Drawing.Brushes]::Lavender) $mid
Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) $right

Draw-TextCentered $g "Symptom" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 110, 340, 30)
Draw-TextCentered $g "Looks soft on phone" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 160, 340, 30)
Draw-TextCentered $g "Audio feels late" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 210, 340, 30)
Draw-TextCentered $g "Random stutter" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 260, 340, 30)

Draw-TextCentered $g "Likely Cause" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 110, 340, 30)
Draw-TextCentered $g "Upload headroom" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 160, 340, 30)
Draw-TextCentered $g "Audio resample" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 210, 340, 30)
Draw-TextCentered $g "Render/encode lag" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 260, 340, 30)

Draw-TextCentered $g "Fix" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 110, 340, 30)
Draw-TextCentered $g "Lower bitrate" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 160, 340, 30)
Draw-TextCentered $g "Match 48 kHz" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 210, 340, 30)
Draw-TextCentered $g "Cap FPS / lighter scene" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 260, 340, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
