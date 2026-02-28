
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

$slug = "tiktok-live-retention-problems-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The 3-Second Filter ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(245, 245, 250))

# Left: The Swipe (Blurry motion)
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 0, 0, 600, 600)
$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
Draw-TextCentered $g "THE SWIPE" $fontTitle ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 0, 200, 600, 100)
Draw-TextCentered $g "(< 3 Seconds)" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 300, 600, 50)

# Right: The Hook (Clear focus)
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 600, 0, 600, 600)
Draw-TextCentered $g "THE HOOK" $fontTitle ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 600, 200, 600, 100)
Draw-TextCentered $g "(Visual Context)" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 300, 600, 50)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM: The Retention Leaks ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Leak 1: The "Loading" Screen
Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 100, 100, 600, 150)
Draw-TextCentered $g "LEAK 1: The 'Loading' Screen" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "Stream looks frozen or streamer is silent." $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 600, 30)
Draw-TextCentered $g "Drop-off: 80% instantly" $fontSmall ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 100, 200, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 260),
    (New-Object System.Drawing.Point 380, 280),
    (New-Object System.Drawing.Point 420, 280)
))

# Leak 2: The Confusion
Draw-Rect $g ([System.Drawing.Brushes]::LightYellow) (New-Object System.Drawing.Rectangle 100, 300, 600, 150)
Draw-TextCentered $g "LEAK 2: The Confusion" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)
Draw-TextCentered $g "Viewer sees gameplay but doesn't know the goal." $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 360, 600, 30)
Draw-TextCentered $g "Drop-off: 50% in 10 seconds" $fontSmall ([System.Drawing.Brushes]::DarkOrange) (New-Object System.Drawing.RectangleF 100, 400, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 460),
    (New-Object System.Drawing.Point 380, 480),
    (New-Object System.Drawing.Point 420, 480)
))

# Leak 3: The Dead Air
Draw-Rect $g ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.Rectangle 100, 500, 600, 150)
Draw-TextCentered $g "LEAK 3: The Dead Air" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 600, 40)
Draw-TextCentered $g "Streamer checks phone or stares blankly." $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 560, 600, 30)
Draw-TextCentered $g "Drop-off: Gradual bleed" $fontSmall ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 100, 600, 600, 30)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN: The Attention Curve ---
$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 1100, 500) # X: Time
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 100, 50)   # Y: Retention

Draw-TextCentered $g "Time (Seconds)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 520, 400, 40)
Draw-TextCentered $g "Viewers Remaining" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 250, 80, 40)

# Curve
$penRed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red), 5
$g.DrawCurve($penRed, @(
    (New-Object System.Drawing.Point 100, 100),
    (New-Object System.Drawing.Point 200, 400), # Huge drop
    (New-Object System.Drawing.Point 600, 450),
    (New-Object System.Drawing.Point 1100, 480)
))

Draw-TextCentered $g "The 'FYP Cliff'" $fontNode ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 200, 200, 200, 40)
Draw-TextCentered $g "The 'Context Zone'" $fontNode ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 600, 400, 200, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
