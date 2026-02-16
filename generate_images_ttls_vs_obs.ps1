
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

$slug = "tiktok-live-studio-vs-obs-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))

$fontTitle = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Title
Draw-TextCentered $g "TIKTOK LIVE STUDIO vs OBS" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 30, 1200, 60)
Draw-TextCentered $g "THE 2026 REALITY CHECK" $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 90, 1200, 40)

# Left Side: TTLS (Easy but Trap)
$leftRect = New-Object System.Drawing.Rectangle 100, 160, 480, 360
$brushBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(40, 40, 50))
$g.FillRectangle($brushBg, $leftRect)
$g.DrawRectangle([System.Drawing.Pens]::Gray, $leftRect)

Draw-TextCentered $g "TIKTOK LIVE STUDIO" $fontLabel ([System.Drawing.Brushes]::Cyan) (New-Object System.Drawing.RectangleF 100, 180, 480, 40)
Draw-TextCentered $g "✅ Instant Setup" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 100, 240, 480, 40)
Draw-TextCentered $g "⚠️ High CPU Usage" $fontLabel ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 100, 300, 480, 40)
Draw-TextCentered $g "❌ Platform Lock-in" $fontLabel ([System.Drawing.Brushes]::LightCoral) (New-Object System.Drawing.RectangleF 100, 360, 480, 40)

# Right Side: OBS (Hard but Pro)
$rightRect = New-Object System.Drawing.Rectangle 620, 160, 480, 360
$g.FillRectangle($brushBg, $rightRect)
$g.DrawRectangle([System.Drawing.Pens]::Gray, $rightRect)

Draw-TextCentered $g "OBS STUDIO" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 180, 480, 40)
Draw-TextCentered $g "✅ Full Control" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 240, 480, 40)
Draw-TextCentered $g "✅ Multi-Stream" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 620, 300, 480, 40)
Draw-TextCentered $g "⚠️ Learning Curve" $fontLabel ([System.Drawing.Brushes]::Orange) (New-Object System.Drawing.RectangleF 620, 360, 480, 40)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM (Decision Tree) ---
$bmp = New-Object System.Drawing.Bitmap 900, 1100
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontNode = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)

function Draw-Node {
    param($g, $text, $x, $y, $color)
    $rect = New-Object System.Drawing.Rectangle $x, $y, 300, 80
    $brush = New-Object System.Drawing.SolidBrush($color)
    $g.FillRectangle($brush, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $text $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $x, $y, 300, 80)
}

Draw-TextCentered $g "Which Software Should You Use?" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 900, 50)

# Start
Draw-Node $g "Do you have a Stream Key?" 300 100 ([System.Drawing.Color]::LightGray)

# Branch Yes/No
$g.DrawLine($penArrow, 450, 180, 200, 240) # No
$g.DrawLine($penArrow, 450, 180, 700, 240) # Yes

# Left Branch (No Stream Key)
Draw-Node $g "NO" 50 240 ([System.Drawing.Color]::LightCoral)
$g.DrawLine($penArrow, 200, 320, 200, 380)
Draw-Node $g "Are you a Gaming PC Pro?" 50 380 ([System.Drawing.Color]::LightBlue)

$g.DrawLine($penArrow, 200, 460, 100, 520) # No
$g.DrawLine($penArrow, 200, 460, 300, 520) # Yes

Draw-Node $g "Use TT Live Studio" 0 520 ([System.Drawing.Color]::Cyan)
Draw-Node $g "TTLS + Dual PC" 200 520 ([System.Drawing.Color]::Cyan)

# Right Branch (Yes Stream Key)
Draw-Node $g "YES" 550 240 ([System.Drawing.Color]::LightGreen)
$g.DrawLine($penArrow, 700, 320, 700, 380)
Draw-Node $g "Do you want to Multi-Stream?" 550 380 ([System.Drawing.Color]::LightBlue)

$g.DrawLine($penArrow, 700, 460, 600, 520) # No
$g.DrawLine($penArrow, 700, 460, 800, 520) # Yes

Draw-Node $g "Use OBS (Vertical)" 450 520 ([System.Drawing.Color]::LightGreen)
Draw-Node $g "Use OBS (Multi)" 750 520 ([System.Drawing.Color]::LightGreen)

# Conclusion Box
$conclusionRect = New-Object System.Drawing.Rectangle 100, 700, 700, 150
$g.FillRectangle([System.Drawing.Brushes]::WhiteSmoke, $conclusionRect)
$g.DrawRectangle([System.Drawing.Pens]::Black, $conclusionRect)
Draw-TextCentered $g "THE TRAP: TT Live Studio is easier to START," $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 710, 700, 40)
Draw-TextCentered $g "but harder to GROW (no multi-stream, high CPU)." $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 760, 700, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN (Feature Matrix) ---
$bmp = New-Object System.Drawing.Bitmap 1000, 900
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "Feature Comparison Matrix (2026)" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 30, 1000, 50)

$headerY = 100
$rowHeight = 80
$col1X = 50
$col2X = 350
$col3X = 675
$widthCol1 = 300
$widthCol2 = 300
$widthCol3 = 300

# Headers
$g.FillRectangle([System.Drawing.Brushes]::Black, $col1X, $headerY, $widthCol1, $rowHeight)
$g.FillRectangle([System.Drawing.Brushes]::Cyan, $col2X, $headerY, $widthCol2, $rowHeight)
$g.FillRectangle([System.Drawing.Brushes]::DimGray, $col3X, $headerY, $widthCol3, $rowHeight)

Draw-TextCentered $g "FEATURE" $fontNode ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF $col1X, $headerY, $widthCol1, $rowHeight)
Draw-TextCentered $g "TT LIVE STUDIO" $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col2X, $headerY, $widthCol2, $rowHeight)
Draw-TextCentered $g "OBS STUDIO" $fontNode ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF $col3X, $headerY, $widthCol3, $rowHeight)

# Rows
$data = @(
    @("CPU Usage", "HIGH (Unoptimized)", "LOW (Efficient)"),
    @("Multi-Stream", "IMPOSSIBLE", "NATIVE"),
    @("Plugins", "LIMITED", "UNLIMITED"),
    @("Ease of Use", "VERY EASY", "MEDIUM/HARD"),
    @("Reliability", "CRASH PRONE", "ROCK SOLID"),
    @("Stream Key", "NOT NEEDED", "REQUIRED")
)

$currentY = $headerY + $rowHeight

foreach ($row in $data) {
    # Col 1
    $g.FillRectangle([System.Drawing.Brushes]::LightGray, $col1X, $currentY, $widthCol1, $rowHeight)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $col1X, $currentY, $widthCol1, $rowHeight)
    Draw-TextCentered $g $row[0] $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col1X, $currentY, $widthCol1, $rowHeight)
    
    # Col 2
    $g.FillRectangle([System.Drawing.Brushes]::White, $col2X, $currentY, $widthCol2, $rowHeight)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $col2X, $currentY, $widthCol2, $rowHeight)
    Draw-TextCentered $g $row[1] $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col2X, $currentY, $widthCol2, $rowHeight)
    
    # Col 3
    $g.FillRectangle([System.Drawing.Brushes]::White, $col3X, $currentY, $widthCol3, $rowHeight)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $col3X, $currentY, $widthCol3, $rowHeight)
    Draw-TextCentered $g $row[2] $fontNode ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $col3X, $currentY, $widthCol3, $rowHeight)
    
    $currentY += $rowHeight
}

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
