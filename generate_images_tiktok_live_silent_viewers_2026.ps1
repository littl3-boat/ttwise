
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

$slug = "tiktok-live-silent-viewers-engagement-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Ghost Town vs The Party ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(245, 245, 250))

# Left: Ghost Town
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 0, 0, 600, 600)
$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
Draw-TextCentered $g "500 Viewers" $fontTitle ([System.Drawing.Brushes]::DarkGray) (New-Object System.Drawing.RectangleF 0, 200, 600, 100)
Draw-TextCentered $g "(Zero Chat)" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 300, 600, 50)

# Right: The Party
$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 600, 0, 600, 600)
Draw-TextCentered $g "ACTIVE CHAT" $fontTitle ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 600, 200, 600, 100)
Draw-TextCentered $g "(Interaction Hooks)" (New-Object System.Drawing.Font("Arial", 20)) ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 300, 600, 50)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM: The Interaction Friction Ladder ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Step 1: Open Question (High Friction)
Draw-Rect $g ([System.Drawing.Brushes]::MistyRose) (New-Object System.Drawing.Rectangle 100, 100, 600, 150)
Draw-TextCentered $g "HIGH FRICTION: Open Questions" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 110, 600, 40)
Draw-TextCentered $g "'How is everyone doing?'" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 600, 30)
Draw-TextCentered $g "Result: Silence (Too much effort to type)" $fontSmall ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 100, 200, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 260),
    (New-Object System.Drawing.Point 380, 280),
    (New-Object System.Drawing.Point 420, 280)
))

# Step 2: Binary Choice (Medium Friction)
Draw-Rect $g ([System.Drawing.Brushes]::LightYellow) (New-Object System.Drawing.Rectangle 100, 300, 600, 150)
Draw-TextCentered $g "MEDIUM FRICTION: Binary Choice" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 310, 600, 40)
Draw-TextCentered $g "'Should I go Left or Right?'" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 360, 600, 30)
Draw-TextCentered $g "Result: Some replies (Requires 1 word)" $fontSmall ([System.Drawing.Brushes]::DarkOrange) (New-Object System.Drawing.RectangleF 100, 400, 600, 30)

# Arrow
$g.FillPolygon([System.Drawing.Brushes]::Black, @(
    (New-Object System.Drawing.Point 400, 460),
    (New-Object System.Drawing.Point 380, 480),
    (New-Object System.Drawing.Point 420, 480)
))

# Step 3: Numeric/Emoji Vote (Low Friction)
Draw-Rect $g ([System.Drawing.Brushes]::LightBlue) (New-Object System.Drawing.Rectangle 100, 500, 600, 150)
Draw-TextCentered $g "LOW FRICTION: Numeric Vote" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 510, 600, 40)
Draw-TextCentered $g "'Type 1 for Yes, 2 for No'" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 560, 600, 30)
Draw-TextCentered $g "Result: Spam (Requires 1 character)" $fontSmall ([System.Drawing.Brushes]::DarkBlue) (New-Object System.Drawing.RectangleF 100, 600, 600, 30)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN: The Passive Scroller ---
$bmp = New-Object System.Drawing.Bitmap 1200, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Background Context
Draw-TextCentered $g "THE PASSIVE SCROLLER MINDSET" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 50, 1200, 60)

# Left: TV Mode
$g.FillEllipse([System.Drawing.Brushes]::LightGray, 200, 200, 200, 200)
Draw-TextCentered $g "TV Mode" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 200, 280, 200, 40)
Draw-TextCentered $g "Leaning Back" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 200, 320, 200, 30)

# Arrow
$penArrow = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black), 5
$g.DrawLine($penArrow, 450, 300, 750, 300)
Draw-TextCentered $g "Needs a TRIGGER" $fontSmall ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 450, 250, 300, 40)

# Right: Active Mode
$g.FillEllipse([System.Drawing.Brushes]::LightGreen, 800, 200, 200, 200)
Draw-TextCentered $g "Active Mode" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 280, 200, 40)
Draw-TextCentered $g "Typing / Gifting" $fontSmall ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 800, 320, 200, 30)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
