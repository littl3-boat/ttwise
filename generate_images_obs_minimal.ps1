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

$slug = "obs-minimal-settings-tiktok-live-gaming-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(18, 22, 30))

$fontTitle = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

$leftRect = New-Object System.Drawing.Rectangle 60, 120, 520, 360
$rightRect = New-Object System.Drawing.Rectangle 620, 120, 520, 360

Draw-Rect $g ([System.Drawing.Brushes]::Black) $leftRect
Draw-Rect $g ([System.Drawing.Brushes]::Black) $rightRect

Draw-TextCentered $g "MINIMAL SETTINGS" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 130, 520, 40)
Draw-TextCentered $g "720x1280 @ 30" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 60, 200, 520, 40)
Draw-TextCentered $g "CBR + 2s Keyframes" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 60, 250, 520, 40)
Draw-TextCentered $g "Bitrate 3500-4500" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 60, 300, 520, 40)
Draw-TextCentered $g "Phone Test" $fontSmall ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 60, 350, 520, 40)

Draw-TextCentered $g "MAXED SETTINGS" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 130, 520, 40)
Draw-TextCentered $g "1080x1920 @ 60" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 620, 200, 520, 40)
Draw-TextCentered $g "VBR + 5s Keyframes" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 620, 250, 520, 40)
Draw-TextCentered $g "Bitrate 7000+" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 620, 300, 520, 40)
Draw-TextCentered $g "Stutter Risk" $fontSmall ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 620, 350, 520, 40)

Draw-TextCentered $g "Minimal OBS Settings That Actually Work" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 20, 1200, 70)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 900, 1200
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)

function Draw-Node {
    param($g, $text, $x, $y, $color)
    $rect = New-Object System.Drawing.Rectangle $x, $y, 360, 90
    $brush = New-Object System.Drawing.SolidBrush($color)
    $g.FillRectangle($brush, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $text $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $x, $y, 360, 90)
}

Draw-TextCentered $g "Minimal Settings Flow" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 900, 40)

Draw-Node $g "Vertical Canvas 720x1280" 270 90 ([System.Drawing.Color]::LightSkyBlue)
$g.DrawLine($penArrow, 450, 180, 450, 240)
Draw-Node $g "CBR + 2s Keyframes" 270 240 ([System.Drawing.Color]::LightGreen)
$g.DrawLine($penArrow, 450, 330, 450, 390)
Draw-Node $g "Bitrate 3500-4500" 270 390 ([System.Drawing.Color]::LightYellow)
$g.DrawLine($penArrow, 450, 480, 450, 540)
Draw-Node $g "Phone Playback Test" 270 540 ([System.Drawing.Color]::LightGray)
$g.DrawLine($penArrow, 450, 630, 450, 690)
Draw-Node $g "Stable Live Session" 270 690 ([System.Drawing.Color]::LightGreen)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontHeader = New-Object System.Drawing.Font("Arial", 22, [System.Drawing.FontStyle]::Bold)
Draw-TextCentered $g "Minimal Profile (What to Touch)" $fontHeader ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$rows = @(
    "Video: Base=1080x1920  Output=720x1280  FPS=30",
    "Output: CBR  Bitrate=3500-4500  Keyframes=2",
    "Encoder: NVENC or Quick Sync",
    "Audio: 48 kHz  160 kbps",
    "Stats: 0% Dropped/Render/Encode Lag"
)

$y = 110
foreach ($row in $rows) {
    $rect = New-Object System.Drawing.Rectangle 60, $y, 880, 90
    $g.FillRectangle([System.Drawing.Brushes]::WhiteSmoke, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $row $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 60, $y, 880, 90)
    $y += 110
}

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
