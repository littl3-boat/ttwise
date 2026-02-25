
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

$slug = "tiktok-live-audience-quality-issues-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Zoo vs The Library ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(245, 245, 250))

# Left: Chaos (TikTok)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 0, 0, 600, 600)
$fontTitle = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
Draw-TextCentered $g "THE ZOO" $fontTitle ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 0, 200, 600, 100)
Draw-TextCentered $g "(TikTok Live)" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 300, 600, 50)

# Right: Silence (Twitch/YouTube)
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 600, 0, 600, 600)
Draw-TextCentered $g "THE LIBRARY" $fontTitle ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 600, 200, 600, 100)
Draw-TextCentered $g "(Twitch/YouTube)" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 300, 600, 50)

# Divider
$g.DrawLine((New-Object System.Drawing.Pen ([System.Drawing.Color]::Black), 5), 600, 0, 600, 600)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM: The Filtering Funnel ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Layer 1: The Swarm (FYP)
Draw-Rect $g ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.Rectangle 100, 100, 600, 150)
Draw-TextCentered $g "LAYER 1: THE SWARM (FYP)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "Behavior: Random, Rude, Confused" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 600, 30)
Draw-TextCentered $g "Goal: Filter them OUT quickly" $fontSmall ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 100, 200, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 260),
    (New-Object System.Drawing.Point 380, 280),
    (New-Object System.Drawing.Point 420, 280)
))

# Layer 2: The Regulars
Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 100, 300, 600, 150)
Draw-TextCentered $g "LAYER 2: THE REGULARS" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)
Draw-TextCentered $g "Behavior: Silent, Watch Time > 3m" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 360, 600, 30)
Draw-TextCentered $g "Goal: Give them context" $fontSmall ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 100, 400, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 460),
    (New-Object System.Drawing.Point 380, 480),
    (New-Object System.Drawing.Point 420, 480)
))

# Layer 3: The Core
Draw-Rect $g ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.Rectangle 100, 500, 600, 150)
Draw-TextCentered $g "LAYER 3: THE CORE" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 600, 40)
Draw-TextCentered $g "Behavior: Gifters, Mods, Subscribers" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 560, 600, 30)
Draw-TextCentered $g "Goal: Retention & Monetization" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 100, 600, 600, 30)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN: Chat Velocity vs IQ ---
$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 1100, 500) # X: Chat Speed
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 100, 50)   # Y: Chat Quality

Draw-TextCentered $g "Chat Speed (Velocity)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 520, 400, 40)
Draw-TextCentered $g "Chat Quality (IQ)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 250, 80, 40) # Vertical-ish text logic simplified

# The Curve
$penCurve = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red), 5
$g.DrawCurve($penCurve, @(
    (New-Object System.Drawing.Point 100, 100),
    (New-Object System.Drawing.Point 300, 150),
    (New-Object System.Drawing.Point 600, 300),
    (New-Object System.Drawing.Point 900, 450),
    (New-Object System.Drawing.Point 1100, 480)
))

Draw-TextCentered $g "The 'Brain Rot' Zone" $fontNode ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 800, 350, 300, 40)
Draw-TextCentered $g "Meaningful Interaction" $fontNode ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 150, 80, 300, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
