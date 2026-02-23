
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

$slug = "tiktok-video-followers-ignore-live-format-barrier-2026"
$outDir = "public/static/images/$slug"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

$width = 1200
$height = 600

# --- BANNER: The Format Barrier ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))

# Split Background
$g.FillRectangle([System.Drawing.Brushes]::Black, 0, 0, 580, 600) # Video World
$g.FillRectangle([System.Drawing.Brushes]::Black, 620, 0, 580, 600) # Live World

# The Barrier
$g.FillRectangle([System.Drawing.Brushes]::Red, 580, 0, 40, 600)

$fontTitle = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)

# Left: Viral Video
Draw-TextCentered $g "VIRAL VIDEO" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 0, 100, 580, 100)
Draw-TextCentered $g "100k Views" $fontSub ([System.Drawing.Brushes]::LightGray) (New-Object System.Drawing.RectangleF 0, 200, 580, 50)
Draw-TextCentered $g "(Scroll Mode)" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 0, 300, 580, 50)

# Right: Empty Live
Draw-TextCentered $g "YOUR LIVE" $fontTitle ([System.Drawing.Brushes]::White) (New-Object System.Drawing.RectangleF 620, 100, 580, 100)
Draw-TextCentered $g "5 Viewers" $fontSub ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 620, 200, 580, 50)
Draw-TextCentered $g "(Real-Time Mode)" $fontLabel ([System.Drawing.Brushes]::Gray) (New-Object System.Drawing.RectangleF 620, 300, 580, 50)

# Barrier Label
$stringFormat = New-Object System.Drawing.StringFormat
$stringFormat.Alignment = [System.Drawing.StringAlignment]::Center
$stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Center
$g.TranslateTransform(600, 300)
$g.RotateTransform(-90)
$g.DrawString("FORMAT BARRIER", $fontSub, [System.Drawing.Brushes]::White, 0, 0, $stringFormat)
$g.ResetTransform()

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- DIAGRAM 1: The Two Algorithms ---
$bmp = New-Object System.Drawing.Bitmap 1000, 800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "Why They Don't Cross Over: The Two Algorithms" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

# VOD Algorithm
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 100, 150, 350, 500)
Draw-TextCentered $g "VOD Algorithm" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 160, 350, 50)
Draw-TextCentered $g "Optimizes For:" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 250, 350, 40)
Draw-TextCentered $g "- Watch Time" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 300, 350, 40)
Draw-TextCentered $g "- Completion Rate" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 350, 350, 40)
Draw-TextCentered $g "- Shares" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, 400, 350, 40)

# Live Algorithm
$g.FillRectangle([System.Drawing.Brushes]::MistyRose, 550, 150, 350, 500)
Draw-TextCentered $g "LIVE Algorithm" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 160, 350, 50)
Draw-TextCentered $g "Optimizes For:" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 250, 350, 40)
Draw-TextCentered $g "- Real-Time Engagement" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 300, 350, 40)
Draw-TextCentered $g "- Coin Spend" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 350, 350, 40)
Draw-TextCentered $g "- Retention (>1min)" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 550, 400, 350, 40)

# The Gap
$penDashed = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)
$penDashed.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
$g.DrawLine($penDashed, 500, 150, 500, 650)
Draw-TextCentered $g "NO DATA SHARING" $fontLabel ([System.Drawing.Brushes]::Red) (New-Object System.Drawing.RectangleF 400, 350, 200, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- EXPLAIN 1: The Bridge Strategy ---
$bmp = New-Object System.Drawing.Bitmap 1000, 600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

Draw-TextCentered $g "The 'Bridge' Strategy: Moving Followers to Live" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 0, 20, 1000, 50)

$boxW = 250
$boxH = 150
$y = 250

# Step 1: Hook
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 100, $y, $boxW, $boxH)
Draw-TextCentered $g "1. THE HOOK" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, $y, $boxW, 50)
Draw-TextCentered $g "Post Video 1hr Before" $fontSub ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 100, ($y+50), $boxW, 50)

# Step 2: The Promise
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 375, $y, $boxW, $boxH)
Draw-TextCentered $g "2. THE PROMISE" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 375, $y, $boxW, 50)
Draw-TextCentered $g "'I will do X on Live'" $fontSub ([System.Drawing.Brushes]::Blue) (New-Object System.Drawing.RectangleF 375, ($y+50), $boxW, 50)

# Step 3: The Event
$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 650, $y, $boxW, $boxH)
Draw-TextCentered $g "3. THE EVENT" $fontLabel ([System.Drawing.Brushes]::Black) (New-Object System.Drawing.RectangleF 650, $y, $boxW, 50)
Draw-TextCentered $g "Use 'Live Event' Link" $fontSub ([System.Drawing.Brushes]::Green) (New-Object System.Drawing.RectangleF 650, ($y+50), $boxW, 50)

# Arrows
$penArrow = New-Object System.Drawing.Pen([System.Drawing.Color]::Black, 3)
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, 350, $y+75, 375, $y+75)
$g.DrawLine($penArrow, 625, $y+75, 650, $y+75)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Done"
