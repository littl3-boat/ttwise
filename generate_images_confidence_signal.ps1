
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

$slug = "tiktok-live-confidence-signal-vs-noise-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Draw Title
Draw-TextCentered $g "CONFIDENCE DROPPING?" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 30, 1200, 60)
Draw-TextCentered $g "SIGNAL vs NOISE (2026)" $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 90, 1200, 40)

# Left Panel: NOISE (Volatile)
$leftRect = New-Object System.Drawing.Rectangle 100, 150, 450, 350
$brushBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(40, 40, 50))
$g.FillRectangle($brushBg, $leftRect)
$g.DrawRectangle([System.Drawing.Pens]::Gray, $leftRect)

Draw-TextCentered $g "NOISE (3 Days)" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 100, 160, 450, 40)

# Draw jagged line for noise
$pointsNoise = @(
    (New-Object System.Drawing.Point 120, 400),
    (New-Object System.Drawing.Point 180, 250),
    (New-Object System.Drawing.Point 240, 450),
    (New-Object System.Drawing.Point 300, 300),
    (New-Object System.Drawing.Point 360, 420),
    (New-Object System.Drawing.Point 420, 200),
    (New-Object System.Drawing.Point 480, 380)
)
$penNoise = New-Object System.Drawing.Pen([System.Drawing.Color]::Red, 3)
$g.DrawLines($penNoise, $pointsNoise)

# Right Panel: SIGNAL (Trend)
$rightRect = New-Object System.Drawing.Rectangle 650, 150, 450, 350
$g.FillRectangle($brushBg, $rightRect)
$g.DrawRectangle([System.Drawing.Pens]::Gray, $rightRect)

Draw-TextCentered $g "SIGNAL (30 Days)" $fontLabel ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 650, 160, 450, 40)

# Draw smooth trend line
$pointsSignal = @(
    (New-Object System.Drawing.Point 670, 420),
    (New-Object System.Drawing.Point 750, 400),
    (New-Object System.Drawing.Point 830, 380),
    (New-Object System.Drawing.Point 910, 350),
    (New-Object System.Drawing.Point 990, 300),
    (New-Object System.Drawing.Point 1070, 250)
)
$penSignal = New-Object System.Drawing.Pen([System.Drawing.Color]::LightGreen, 4)
$g.DrawLines($penSignal, $pointsSignal)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM ---
$bmp = New-Object System.Drawing.Bitmap 900, 1000
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

Draw-TextCentered $g "Panic vs Process: The Drop" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 900, 50)

# Start
Draw-Node $g "Views Drop Suddenly" 300 100 ([System.Drawing.Color]::LightSalmon)
$g.DrawLine($penArrow, 450, 180, 450, 240)

# Branch 1
Draw-Node $g "Tech Check (OBS/Net)" 300 240 ([System.Drawing.Color]::LightBlue)
$g.DrawLine($penArrow, 450, 320, 450, 380)

# Branch 2
Draw-Node $g "Content Check (Hook)" 300 380 ([System.Drawing.Color]::LightYellow)
$g.DrawLine($penArrow, 450, 460, 450, 520)

# Branch 3
Draw-Node $g "Context (Holidays/Algo)" 300 520 ([System.Drawing.Color]::LightGray)
$g.DrawLine($penArrow, 450, 600, 300, 680) # Left path
$g.DrawLine($penArrow, 450, 600, 600, 680) # Right path

# Outcomes
Draw-Node $g "PANIC (Change Everything)" 50 680 ([System.Drawing.Color]::LightCoral)
Draw-Node $g "PATIENCE (Hold Course)" 550 680 ([System.Drawing.Color]::LightGreen)

# Results
$g.DrawLine($penArrow, 200, 760, 200, 820)
$g.DrawLine($penArrow, 700, 760, 700, 820)

Draw-Node $g "Algo Confusion (Bad)" 50 820 ([System.Drawing.Color]::Red)
Draw-Node $g "Data Stabilization (Good)" 550 820 ([System.Drawing.Color]::LightGreen)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 30-Day Rule Visualization" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Draw Calendar Grid
$startX = 100
$startY = 100
$cellSize = 100
$cols = 7
$rows = 5

for ($r = 0; $r -lt $rows; $r++) {
    for ($c = 0; $c -lt $cols; $c++) {
        if (($r * $cols + $c) -ge 30) { break }
        
        $x = $startX + ($c * $cellSize)
        $y = $startY + ($r * $cellSize)
        $rect = New-Object System.Drawing.Rectangle $x, $y, $cellSize, $cellSize
        
        # Randomly color days
        $rand = Get-Random -Minimum 0 -Maximum 10
        $brush = [System.Drawing.Brushes]::WhiteSmoke
        $status = ""
        
        if ($rand -lt 2) { 
            $brush = [System.Drawing.Brushes]::LightCoral # Bad day
            $status = "LOW"
        } elseif ($rand -gt 7) {
            $brush = [System.Drawing.Brushes]::LightGreen # Good day
            $status = "HIGH"
        } else {
            $status = "AVG"
        }
        
        $g.FillRectangle($brush, $rect)
        $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
        
        # Day Number
        $dayNum = ($r * $cols + $c + 1).ToString()
        $g.DrawString($dayNum, $fontNode, [System.Drawing.Brushes]::Black, $x + 5, $y + 5)
        
        # Status
        $g.DrawString($status, [System.Drawing.Font]::new("Arial", 10), [System.Drawing.Brushes]::Gray, $x + 20, $y + 40)
    }
}

Draw-TextCentered $g "Red Days are NOISE. The Month is SIGNAL." $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 700, 1000, 50)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
