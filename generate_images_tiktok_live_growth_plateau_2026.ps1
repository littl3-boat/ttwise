
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

$slug = "tiktok-live-growth-plateau-explained-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Plateau (Stairs vs Ceiling) ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(240, 240, 245))

# Visual: A character hitting a glass ceiling while stairs continue upward but are blocked
$penCeiling = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red), 5
$g.DrawLine($penCeiling, 100, 300, 1100, 300)

$fontTitle = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "THE 200-VIEW CEILING" $fontTitle ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 0, 200, 1200, 100)
Draw-TextCentered $g "It's not a bug. It's a bucket." $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 320, 1200, 50)

# Little characters stuck below
$g.FillEllipse([System.Drawing.Brushes]::Gray, 200, 400, 50, 50)
$g.FillEllipse([System.Drawing.Brushes]::Gray, 600, 400, 50, 50)
$g.FillEllipse([System.Drawing.Brushes]::Gray, 1000, 400, 50, 50)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM: The 3 Buckets of Traffic ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Bucket 1: Seed (0-200)
Draw-Rect $g ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.Rectangle 100, 100, 600, 150)
Draw-TextCentered $g "BUCKET 1: SEED (0-200 Views)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "Test: Is the video/stream technically stable?" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 600, 30)
Draw-TextCentered $g "Exit Req: 95% technical health + basic engagement" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 100, 200, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 260),
    (New-Object System.Drawing.Point 380, 280),
    (New-Object System.Drawing.Point 420, 280)
))

# Bucket 2: Calibration (200-1000)
Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 100, 300, 600, 150)
Draw-TextCentered $g "BUCKET 2: CALIBRATION (200-1000)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)
Draw-TextCentered $g "Test: Who actually watches this?" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 360, 600, 30)
Draw-TextCentered $g "Exit Req: 60s Retention + Shares" $fontSmall ([System.Drawing.Brushes]::DarkBlue) (New-Object System.Drawing.RectangleF 100, 400, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 460),
    (New-Object System.Drawing.Point 380, 480),
    (New-Object System.Drawing.Point 420, 480)
))

# Bucket 3: Scaling (1000+)
Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 100, 500, 600, 150)
Draw-TextCentered $g "BUCKET 3: SCALING (1000+)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 600, 40)
Draw-TextCentered $g "Test: Can we monetize/retain at scale?" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 560, 600, 30)
Draw-TextCentered $g "Exit Req: Gifts + Follows" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 100, 600, 600, 30)

# Plateau Label
$g.DrawString("YOU ARE HERE (The Plateau)", $fontNode, [System.Drawing.Brushes]::Red, 450, 420)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN: Linear vs Exponential Growth ---
$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 1100, 500) # X
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 100, 50)   # Y

# Linear Line (YouTube/Twitch)
$g.DrawLine((New-Object System.Drawing.Pen ([System.Drawing.Color]::Blue), 3), 100, 500, 1100, 100)
Draw-TextCentered $g "Traditional Growth (Linear)" $fontNode ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 800, 120, 300, 40)

# Step Function (TikTok)
$penStep = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red), 3
$g.DrawLine($penStep, 100, 500, 300, 500)
$g.DrawLine($penStep, 300, 500, 300, 400)
$g.DrawLine($penStep, 300, 400, 600, 400)
$g.DrawLine($penStep, 600, 400, 600, 200)
$g.DrawLine($penStep, 600, 200, 1100, 200)

Draw-TextCentered $g "TikTok Growth (Step Function)" $fontNode ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 600, 180, 400, 40)
Draw-TextCentered $g "Plateau 1" $fontSmall ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 150, 510, 100, 30)
Draw-TextCentered $g "Plateau 2" $fontSmall ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 400, 410, 100, 30)
Draw-TextCentered $g "Plateau 3" $fontSmall ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 800, 210, 100, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
