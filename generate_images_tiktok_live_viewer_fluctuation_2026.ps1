
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

$slug = "tiktok-live-viewer-fluctuation-normal-vs-penalty-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: Rollercoaster Graph ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(30, 30, 40))

# Draw Graph
$penGreen = New-Object System.Drawing.Pen ([System.Drawing.Color]::LightGreen), 5
$points = @(
    (New-Object System.Drawing.Point 0, 500),
    (New-Object System.Drawing.Point 200, 100),
    (New-Object System.Drawing.Point 400, 550),
    (New-Object System.Drawing.Point 600, 200),
    (New-Object System.Drawing.Point 800, 500),
    (New-Object System.Drawing.Point 1000, 150),
    (New-Object System.Drawing.Point 1200, 400)
)
$g.DrawCurve($penGreen, $points)

$fontTitle = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "IS THIS NORMAL?" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 50, 1200, 100)
Draw-TextCentered $g "Wild viewer swings are a feature, not a bug." $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 150, 1200, 50)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM: The Batch Test Loop ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Step 1: Injection
Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 100, 100, 600, 150)
Draw-TextCentered $g "1. TRAFFIC INJECTION" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "+500 Viewers from FYP" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 600, 30)
Draw-TextCentered $g "(View Count Spikes)" $fontSmall ([System.Drawing.Brushes]::DarkBlue) (New-Object System.Drawing.RectangleF 100, 200, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 260),
    (New-Object System.Drawing.Point 380, 280),
    (New-Object System.Drawing.Point 420, 280)
))

# Step 2: The Filter
Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 100, 300, 600, 150)
Draw-TextCentered $g "2. THE FILTER (3 Seconds)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)
Draw-TextCentered $g "90% Swipe Away Immediately" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 360, 600, 30)
Draw-TextCentered $g "(View Count Crashes)" $fontSmall ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 100, 400, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 460),
    (New-Object System.Drawing.Point 380, 480),
    (New-Object System.Drawing.Point 420, 480)
))

# Step 3: The Result
Draw-Rect $g ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.Rectangle 100, 500, 600, 150)
Draw-TextCentered $g "3. THE RESIDUAL" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 600, 40)
Draw-TextCentered $g "Remaining 10% are 'True Viewers'" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 560, 600, 30)
Draw-TextCentered $g "Cycle Repeats if Retention > 60s" $fontSmall ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 100, 600, 600, 30)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN: Normal vs Penalty ---
$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Left: Normal Fluctuation
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 50, 100, 500, 400)
Draw-TextCentered $g "NORMAL (The Heartbeat)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 50, 120, 500, 40)
# Draw Sine Wave-ish
$penBlue = New-Object System.Drawing.Pen ([System.Drawing.Color]::Blue), 3
$pointsNorm = @(
    (New-Object System.Drawing.Point 50, 300),
    (New-Object System.Drawing.Point 150, 200),
    (New-Object System.Drawing.Point 250, 350),
    (New-Object System.Drawing.Point 350, 150),
    (New-Object System.Drawing.Point 450, 300),
    (New-Object System.Drawing.Point 550, 250)
)
$g.DrawCurve($penBlue, $pointsNorm)
Draw-TextCentered $g "Spikes + Dips = Active Algorithm" $fontSmall ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 50, 450, 500, 30)

# Right: Penalty Flatline
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 650, 100, 500, 400)
Draw-TextCentered $g "PENALTY (The Flatline)" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 650, 120, 500, 40)
# Draw Flat Line
$penRed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red), 3
$g.DrawLine($penRed, 650, 400, 1150, 400)
Draw-TextCentered $g "Zero Variation = Dead Algorithm" $fontSmall ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 650, 450, 500, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
