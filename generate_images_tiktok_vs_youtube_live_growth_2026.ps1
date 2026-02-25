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

$slug = "tiktok-live-vs-youtube-live-growth-gaming-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

$fontTitle = New-Object System.Drawing.Font("Arial", 34, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Regular)

$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 24, 32))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$leftRect = New-Object System.Drawing.Rectangle 60, 100, 520, 360
$rightRect = New-Object System.Drawing.Rectangle 620, 100, 520, 360

Draw-Rect $g ([System.Drawing.Brushes]::DarkSlateBlue) $leftRect
Draw-Rect $g ([System.Drawing.Brushes]::DarkGreen) $rightRect

Draw-TextCentered $g "TikTok Live" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 110, 520, 40)
Draw-TextCentered $g "Fast spikes" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 160, 520, 30)
Draw-TextCentered $g "Short shelf-life" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 200, 520, 30)
Draw-TextCentered $g "Batch tests" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 60, 240, 520, 30)

Draw-TextCentered $g "YouTube Live" $fontSub ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 110, 520, 40)
Draw-TextCentered $g "Slow climb" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 160, 520, 30)
Draw-TextCentered $g "Long shelf-life" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 200, 520, 30)
Draw-TextCentered $g "Search + library" $fontSmall ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 240, 520, 30)

$penTick = New-Object System.Drawing.Pen ([System.Drawing.Color]::Cyan), 4
$g.DrawLine($penTick, 120, 390, 240, 260)
$g.DrawLine($penTick, 240, 260, 360, 360)
$g.DrawLine($penTick, 360, 360, 480, 240)

$penLine = New-Object System.Drawing.Pen ([System.Drawing.Color]::LightGreen), 4
$g.DrawLine($penLine, 700, 380, 820, 320)
$g.DrawLine($penLine, 820, 320, 940, 280)
$g.DrawLine($penLine, 940, 280, 1060, 220)

Draw-TextCentered $g "TikTok Live Growth vs YouTube Live for Gaming" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 480, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

Draw-TextCentered $g "Decision Tree: Where Should I Focus?" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 40)

$root = New-Object System.Drawing.Rectangle 200, 90, 400, 80
Draw-Rect $g ([System.Drawing.Brushes]::LightSteelBlue) $root
Draw-TextCentered $g "What do you need most?" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 200, 100, 400, 60)

$left = New-Object System.Drawing.Rectangle 40, 220, 300, 80
$right = New-Object System.Drawing.Rectangle 460, 220, 300, 80
Draw-Rect $g ([System.Drawing.Brushes]::Lavender) $left
Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) $right
Draw-TextCentered $g "Fast discovery" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 40, 230, 300, 60)
Draw-TextCentered $g "Long-term library" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 460, 230, 300, 60)

$g.DrawLine([System.Drawing.Pens]::Black, 400, 170, 190, 220)
$g.DrawLine([System.Drawing.Pens]::Black, 400, 170, 610, 220)

$left2 = New-Object System.Drawing.Rectangle 40, 360, 300, 80
$right2 = New-Object System.Drawing.Rectangle 460, 360, 300, 80
Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) $left2
Draw-Rect $g ([System.Drawing.Brushes]::LightYellow) $right2
Draw-TextCentered $g "Choose TikTok Live" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 40, 370, 300, 60)
Draw-TextCentered $g "Choose YouTube Live" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 460, 370, 300, 60)

$g.DrawLine([System.Drawing.Pens]::Black, 190, 300, 190, 360)
$g.DrawLine([System.Drawing.Pens]::Black, 610, 300, 610, 360)

$note = New-Object System.Drawing.Rectangle 200, 520, 400, 90
Draw-Rect $g ([System.Drawing.Brushes]::LightGray) $note
Draw-TextCentered $g "Split focus only if you can clip daily" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 200, 530, 400, 70)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$fontHeader = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "Growth Comparison Matrix (Gaming)" $fontHeader ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1200, 40)

$leftCol = New-Object System.Drawing.Rectangle 80, 100, 520, 420
$rightCol = New-Object System.Drawing.Rectangle 600, 100, 520, 420
Draw-Rect $g ([System.Drawing.Brushes]::AliceBlue) $leftCol
Draw-Rect $g ([System.Drawing.Brushes]::Honeydew) $rightCol

Draw-TextCentered $g "TikTok Live" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 110, 520, 40)
Draw-TextCentered $g "Discovery: Fast" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 170, 520, 30)
Draw-TextCentered $g "Retention: Volatile" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 210, 520, 30)
Draw-TextCentered $g "Monetize: Gifts" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 250, 520, 30)
Draw-TextCentered $g "Best for: Rapid tests" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 290, 520, 30)
Draw-TextCentered $g "Risk: Plateau swings" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 80, 330, 520, 30)

Draw-TextCentered $g "YouTube Live" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 110, 520, 40)
Draw-TextCentered $g "Discovery: Slow" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 170, 520, 30)
Draw-TextCentered $g "Retention: Stable" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 210, 520, 30)
Draw-TextCentered $g "Monetize: Ads + subs" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 250, 520, 30)
Draw-TextCentered $g "Best for: Library build" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 290, 520, 30)
Draw-TextCentered $g "Risk: Slow feedback" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 330, 520, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
