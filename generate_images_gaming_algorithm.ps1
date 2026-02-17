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

function Draw-Node {
    param($g, $text, $x, $y, $color)
    $rect = New-Object System.Drawing.Rectangle $x, $y, 300, 80
    $brush = New-Object System.Drawing.SolidBrush($color)
    $g.FillRectangle($brush, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $text $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $x, $y, 300, 80)
}

$slug = "tiktok-live-gaming-algorithm-ignored-skill-vs-hook-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 22, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

Draw-TextCentered $g "GAMING IGNORED?" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 30, 1200, 60)
Draw-TextCentered $g "WHY HIGH SKILL = LOW VIEWS" $fontSub ([System.Drawing.Brushes]::Yellow) (New-Object System.Drawing.RectangleF 0, 90, 1200, 40)

# Left: Twitch Logic (Skill)
$leftRect = New-Object System.Drawing.Rectangle 100, 160, 480, 340
$g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(40, 30, 60))), $leftRect)
$g.DrawRectangle([System.Drawing.Pens]::Purple, $leftRect)

Draw-TextCentered $g "TWITCH LOGIC" $fontLabel ([System.Drawing.Brushes]::Violet) (New-Object System.Drawing.RectangleF 100, 180, 480, 40)
Draw-TextCentered $g "High Skill Gameplay" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 100, 240, 480, 40)
Draw-TextCentered $g "Silent Focus" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 100, 290, 480, 40)
Draw-TextCentered $g "Long Buildup" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 100, 340, 480, 40)

# Right: TikTok Logic (Hook)
$rightRect = New-Object System.Drawing.Rectangle 620, 160, 480, 340
$g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(30, 40, 60))), $rightRect)
$g.DrawRectangle([System.Drawing.Pens]::Cyan, $rightRect)

Draw-TextCentered $g "TIKTOK LOGIC" $fontLabel ([System.Drawing.Brushes]::Cyan) (New-Object System.Drawing.RectangleF 620, 180, 480, 40)
Draw-TextCentered $g "Constant Commentary" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 240, 480, 40)
Draw-TextCentered $g "Visual Chaos" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 290, 480, 40)
Draw-TextCentered $g "Instant Context" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 340, 480, 40)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM ---
$bmp = New-Object System.Drawing.Bitmap 900, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)

Draw-TextCentered $g "The Context Gap: Why They Scroll" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 900, 50)

# Streamer Reality
Draw-Node $g "Streamer: 'I'm clutching!'" 50 150 ([System.Drawing.Color]::LightBlue)
Draw-Node $g "Focus: 100% on Game" 50 300 ([System.Drawing.Color]::LightGray)
Draw-Node $g "Result: Silence/Focus Face" 50 450 ([System.Drawing.Color]::LightGray)

# Viewer Reality
Draw-Node $g "Viewer: Scrolled In" 550 150 ([System.Drawing.Color]::LightSalmon)
Draw-Node $g "Sees: Guy staring at screen" 550 300 ([System.Drawing.Color]::LightCoral)
Draw-Node $g "Context: NONE (Confused)" 550 450 ([System.Drawing.Color]::LightCoral)

# Interaction
$g.DrawLine($penArrow, 350, 190, 550, 190)
Draw-TextCentered $g "Algorithm Match?" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 350, 150, 200, 40)

# The Gap
$gapRect = New-Object System.Drawing.Rectangle 200, 600, 500, 100
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $gapRect)
$g.DrawRectangle([System.Drawing.Pens]::Red, $gapRect)
Draw-TextCentered $g "THE CONTEXT GAP" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 200, 610, 500, 40)
Draw-TextCentered $g "Viewer leaves in < 1 second" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 200, 650, 500, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 3-Second Priority Pyramid" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Pyramid Triangle
$points = @(
    (New-Object System.Drawing.Point 500, 100),
    (New-Object System.Drawing.Point 200, 700),
    (New-Object System.Drawing.Point 800, 700)
)
$g.FillPolygon([System.Drawing.Brushes]::WhiteSmoke, $points)
$g.DrawPolygon([System.Drawing.Pens]::Black, $points)

# Layers
$g.DrawLine([System.Drawing.Pens]::Black, 400, 300, 600, 300)
$g.DrawLine([System.Drawing.Pens]::Black, 300, 500, 700, 500)

Draw-TextCentered $g "HOOK (Visual/Audio)" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 400, 200, 200, 40)
Draw-TextCentered $g "CONTEXT (What is happening?)" $fontLabel ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 300, 400, 400, 40)
Draw-TextCentered $g "GAMEPLAY SKILL (The actual game)" $fontLabel ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 200, 600, 600, 40)

# Annotations
Draw-TextCentered $g "Algorithm Priority: HIGH" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 650, 200, 300, 40)
Draw-TextCentered $g "Algorithm Priority: LOW" $fontLabel ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 650, 600, 300, 40)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
