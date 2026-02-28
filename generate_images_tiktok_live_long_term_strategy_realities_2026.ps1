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

$slug = "tiktok-live-gaming-long-term-strategy-realities-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$fontTitle = New-Object System.Drawing.Font("Arial", 32, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(18, 20, 28))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$leftRect = New-Object System.Drawing.Rectangle 60, 100, 520, 360
$rightRect = New-Object System.Drawing.Rectangle 620, 100, 520, 360

Draw-Rect $g ([System.Drawing.Brushes]::DarkSlateBlue) $leftRect
Draw-Rect $g ([System.Drawing.Brushes]::DarkOliveGreen) $rightRect

Draw-TextCentered $g "Expectation" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 120, 520, 40)
Draw-TextCentered $g "Linear growth" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 170, 520, 30)
Draw-TextCentered $g "One game forever" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 210, 520, 30)
Draw-TextCentered $g "Stable audience" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 250, 520, 30)

Draw-TextCentered $g "Reality" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 120, 520, 40)
Draw-TextCentered $g "Spikes + plateaus" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 170, 520, 30)
Draw-TextCentered $g "Seasonal pivots" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 210, 520, 30)
Draw-TextCentered $g "Borrowed traffic" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 250, 520, 30)

Draw-TextCentered $g "TikTok Live Gaming: Long-Term Strategy Realities" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 480, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

Draw-TextCentered $g "The 3-Season Strategy Loop" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 40)

Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 120, 100, 560, 140)
Draw-TextCentered $g "Season 1: Discovery" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 110, 560, 40)
Draw-TextCentered $g "Ride trends, test hooks" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 160, 560, 30)

$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 250),
    (New-Object System.Drawing.Point 380, 270),
    (New-Object System.Drawing.Point 420, 270)
))

Draw-Rect $g ([System.Drawing.Brushes]::LightYellow) (New-Object System.Drawing.Rectangle 120, 300, 560, 140)
Draw-TextCentered $g "Season 2: Conversion" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 310, 560, 40)
Draw-TextCentered $g "Turn spikes into chat" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 360, 560, 30)

$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 450),
    (New-Object System.Drawing.Point 380, 470),
    (New-Object System.Drawing.Point 420, 470)
))

Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) (New-Object System.Drawing.Rectangle 120, 500, 560, 140)
Draw-TextCentered $g "Season 3: Retention" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 510, 560, 40)
Draw-TextCentered $g "Build routines + community" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 120, 560, 560, 30)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

Draw-TextCentered $g "Long-Term Reality Matrix" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1200, 40)

$left = New-Object System.Drawing.Rectangle 60, 100, 340, 420
$mid = New-Object System.Drawing.Rectangle 430, 100, 340, 420
$right = New-Object System.Drawing.Rectangle 800, 100, 340, 420

Draw-Rect $g ([System.Drawing.Brushes]::AliceBlue) $left
Draw-Rect $g ([System.Drawing.Brushes]::Lavender) $mid
Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) $right

Draw-TextCentered $g "Reality" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 110, 340, 30)
Draw-TextCentered $g "Spiky discovery" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 160, 340, 30)
Draw-TextCentered $g "Audience rental" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 210, 340, 30)
Draw-TextCentered $g "Seasonal fatigue" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, 260, 340, 30)

Draw-TextCentered $g "Risk" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 110, 340, 30)
Draw-TextCentered $g "Chasing spikes" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 160, 340, 30)
Draw-TextCentered $g "No owned community" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 210, 340, 30)
Draw-TextCentered $g "Burnout" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 430, 260, 340, 30)

Draw-TextCentered $g "Countermove" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 110, 340, 30)
Draw-TextCentered $g "Weekly experiments" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 160, 340, 30)
Draw-TextCentered $g "Discord + VODs" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 210, 340, 30)
Draw-TextCentered $g "Season caps" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 260, 340, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
