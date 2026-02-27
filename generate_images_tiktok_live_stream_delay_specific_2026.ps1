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

$slug = "tiktok-live-stream-delay-specific-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$fontTitle = New-Object System.Drawing.Font("Arial", 34, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(16, 18, 24))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$stackRect = New-Object System.Drawing.Rectangle 80, 140, 520, 320
$phoneRect = New-Object System.Drawing.Rectangle 640, 140, 480, 320

Draw-Rect $g ([System.Drawing.Brushes]::DarkSlateBlue) $stackRect
Draw-Rect $g ([System.Drawing.Brushes]::DarkOliveGreen) $phoneRect

Draw-TextCentered $g "BUFFER STACK" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 80, 150, 520, 40)
Draw-TextCentered $g "App + Ingest + Encode" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 80, 200, 520, 30)
Draw-TextCentered $g "Each adds seconds" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 80, 240, 520, 30)

Draw-TextCentered $g "PHONE PLAYBACK" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 640, 150, 480, 40)
Draw-TextCentered $g "Truth source" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 640, 200, 480, 30)
Draw-TextCentered $g "Shows real delay" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 640, 240, 480, 30)

$penArrow = New-Object System.Drawing.Pen ([System.Drawing.Color]::Gold), 4
$g.DrawLine($penArrow, 600, 300, 640, 300)
$g.DrawLine($penArrow, 630, 290, 640, 300)
$g.DrawLine($penArrow, 630, 310, 640, 300)

Draw-TextCentered $g "TikTok Live Stream Delay: Why It Feels Worse" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 480, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

Draw-TextCentered $g "TikTok Latency Stack (Where Delay Adds Up)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 40)

Draw-Rect $g ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.Rectangle 120, 100, 560, 120)
Draw-TextCentered $g "1) Capture Layer" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 110, 560, 40)
Draw-TextCentered $g "OBS / Live Studio / Capture Card" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 150, 560, 40)

$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 230),
    (New-Object System.Drawing.Point 380, 250),
    (New-Object System.Drawing.Point 420, 250)
))

Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 120, 260, 560, 120)
Draw-TextCentered $g "2) Upload Buffer" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 270, 560, 40)
Draw-TextCentered $g "Jitter + headroom + bitrate spikes" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 310, 560, 40)

$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 390),
    (New-Object System.Drawing.Point 380, 410),
    (New-Object System.Drawing.Point 420, 410)
))

Draw-Rect $g ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.Rectangle 120, 420, 560, 120)
Draw-TextCentered $g "3) TikTok Transcode" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 430, 560, 40)
Draw-TextCentered $g "Mobile safety buffer" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 470, 560, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

Draw-TextCentered $g "Delay Diagnosis Matrix" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1200, 40)

$left = New-Object System.Drawing.Rectangle 60, 100, 340, 420
$mid = New-Object System.Drawing.Rectangle 430, 100, 340, 420
$right = New-Object System.Drawing.Rectangle 800, 100, 340, 420

Draw-Rect $g ([System.Drawing.Brushes]::AliceBlue) $left
Draw-Rect $g ([System.Drawing.Brushes]::Lavender) $mid
Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) $right

Draw-TextCentered $g "Symptom" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 110, 340, 30)
Draw-TextCentered $g "Delay grows over time" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 160, 340, 30)
Draw-TextCentered $g "Delay only on TikTok" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 210, 340, 30)
Draw-TextCentered $g "Chat/video out of sync" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 260, 340, 30)

Draw-TextCentered $g "Likely Cause" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 110, 340, 30)
Draw-TextCentered $g "Upload jitter/buffer" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 160, 340, 30)
Draw-TextCentered $g "Transcode + Live Studio" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 210, 340, 30)
Draw-TextCentered $g "Monitoring device lag" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 260, 340, 30)

Draw-TextCentered $g "Fix" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 110, 340, 30)
Draw-TextCentered $g "Lower bitrate + wired" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 160, 340, 30)
Draw-TextCentered $g "Simplify pipeline" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 210, 340, 30)
Draw-TextCentered $g "Phone clock test" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 260, 340, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
