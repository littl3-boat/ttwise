
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

$slug = "tiktok-live-effort-imbalance-production-trap-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Backgrounds
$leftRect = New-Object System.Drawing.Rectangle 0, 0, 600, 600
$rightRect = New-Object System.Drawing.Rectangle 600, 0, 600, 600
$g.FillRectangle([System.Drawing.Brushes]::Black, $leftRect)
$g.FillRectangle([System.Drawing.Brushes]::White, $rightRect)

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Left: High Effort / Low Views
Draw-TextCentered $g "HIGH EFFORT" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 50, 600, 100)
Draw-TextCentered $g "($5000 Setup)" $fontSub ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 0, 120, 600, 50)

$boxRectL = New-Object System.Drawing.Rectangle 150, 250, 300, 200
$g.FillRectangle([System.Drawing.Brushes]::DarkBlue, $boxRectL)
Draw-TextCentered $g "4K Camera" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 150, 260, 300, 40)
Draw-TextCentered $g "Perfect Audio" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 150, 300, 300, 40)
Draw-TextCentered $g "0 VIEWS" $fontTitle ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 150, 380, 300, 50)

# Right: Low Effort / High Views
Draw-TextCentered $g "LOW EFFORT" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 50, 600, 100)
Draw-TextCentered $g "(Phone Only)" $fontSub ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 600, 120, 600, 50)

$boxRectR = New-Object System.Drawing.Rectangle 750, 250, 300, 200
$g.FillRectangle([System.Drawing.Brushes]::LightGray, $boxRectR)
Draw-TextCentered $g "Bad Lighting" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 750, 260, 300, 40)
Draw-TextCentered $g "Shaky Cam" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 750, 300, 300, 40)
Draw-TextCentered $g "10k VIEWS" $fontTitle ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 750, 380, 300, 50)

# VS
Draw-TextCentered $g "VS" $fontTitle ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 500, 250, 200, 200)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: The Production Paradox Curve ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'Production Paradox' on TikTok Live" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 700, 900, 700) # X
$g.DrawLine([System.Drawing.Pens]::Black, 100, 700, 100, 100) # Y

Draw-TextCentered $g "Production Value (Cost/Effort)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 720, 200, 40)
Draw-TextCentered $g "Algorithmic Reach" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 350, 80, 40)

# Curve: Starts High (Phone), Dips (Mid-tier/OBS), Goes High (TV Quality)
$penCurve = New-Object System.Drawing.Pen([System.Drawing.Color]::Red, 5)
$points = @(
    New-Object System.Drawing.Point -ArgumentList 100, 200   # Phone (High Reach)
    New-Object System.Drawing.Point -ArgumentList 300, 500   # Webcam/OBS (Dip)
    New-Object System.Drawing.Point -ArgumentList 500, 600   # "Pro" Streamer (Low Reach - Looks like Ad)
    New-Object System.Drawing.Point -ArgumentList 700, 400   # TV Studio
    New-Object System.Drawing.Point -ArgumentList 900, 100   # Viral Event
)
$g.DrawCurve($penCurve, $points)

# Annotations
Draw-TextCentered $g "Authentic Zone" $fontLabel ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 100, 150, 150, 40)
Draw-TextCentered $g "The 'Uncanny Valley'" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 400, 620, 200, 40)
Draw-TextCentered $g "(Looks like a pre-recorded Ad)" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 400, 660, 200, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: Where to Shift Effort ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "Shift Your Effort: The 3 Levers" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$col1 = 100
$col2 = 550
$row1 = 150
$row2 = 300
$row3 = 450
$w = 400
$h = 100

# Headers
Draw-TextCentered $g "WASTED EFFORT (Technical)" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF $col1, 100, $w, 50)
Draw-TextCentered $g "HIGH ROI EFFORT (Psychological)" $fontLabel ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF $col2, 100, $w, 50)

# Row 1
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $col1, $row1, $w, $h)
Draw-TextCentered $g "4K Resolution / 6000 Bitrate" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col1, $row1, $w, $h)
$g.FillRectangle([System.Drawing.Brushes]::Honeydew, $col2, $row1, $w, $h)
Draw-TextCentered $g "Visual Hook (First 3 Seconds)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col2, $row1, $w, $h)

# Row 2
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $col1, $row2, $w, $h)
Draw-TextCentered $g "Complex OBS Overlays" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col1, $row2, $w, $h)
$g.FillRectangle([System.Drawing.Brushes]::Honeydew, $col2, $row2, $w, $h)
Draw-TextCentered $g "Constant Verbal Engagement" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col2, $row2, $w, $h)

# Row 3
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $col1, $row3, $w, $h)
Draw-TextCentered $g "Expensive Microphone" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col1, $row3, $w, $h)
$g.FillRectangle([System.Drawing.Brushes]::Honeydew, $col2, $row3, $w, $h)
Draw-TextCentered $g "Emotional Reaction / Energy" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col2, $row3, $w, $h)

# Arrows
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 5)
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, 510, $row1+50, 540, $row1+50)
$g.DrawLine($penArrow, 510, $row2+50, 540, $row2+50)
$g.DrawLine($penArrow, 510, $row3+50, 540, $row3+50)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
