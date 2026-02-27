
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

$slug = "tiktok-live-feels-exhausting-smallstreamers-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Energy Battery ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(245, 245, 250))

# Left: Empty Battery (TikTok)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 0, 0, 600, 600)
Draw-Rect $g ([System.Drawing.Brushes]::White) (New-Object System.Drawing.Rectangle 200, 150, 200, 300)
Draw-Rect $g ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.Rectangle 200, 400, 200, 50)
$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
Draw-TextCentered $g "TikTok Live" $fontTitle ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 0, 50, 600, 100)
Draw-TextCentered $g "High Intensity Drain" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 500, 600, 50)

# Right: Full Battery (Sustainable)
$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 600, 0, 600, 600)
Draw-Rect $g ([System.Drawing.Brushes]::White) (New-Object System.Drawing.Rectangle 800, 150, 200, 300)
Draw-Rect $g ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.Rectangle 800, 200, 200, 250)
Draw-TextCentered $g "Sustainable" $fontTitle ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 600, 50, 600, 100)
Draw-TextCentered $g "System > Grind" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 500, 600, 50)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM: The Energy Leak Loop ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Step 1: The Hook
Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 100, 100, 600, 150)
Draw-TextCentered $g "1. High Energy Start" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "You yell, hype, and welcome everyone." $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 260),
    (New-Object System.Drawing.Point 380, 280),
    (New-Object System.Drawing.Point 420, 280)
))

# Step 2: The Dip
Draw-Rect $g ([System.Drawing.Brushes]::LightYellow) (New-Object System.Drawing.Rectangle 100, 300, 600, 150)
Draw-TextCentered $g "2. The Retention Dip" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)
Draw-TextCentered $g "Viewers leave. You panic. You try harder." $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 360, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 460),
    (New-Object System.Drawing.Point 380, 480),
    (New-Object System.Drawing.Point 420, 480)
))

# Step 3: The Crash
Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 100, 500, 600, 150)
Draw-TextCentered $g "3. The Adrenaline Crash" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 600, 40)
Draw-TextCentered $g "Stream ends. You feel empty, not accomplished." $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 560, 600, 30)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN: Duration vs Intensity ---
$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 1100, 500) # X: Duration
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 100, 50)   # Y: Intensity

Draw-TextCentered $g "Stream Duration (Hours)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 520, 400, 40)
Draw-TextCentered $g "Required Intensity" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 250, 80, 40)

# Twitch Curve (Low and Long)
$penBlue = New-Object System.Drawing.Pen ([System.Drawing.Color]::Blue), 5
$g.DrawLine($penBlue, 100, 400, 1100, 400)
Draw-TextCentered $g "Twitch/YouTube (Marathon)" $fontNode ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 800, 350, 300, 40)

# TikTok Curve (High and Short)
$penRed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red), 5
$g.DrawCurve($penRed, @(
    (New-Object System.Drawing.Point 100, 100),
    (New-Object System.Drawing.Point 300, 100),
    (New-Object System.Drawing.Point 500, 450) # Crash
))
Draw-TextCentered $g "TikTok Live (Sprint)" $fontNode ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 150, 50, 300, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
