
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

$slug = "tiktok-live-vs-twitch-income-small-streamers-2026"
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
$g.FillRectangle([System.Drawing.Brushes]::Indigo, $leftRect) # Twitch Purple-ish
$g.FillRectangle([System.Drawing.Brushes]::Black, $rightRect) # TikTok Black

$fontTitle = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Text
Draw-TextCentered $g "TWITCH" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 50, 600, 100)
Draw-TextCentered $g "TIKTOK LIVE" $fontTitle ([System.Drawing.Brushes]::Cyan) (New-Object System.Drawing.RectangleF 600, 50, 600, 100)

Draw-TextCentered $g "STABILITY" $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 150, 600, 50)
Draw-TextCentered $g "DISCOVERY" $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 600, 150, 600, 50)

# Icons/Visuals (Simplified as text boxes)
$boxRectL = New-Object System.Drawing.Rectangle 150, 250, 300, 200
$g.FillRectangle([System.Drawing.Brushes]::White, $boxRectL)
Draw-TextCentered $g "0 Viewers" $fontTitle ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 150, 300, 300, 50)
Draw-TextCentered $g "$0.00" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 150, 350, 300, 50)

$boxRectR = New-Object System.Drawing.Rectangle 750, 250, 300, 200
$g.FillRectangle([System.Drawing.Brushes]::White, $boxRectR)
Draw-TextCentered $g "500 Viewers" $fontTitle ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 750, 300, 300, 50)
Draw-TextCentered $g "$50.00+" $fontTitle ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 750, 350, 300, 50)

Draw-TextCentered $g "VS" $fontTitle ([System.Drawing.Brushes]::Yellow) (New-Object System.Drawing.RectangleF 500, 250, 200, 200)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: INCOME COMPARISON MATRIX ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "Income Reality for Small Streamers (<50 CCV)" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$headerY = 100
$rowHeight = 100
$col1X = 50
$col2X = 350
$col3X = 675
$widthCol1 = 300
$widthCol2 = 300
$widthCol3 = 300

# Headers
$g.FillRectangle([System.Drawing.Brushes]::Black, $col1X, $headerY, $widthCol1, $rowHeight)
$g.FillRectangle([System.Drawing.Brushes]::Indigo, $col2X, $headerY, $widthCol2, $rowHeight)
$g.FillRectangle([System.Drawing.Brushes]::Black, $col3X, $headerY, $widthCol3, $rowHeight)

Draw-TextCentered $g "METRIC" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF $col1X, $headerY, $widthCol1, $rowHeight)
Draw-TextCentered $g "TWITCH" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF $col2X, $headerY, $widthCol2, $rowHeight)
Draw-TextCentered $g "TIKTOK LIVE" $fontLabel ([System.Drawing.Brushes]::Cyan) (New-Object System.Drawing.RectangleF $col3X, $headerY, $widthCol3, $rowHeight)

# Data
$data = @(
    @("Discovery (0 Followers)", "Near Zero", "High (FYP Feed)"),
    @("Monetization Start", "Affiliate Required", "Immediate (Gifts)"),
    @("Income Type", "Subs (Stable)", "Gifts (Volatile)"),
    @("Avg Daily Income", "$0 - $5", "$20 - $100"),
    @("Conversion Effort", "Hard (External)", "Easy (In-Feed)")
)

$currentY = $headerY + $rowHeight

foreach ($row in $data) {
    # Col 1
    $g.FillRectangle([System.Drawing.Brushes]::LightGray, $col1X, $currentY, $widthCol1, $rowHeight)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $col1X, $currentY, $widthCol1, $rowHeight)
    Draw-TextCentered $g $row[0] $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col1X, $currentY, $widthCol1, $rowHeight)
    
    # Col 2
    $g.FillRectangle([System.Drawing.Brushes]::White, $col2X, $currentY, $widthCol2, $rowHeight)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $col2X, $currentY, $widthCol2, $rowHeight)
    Draw-TextCentered $g $row[1] $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col2X, $currentY, $widthCol2, $rowHeight)
    
    # Col 3
    $g.FillRectangle([System.Drawing.Brushes]::White, $col3X, $currentY, $widthCol3, $rowHeight)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $col3X, $currentY, $widthCol3, $rowHeight)
    Draw-TextCentered $g $row[2] $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col3X, $currentY, $widthCol3, $rowHeight)
    
    $currentY += $rowHeight
}

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: DISCOVERY DIVIDEND GRAPH ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'Discovery Dividend' Gap" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 900, 500) # X
$g.DrawLine([System.Drawing.Pens]::Black, 100, 500, 100, 100) # Y

Draw-TextCentered $g "Time Streaming (Hours)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 520, 200, 40)
Draw-TextCentered $g "Viewers" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 250, 80, 40)

# Twitch Line (Flat)
$penTwitch = New-Object System.Drawing.Pen([System.Drawing.Color]::Indigo, 5)
$g.DrawLine($penTwitch, 100, 490, 900, 490)
Draw-TextCentered $g "Twitch (Flatline)" $fontLabel ([System.Drawing.Brushes]::Indigo) (New-Object System.Drawing.RectangleF 700, 450, 200, 40)

# TikTok Line (Spikes)
$penTikTok = New-Object System.Drawing.Pen([System.Drawing.Color]::Cyan, 5)
$points = @(
    New-Object System.Drawing.Point -ArgumentList 100, 490
    New-Object System.Drawing.Point -ArgumentList 200, 400
    New-Object System.Drawing.Point -ArgumentList 300, 200
    New-Object System.Drawing.Point -ArgumentList 400, 350
    New-Object System.Drawing.Point -ArgumentList 500, 150
    New-Object System.Drawing.Point -ArgumentList 600, 300
    New-Object System.Drawing.Point -ArgumentList 700, 100
    New-Object System.Drawing.Point -ArgumentList 800, 250
    New-Object System.Drawing.Point -ArgumentList 900, 400
)
$g.DrawCurve($penTikTok, $points)
Draw-TextCentered $g "TikTok (FYP Spikes)" $fontLabel ([System.Drawing.Brushes]::DarkCyan) (New-Object System.Drawing.RectangleF 700, 80, 200, 40)

# Annotation
$annoRect = New-Object System.Drawing.Rectangle 400, 50, 300, 100
$g.DrawRectangle([System.Drawing.Pens]::Red, $annoRect)
Draw-TextCentered $g "Opportunity Zone" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 400, 60, 300, 40)
Draw-TextCentered $g "Every spike is potential $$$" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 100, 300, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
