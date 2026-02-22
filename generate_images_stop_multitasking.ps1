
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

$slug = "stop-multitasking-stream-retention-myth-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Myth of Multitasking ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

# Backgrounds
$leftRect = New-Object System.Drawing.Rectangle 0, 0, 600, 600
$rightRect = New-Object System.Drawing.Rectangle 600, 0, 600, 600
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, $leftRect)
$g.FillRectangle([System.Drawing.Brushes]::Honeydew, $rightRect)

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Left: Multitasking (Chaos)
Draw-TextCentered $g "MULTITASKING" $fontTitle ([System.Drawing.Brushes]::DarkRed) (New-Object System.Drawing.RectangleF 0, 50, 600, 100)
Draw-TextCentered $g "(The 'Dual-Failure' State)" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 120, 600, 50)

# Chaotic Lines
$penChaos = New-Object System.Drawing.Pen([System.Drawing.Color]::Red, 3)
for ($i = 0; $i -lt 10; $i++) {
    $g.DrawLine($penChaos, 100, 300, 500, (200 + ($i * 20)))
    $g.DrawLine($penChaos, 100, (200 + ($i * 20)), 500, 400)
}
Draw-TextCentered $g "Bad Gameplay + Missed Chat" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 100, 450, 400, 50)

# Right: Phasing (Order)
Draw-TextCentered $g "PHASE SWITCHING" $fontTitle ([System.Drawing.Brushes]::DarkGreen) (New-Object System.Drawing.RectangleF 600, 50, 600, 100)
Draw-TextCentered $g "(The 'Queue' Method)" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 600, 120, 600, 50)

# Ordered Blocks
$g.FillRectangle([System.Drawing.Brushes]::DarkBlue, 750, 250, 300, 80)
Draw-TextCentered $g "GAME FOCUS (3 min)" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 750, 250, 300, 80)

$g.FillRectangle([System.Drawing.Brushes]::DarkOrange, 750, 350, 300, 80)
Draw-TextCentered $g "CHAT BURST (1 min)" $fontLabel ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 750, 350, 300, 80)

# VS
Draw-TextCentered $g "VS" $fontTitle ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 500, 250, 200, 200)

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: Cognitive Switching Cost ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The Cognitive Cost of 'Half-Focus'" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# Axes
$g.DrawLine([System.Drawing.Pens]::Black, 100, 700, 900, 700) # X
$g.DrawLine([System.Drawing.Pens]::Black, 100, 700, 100, 100) # Y

Draw-TextCentered $g "Performance Quality (%)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 350, 80, 40)
Draw-TextCentered $g "Task Strategy" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 720, 200, 40)

# Bar 1: Pure Game
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 150, 200, 150, 500)
Draw-TextCentered $g "100% Game" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 150, 160, 150, 40)

# Bar 2: Pure Chat
$g.FillRectangle([System.Drawing.Brushes]::Orange, 700, 200, 150, 500)
Draw-TextCentered $g "100% Chat" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 700, 160, 150, 40)

# Bar 3: Multitasking (The Drop)
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 400, 500, 200, 200)
Draw-TextCentered $g "Simultaneous" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 400, 450, 200, 40)
Draw-TextCentered $g "(40% Game / 40% Chat)" $fontSub ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 400, 550, 200, 40)

# Switching Cost Overlay
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Red, 5)
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, 500, 200, 500, 480)
Draw-TextCentered $g "Switching Tax (-20%)" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 400, 300, 200, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: The Verbal Toggle System ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The Verbal Toggle: Queuing Viewer Expectations" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$boxW = 250
$boxH = 150
$y = 250

# Step 1: Lock In
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 100, $y, $boxW, $boxH)
Draw-TextCentered $g "1. LOCK IN" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, $y, $boxW, 50)
Draw-TextCentered $g "'Watch this play...'" $fontSub ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 100, ($y+50), $boxW, 50)
Draw-TextCentered $g "(Signal: I am ignoring chat)" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 100, ($y+100), $boxW, 40)

# Step 2: The Queue
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 375, $y, $boxW, $boxH)
Draw-TextCentered $g "2. THE QUEUE" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 375, $y, $boxW, 50)
Draw-TextCentered $g "Viewers Chatting..." $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 375, ($y+50), $boxW, 50)
Draw-TextCentered $g "(They know you will read it)" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 375, ($y+100), $boxW, 40)

# Step 3: Burst Reply
$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 650, $y, $boxW, $boxH)
Draw-TextCentered $g "3. BURST REPLY" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 650, $y, $boxW, 50)
Draw-TextCentered $g "'Okay, catching up...'" $fontSub ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 650, ($y+50), $boxW, 50)
Draw-TextCentered $g "(Signal: I am ignoring game)" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 650, ($y+100), $boxW, 40)

# Arrows
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, 350, $y+75, 375, $y+75)
$g.DrawLine($penArrow, 625, $y+75, 650, $y+75)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
