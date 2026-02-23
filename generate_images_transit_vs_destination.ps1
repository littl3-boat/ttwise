
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

$slug = "tiktok-live-transit-vs-destination-gaming-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: Transit Station vs Living Room ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))

# Split Background
$g.FillRectangle([System.Drawing.Brushes]::DarkSlateGray, 0, 0, 600, 600) # Transit (TikTok)
$g.FillRectangle([System.Drawing.Brushes]::Indigo, 600, 0, 600, 600) # Home (Twitch)

# Text Fonts
$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Left: Transit Station
Draw-TextCentered $g "TIKTOK LIVE" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 50, 600, 100)
Draw-TextCentered $g "THE TRANSIT STATION" $fontSub ([System.Drawing.Brushes]::Cyan) (New-Object System.Drawing.RectangleF 0, 150, 600, 50)
Draw-TextCentered $g "High Traffic" $fontLabel ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 300, 600, 40)
Draw-TextCentered $g "Zero Loitering" $fontLabel ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 350, 600, 40)
Draw-TextCentered $g "Pass-Through Only" $fontLabel ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 400, 600, 40)

# Right: Living Room
Draw-TextCentered $g "TWITCH / YT" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 600, 50, 600, 100)
Draw-TextCentered $g "THE LIVING ROOM" $fontSub ([System.Drawing.Brushes]::Plum) (New-Object System.Drawing.RectangleF 600, 150, 600, 50)
Draw-TextCentered $g "Low Traffic" $fontLabel ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 600, 300, 600, 40)
Draw-TextCentered $g "High Comfort" $fontLabel ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 600, 350, 600, 40)
Draw-TextCentered $g "Destination Only" $fontLabel ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 600, 400, 600, 40)

# VS Badge
$g.FillEllipse([System.Drawing.Brushes]::White, 550, 250, 100, 100)
Draw-TextCentered $g "VS" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 250, 100, 100)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: The Viewer Journey (Funnel) ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'Transit to Home' Strategy" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Funnel Shape
$points = @(
    (New-Object System.Drawing.Point 100, 100),
    (New-Object System.Drawing.Point 900, 100),
    (New-Object System.Drawing.Point 600, 500),
    (New-Object System.Drawing.Point 400, 500)
)
$g.FillPolygon([System.Drawing.Brushes]::LightBlue, $points)

# Top Section (TikTok)
$g.DrawLine([System.Drawing.Pens]::Black, 100, 100, 900, 100)
Draw-TextCentered $g "TIKTOK LIVE (Discovery)" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 120, 800, 50)
Draw-TextCentered $g "10,000 Impressions" $fontLabel ([System.Drawing.Brushes]::DarkBlue) (New-Object System.Drawing.RectangleF 100, 170, 800, 40)

# Middle Section (Filter)
Draw-TextCentered $g "THE FILTER" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 200, 300, 600, 50)
Draw-TextCentered $g "Viewers who like YOUR personality" $fontLabel ([System.Drawing.Brushes]::DarkBlue) (New-Object System.Drawing.RectangleF 200, 350, 600, 40)

# Bottom Section (Destination)
$g.FillRectangle([System.Drawing.Brushes]::Purple, 400, 500, 200, 200)
Draw-TextCentered $g "TWITCH / DISCORD" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 400, 520, 200, 40)
Draw-TextCentered $g "Home Base" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 400, 570, 200, 40)
Draw-TextCentered $g "50 True Fans" $fontLabel ([System.Drawing.Brushes]::Yellow) (New-Object System.Drawing.RectangleF 400, 620, 200, 40)

# Arrows
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 5)
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, 500, 200, 500, 280)
$g.DrawLine($penArrow, 500, 400, 500, 480)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: Retention vs Reach ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'Exclusive' Risk: Why TikTok-Only Fails" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Graph Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 900, 500) # X Axis (Time)
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 100, 100) # Y Axis (Value)

# TikTok Curve (High Spike, Fast Crash)
$pointsTT = @(
    (New-Object System.Drawing.Point 100, 500),
    (New-Object System.Drawing.Point 200, 100),
    (New-Object System.Drawing.Point 300, 400),
    (New-Object System.Drawing.Point 400, 200),
    (New-Object System.Drawing.Point 500, 450),
    (New-Object System.Drawing.Point 900, 480)
)
$g.DrawCurve([System.Drawing.Pens]::Red, $pointsTT)
Draw-TextCentered $g "TikTok Only (Volatility)" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 200, 80, 200, 40)

# Hybrid Curve (Slow Steady Growth)
$pointsHyb = @(
    (New-Object System.Drawing.Point 100, 500),
    (New-Object System.Drawing.Point 300, 450),
    (New-Object System.Drawing.Point 500, 350),
    (New-Object System.Drawing.Point 700, 250),
    (New-Object System.Drawing.Point 900, 150)
)
$g.DrawCurve([System.Drawing.Pens]::Blue, $pointsHyb)
Draw-TextCentered $g "Hybrid Model (Compound Growth)" $fontLabel ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 600, 120, 300, 40)

# Labels
Draw-TextCentered $g "Month 1" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 100, 40)
Draw-TextCentered $g "Month 12" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 850, 510, 100, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
