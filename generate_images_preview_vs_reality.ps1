
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

$slug = "tiktok-live-preview-vs-reality-quality-drops-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Preview Lie ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Backgrounds
$leftRect = New-Object System.Drawing.Rectangle 0, 0, 600, 600
$rightRect = New-Object System.Drawing.Rectangle 600, 0, 600, 600
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, $leftRect)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $rightRect)

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Left: Preview (Crisp)
Draw-TextCentered $g "PREVIEW" $fontTitle ([System.Drawing.Brushes]::DarkBlue) (New-Object System.Drawing.RectangleF 0, 50, 600, 100)
Draw-TextCentered $g "(GPU Rendering)" $fontSub ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 0, 120, 600, 50)

$boxRectL = New-Object System.Drawing.Rectangle 150, 250, 300, 200
$g.FillRectangle([System.Drawing.Brushes]::White, $boxRectL)
$g.DrawRectangle([System.Drawing.Pens]::Blue, $boxRectL)
Draw-TextCentered $g "CRISP 1080p" $fontLabel ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 150, 300, 300, 100)

# Right: Live (Blurry)
Draw-TextCentered $g "LIVE STREAM" $fontTitle ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 600, 50, 600, 100)
Draw-TextCentered $g "(Network Ingest)" $fontSub ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 600, 120, 600, 50)

$boxRectR = New-Object System.Drawing.Rectangle 750, 250, 300, 200
$g.FillRectangle([System.Drawing.Brushes]::White, $boxRectR)
$g.DrawRectangle([System.Drawing.Pens]::Red, $boxRectR)

# Simulate Blur (draw text multiple times slightly offset)
for ($i = -2; $i -le 2; $i++) {
    for ($j = -2; $j -le 2; $j++) {
        $alphaBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(50, 255, 0, 0))
        $blurRect = New-Object System.Drawing.RectangleF (750 + $i), (300 + $j), 300, 100
        Draw-TextCentered $g "BLURRY 480p" $fontLabel $alphaBrush $blurRect
    }
}

# VS Arrow
Draw-TextCentered $g "VS" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 500, 250, 200, 200)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: The Invisible Path ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "Why Preview Lies: The Invisible Path" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$centerX = 500
$yStart = 100
$boxW = 200
$boxH = 80
$gap = 100

# Path 1: Local Preview (Short Loop)
$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 100, $yStart, $boxW, $boxH)
Draw-TextCentered $g "GPU Output" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, $yStart, $boxW, $boxH)

$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 100, $yStart + 200, $boxW, $boxH)
Draw-TextCentered $g "Your Monitor" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, ($yStart + 200), $boxW, $boxH)

# Arrow Down
$penGreen = New-Object System.Drawing.Pen([System.Drawing.Color]::Green, 5)
$penGreen.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penGreen, 200, ($yStart + $boxH), 200, ($yStart + 200))
Draw-TextCentered $g "Direct Path" $fontLabel ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 210, ($yStart + 100), 150, 40)

# Path 2: Live Stream (Long Dangerous Path)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 600, $yStart, $boxW, $boxH)
Draw-TextCentered $g "GPU Output" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, $yStart, $boxW, $boxH)

# Steps
$y = $yStart + 150
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 600, $y, $boxW, $boxH)
Draw-TextCentered $g "Encoder (Compression)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, $y, $boxW, $boxH)

$y += 150
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 600, $y, $boxW, $boxH)
Draw-TextCentered $g "Network Upload" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, $y, $boxW, $boxH)

$y += 150
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 600, $y, $boxW, $boxH)
Draw-TextCentered $g "TikTok Ingest" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, $y, $boxW, $boxH)

$y += 150
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 600, $y, $boxW, $boxH)
Draw-TextCentered $g "Viewer Phone" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, $y, $boxW, $boxH)

# Arrows
$penRed = New-Object System.Drawing.Pen([System.Drawing.Color]::Red, 5)
$penRed.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penRed, 700, $yStart + $boxH, 700, $yStart + 150)
$g.DrawLine($penRed, 700, $yStart + 230, 700, $yStart + 300)
$g.DrawLine($penRed, 700, $yStart + 380, 700, $yStart + 450)
$g.DrawLine($penRed, 700, $yStart + 530, 700, $yStart + 600)

# Danger Zones
Draw-TextCentered $g "LOSS HERE" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 810, ($yStart + 300), 150, 40)
Draw-TextCentered $g "LOSS HERE" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 810, ($yStart + 450), 150, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: The Dynamic Setting Trap ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The #1 Reason for Blurry Streams" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Mock UI Window
$uiRect = New-Object System.Drawing.Rectangle 200, 100, 600, 400
$g.FillRectangle([System.Drawing.Brushes]::WhiteSmoke, $uiRect)
$g.DrawRectangle([System.Drawing.Pens]::Gray, $uiRect)

# Header
$g.FillRectangle([System.Drawing.Brushes]::DarkGray, 200, 100, 600, 40)
Draw-TextCentered $g "TikTok Live Studio Settings" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 200, 100, 600, 40)

# Settings
Draw-TextCentered $g "Video Quality" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 250, 180, 200, 40)
$g.DrawRectangle([System.Drawing.Pens]::Black, 500, 180, 200, 40)
Draw-TextCentered $g "1080p 60 FPS" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 500, 180, 200, 40)

# The Trap
Draw-TextCentered $g "Dynamic Bitrate" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 250, 280, 200, 40)
$checkRect = New-Object System.Drawing.Rectangle 500, 280, 40, 40
$g.DrawRectangle([System.Drawing.Pens]::Black, $checkRect)
# Checkmark
$penCheck = New-Object System.Drawing.Pen([System.Drawing.Color]::Blue, 5)
$g.DrawLine($penCheck, 505, 300, 515, 315)
$g.DrawLine($penCheck, 515, 315, 535, 285)

Draw-TextCentered $g "Adjust automatically" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 280, 200, 40)

# Big Red X
$penX = New-Object System.Drawing.Pen([System.Drawing.Color]::Red, 10)
$g.DrawLine($penX, 200, 100, 800, 500)
$g.DrawLine($penX, 800, 100, 200, 500)

Draw-TextCentered $g "NEVER ENABLE THIS!" $fontTitle ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 200, 400, 600, 100)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
