
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

# --- Common Settings ---
$width = 1200
$height = 630
$slug = "tiktok-live-chat-delayed-missing-bug-fix-2026"
$outDir = "public/static/images/$slug"

# Ensure directory exists
if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

# --- 1. Banner Image ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 30))

$fontTitle = New-Object System.Drawing.Font("Arial", 48, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
$brushWhite = [System.Drawing.Brushes]::White
$brushGray = [System.Drawing.Brushes]::LightGray

# Left Side (Streamer)
$rectLeft = New-Object System.Drawing.Rectangle 50, 100, 500, 400
$g.FillRectangle([System.Drawing.Brushes]::Black, $rectLeft)
$g.DrawRectangle([System.Drawing.Pens]::Red, $rectLeft)
Draw-TextCentered $g "YOUR SCREEN" $fontSub $brushWhite (New-Object System.Drawing.RectangleF 50, 120, 500, 50)
Draw-TextCentered $g "(Silence...)" $fontTitle $brushGray (New-Object System.Drawing.RectangleF 50, 250, 500, 100)

# Right Side (Viewer)
$rectRight = New-Object System.Drawing.Rectangle 650, 100, 500, 400
$g.FillRectangle([System.Drawing.Brushes]::Black, $rectRight)
$g.DrawRectangle([System.Drawing.Pens]::Green, $rectRight)
Draw-TextCentered $g "REALITY" $fontSub $brushWhite (New-Object System.Drawing.RectangleF 650, 120, 500, 50)
Draw-TextCentered $g "Chat is Active!" $fontSub ([System.Drawing.Brushes]::LightGreen) (New-Object System.Drawing.RectangleF 650, 250, 500, 100)

Draw-TextCentered $g "CHAT DELAYED OR MISSING?" $fontTitle $brushWhite (New-Object System.Drawing.RectangleF 0, 20, 1200, 80)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- 2. Diagram ---
$bmp = New-Object System.Drawing.Bitmap 800, 1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontBox = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Regular)
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)

# Helper for boxes
function Draw-Node {
    param($g, $text, $x, $y, $color)
    $rect = New-Object System.Drawing.Rectangle $x, $y, 300, 80
    $brush = New-Object System.Drawing.SolidBrush($color)
    $g.FillRectangle($brush, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $text $fontBox ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF $x, $y, 300, 80)
}

Draw-Node $g "Viewer Types 'Hello'" 250 50 ([System.Drawing.Color]::LightBlue)
$g.DrawLine($penArrow, 400, 130, 400, 180)

Draw-Node $g "TikTok Server" 250 180 ([System.Drawing.Color]::LightGray)
$g.DrawLine($penArrow, 400, 260, 400, 310)

# Fork
$g.DrawLine($penArrow, 400, 310, 200, 350)
$g.DrawLine($penArrow, 400, 310, 600, 350)

# Path A (Filtered)
Draw-Node $g "Shadowban / Filter" 50 350 ([System.Drawing.Color]::MistyRose)
$g.DrawLine($penArrow, 200, 430, 200, 480)
Draw-Node $g "HIDDEN from Streamer" 50 480 ([System.Drawing.Color]::Red)

# Path B (Latency)
Draw-Node $g "Normal Processing" 450 350 ([System.Drawing.Color]::LightGreen)
$g.DrawLine($penArrow, 600, 430, 600, 480)
Draw-Node $g "Network Latency" 450 480 ([System.Drawing.Color]::Yellow)
$g.DrawLine($penArrow, 600, 560, 600, 610)
Draw-Node $g "Streamer Sees It (Late)" 450 610 ([System.Drawing.Color]::LightGreen)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- 3. Explain ---
$bmp = New-Object System.Drawing.Bitmap 800, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$fontHead = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
   Draw-TextCentered $g "Latency vs Visibility Checklist" $fontHead ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 800, 60)

   $y = 100
$rows = @("1. Web Studio: FASTEST (Real-time)", "2. Mobile App: FILTERED (AI hides 'spam')", "3. OBS Dock: UNRELIABLE (Disconnects)", "4. Stream Delay: +15s (You are in future)")

foreach ($row in $rows) {
    $rect = New-Object System.Drawing.Rectangle 50, $y, 700, 80
    $g.FillRectangle([System.Drawing.Brushes]::WhiteSmoke, $rect)
    $g.DrawRectangle([System.Drawing.Pens]::Black, $rect)
    Draw-TextCentered $g $row $fontBox ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 50, $y, 700, 80)
    $y += 100
}

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
