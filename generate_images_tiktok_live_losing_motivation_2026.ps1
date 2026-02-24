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

$slug = "tiktok-live-losing-motivation-progress-blindness-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(18, 22, 30))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$leftRect = New-Object System.Drawing.Rectangle 50, 100, 520, 360
$rightRect = New-Object System.Drawing.Rectangle 630, 100, 520, 360

Draw-Rect $g ([System.Drawing.Brushes]::DarkSlateBlue) $leftRect
Draw-Rect $g ([System.Drawing.Brushes]::DarkOliveGreen) $rightRect

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

Draw-TextCentered $g "EXPECT" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 50, 110, 520, 40)
Draw-TextCentered $g "Steady Growth" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 50, 170, 520, 30)
Draw-TextCentered $g "Motivation Stays" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 50, 210, 520, 30)

Draw-TextCentered $g "REALITY" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 630, 110, 520, 40)
Draw-TextCentered $g "Jagged Feedback" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 630, 170, 520, 30)
Draw-TextCentered $g "Motivation Drops" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 630, 210, 520, 30)

$penLine = New-Object System.Drawing.Pen ([System.Drawing.Color]::Cyan), 4
$g.DrawLine($penLine, 90, 420, 520, 200)
$g.DrawLine($penLine, 670, 420, 760, 160)
$g.DrawLine($penLine, 760, 160, 860, 380)
$g.DrawLine($penLine, 860, 380, 980, 220)
$g.DrawLine($penLine, 980, 220, 1130, 320)

Draw-TextCentered $g "Losing Motivation on TikTok Live" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 480, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

Draw-TextCentered $g "Expectation vs Reality: Motivation Loss" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 40)

Draw-Rect $g ([System.Drawing.Brushes]::LightSteelBlue) (New-Object System.Drawing.Rectangle 80, 100, 280, 120)
Draw-TextCentered $g "Expect: Linear Progress" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 110, 280, 40)
Draw-TextCentered $g "Reality: Batch Tests" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 150, 280, 40)

Draw-Rect $g ([System.Drawing.Brushes]::Lavender) (New-Object System.Drawing.Rectangle 440, 100, 280, 120)
Draw-TextCentered $g "Expect: Stable Viewers" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 440, 110, 280, 40)
Draw-TextCentered $g "Reality: Swings + Drops" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 440, 150, 280, 40)

Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 80, 280, 280, 120)
Draw-TextCentered $g "Expect: Motivation from Numbers" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 290, 280, 40)
Draw-TextCentered $g "Reality: Progress Blindness" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 330, 280, 40)

Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) (New-Object System.Drawing.Rectangle 440, 280, 280, 120)
Draw-TextCentered $g "Fix: Proof-of-Progress" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 440, 290, 280, 40)
Draw-TextCentered $g "Track 3 Small Wins" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 440, 330, 280, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontStep = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "The Proof-of-Progress Ladder" $fontStep ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1200, 40)

Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 150, 120, 300, 100)
Draw-TextCentered $g "Step 1" $fontStep ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 150, 130, 300, 30)
Draw-TextCentered $g "60s Retention Win" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 150, 160, 300, 40)

Draw-Rect $g ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.Rectangle 450, 260, 300, 100)
Draw-TextCentered $g "Step 2" $fontStep ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 450, 270, 300, 30)
Draw-TextCentered $g "1 Chatter / 10 Min" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 450, 300, 300, 40)

Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 750, 400, 300, 100)
Draw-TextCentered $g "Step 3" $fontStep ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 750, 410, 300, 30)
Draw-TextCentered $g "1 Clip Worth Posting" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 750, 440, 300, 40)

$penArrow = New-Object System.Drawing.Pen ([System.Drawing.Color]::Gray), 3
$g.DrawLine($penArrow, 450, 220, 450, 260)
$g.DrawLine($penArrow, 750, 360, 750, 400)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
