
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

$slug = "tiktok-live-gaming-burnout-recovery-dopamine-detox-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Dopamine Crash ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))

# Background: Chaotic noise on left, calm on right
$g.FillRectangle([System.Drawing.Brushes]::DarkRed, 0, 0, 600, 600)
$g.FillRectangle([System.Drawing.Brushes]::Teal, 600, 0, 600, 600)

# Left: Overstimulation
$fontNoise = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
for ($i = 0; $i -lt 50; $i++) {
    $x = Get-Random -Minimum 0 -Maximum 600
    $y = Get-Random -Minimum 0 -Maximum 600
    $g.DrawString("GIFT!", $fontNoise, [System.Drawing.Brushes]::Red, $x, $y)
    $g.DrawString("+1 FOLLOW", $fontNoise, [System.Drawing.Brushes]::Orange, $x+20, $y+20)
}

# Right: The Void/Calm
# Just a single controller icon or text
$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
Draw-TextCentered $g "THE CRASH" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 200, 600, 100)
Draw-TextCentered $g "THE RECOVERY" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 600, 200, 600, 100)

# Central Divider
$g.FillRectangle([System.Drawing.Brushes]::Black, 590, 0, 20, 600)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: The Dopamine Baseline ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'TikTok Fried' Brain: Dopamine Baseline" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 80)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 700, 900, 700) # X Time
$g.DrawLine([System.Drawing.Pens]::Black, 100, 700, 100, 100) # Y Dopamine

# Baseline
$penBase = New-Object System.Drawing.Pen([System.Drawing.Color]::Gray, 2)
$penBase.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
$g.DrawLine($penBase, 100, 500, 900, 500)
$g.DrawString("Normal Enjoyment Level", $fontNoise, [System.Drawing.Brushes]::Gray, 110, 480)

# TikTok Spikes
$pointsSpike = @(
    (New-Object System.Drawing.Point 100, 500),
    (New-Object System.Drawing.Point 150, 200), # Spike
    (New-Object System.Drawing.Point 200, 500),
    (New-Object System.Drawing.Point 250, 150), # Spike
    (New-Object System.Drawing.Point 300, 500),
    (New-Object System.Drawing.Point 350, 100), # Huge Spike
    (New-Object System.Drawing.Point 400, 600)  # Crash below baseline
)
$g.DrawLines([System.Drawing.Pens]::Red, $pointsSpike)

# The Crash Zone
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 400, 500, 500, 200)
$g.DrawString("THE BURN OUT ZONE", $fontTitle, [System.Drawing.Brushes]::Red, 500, 600)
$g.DrawString("(Gaming feels boring here)", $fontNoise, [System.Drawing.Brushes]::Red, 550, 650)

# Recovery Curve
$pointsRec = @(
    (New-Object System.Drawing.Point 400, 600),
    (New-Object System.Drawing.Point 600, 580),
    (New-Object System.Drawing.Point 800, 520),
    (New-Object System.Drawing.Point 900, 500)
)
$g.DrawCurve([System.Drawing.Pens]::Green, $pointsRec)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: The Blind Stream Protocol ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'Blind Stream' Setup" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 80)

# Monitor
$g.DrawRectangle([System.Drawing.Pens]::Black, 200, 150, 600, 350)
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 210, 160, 580, 330)

# Elements
# Game (Center)
$g.FillRectangle([System.Drawing.Brushes]::DarkSlateBlue, 250, 180, 500, 250)
Draw-TextCentered $g "GAMEPLAY (Focus)" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 250, 180, 500, 250)

# Tape over View Count
$g.FillRectangle([System.Drawing.Brushes]::Black, 700, 160, 80, 40)
$g.DrawString("X", $fontTitle, [System.Drawing.Brushes]::Red, 720, 160)
$g.DrawString("Tape Over View Count", $fontNoise, [System.Drawing.Brushes]::Red, 700, 130)

# Chat (Minimized)
$g.FillRectangle([System.Drawing.Brushes]::White, 250, 440, 500, 40)
$g.DrawString("Chat (Read only during breaks)", $fontNoise, [System.Drawing.Brushes]::Black, 350, 450)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
