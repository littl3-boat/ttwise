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

$slug = "tiktok-live-monetization-stopped-violation-or-delay-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(18, 22, 30))

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "MONETIZATION STOPPED" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 30, 1200, 60)
Draw-TextCentered $g "VIOLATION vs SYSTEM DELAY" $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 90, 1200, 40)

$leftRect = New-Object System.Drawing.Rectangle 100, 160, 480, 340
$rightRect = New-Object System.Drawing.Rectangle 620, 160, 480, 340
$bgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(40, 40, 50))

Draw-Rect $g $bgBrush $leftRect
Draw-Rect $g $bgBrush $rightRect

Draw-TextCentered $g "VIOLATION" $fontLabel ([System.Drawing.Brushes]::LightCoral) (New-Object System.Drawing.RectangleF 100, 175, 480, 40)
Draw-TextCentered $g "Notice in Inbox" $fontLabel ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 100, 240, 480, 40)
Draw-TextCentered $g "Gifts Disabled" $fontLabel ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 100, 290, 480, 40)
Draw-TextCentered $g "Appeal Required" $fontLabel ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 100, 340, 480, 40)

Draw-TextCentered $g "SYSTEM DELAY" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 175, 480, 40)
Draw-TextCentered $g "No Notice" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 240, 480, 40)
Draw-TextCentered $g "72h Window" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 290, 480, 40)
Draw-TextCentered $g "Auto Restore" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 340, 480, 40)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 900, 1100
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)

function Draw-Node {
    param($g, $text, $x, $y, $color)
    $rect = New-Object System.Drawing.Rectangle $x, $y, 320, 90
    $brush = New-Object System.Drawing.SolidBrush($color)
    $g.FillRectangle($brush, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $text $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $x, $y, 320, 90)
}

Draw-TextCentered $g "Why Monetization Stops" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 900, 50)

Draw-Node $g "Gifts Disabled" 290 110 ([System.Drawing.Color]::LightSalmon)
$g.DrawLine($penArrow, 450, 200, 450, 260)

Draw-Node $g "Check Inbox" 290 260 ([System.Drawing.Color]::LightBlue)
$g.DrawLine($penArrow, 450, 350, 200, 430)
$g.DrawLine($penArrow, 450, 350, 700, 430)

Draw-Node $g "Violation Notice" 50 430 ([System.Drawing.Color]::LightCoral)
Draw-Node $g "No Notice" 530 430 ([System.Drawing.Color]::LightGreen)

$g.DrawLine($penArrow, 210, 520, 210, 600)
$g.DrawLine($penArrow, 690, 520, 690, 600)

Draw-Node $g "Appeal + Fix" 50 600 ([System.Drawing.Color]::Orange)
Draw-Node $g "Wait 24-72h" 530 600 ([System.Drawing.Color]::LightGray)

$g.DrawLine($penArrow, 210, 690, 210, 770)
$g.DrawLine($penArrow, 690, 690, 690, 770)

Draw-Node $g "Restore Access" 50 770 ([System.Drawing.Color]::LightGreen)
Draw-Node $g "If Still Off" 530 770 ([System.Drawing.Color]::LightSalmon)

$g.DrawLine($penArrow, 690, 860, 690, 940)
Draw-Node $g "Submit Ticket" 530 940 ([System.Drawing.Color]::LightBlue)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 72-Hour Reality Window" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$timelineRect = New-Object System.Drawing.Rectangle 80, 200, 840, 80
$g.FillRectangle([System.Drawing.Brushes]::WhiteSmoke, $timelineRect)
$g.DrawRectangle([System.Drawing.Pens]::Black, $timelineRect)

$g.DrawLine([System.Drawing.Pens]::Black, 120, 240, 880, 240)

$g.DrawString("0h", $fontLabel, [System.Drawing.Brushes]::Black, 110, 260)
$g.DrawString("24h", $fontLabel, [System.Drawing.Brushes]::Black, 300, 260)
$g.DrawString("48h", $fontLabel, [System.Drawing.Brushes]::Black, 520, 260)
$g.DrawString("72h", $fontLabel, [System.Drawing.Brushes]::Black, 740, 260)

Draw-TextCentered $g "If No Inbox Notice, wait for auto restore" $fontLabel ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 120, 320, 760, 40)
Draw-TextCentered $g "If Notice arrives, switch to appeal path" $fontLabel ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 120, 380, 760, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
