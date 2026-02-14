
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

# --- Common Settings ---
$width = 1200
$height = 630
$slug = "tiktok-live-viewers-no-chat-interaction-2026"
$outDir = "public/static/images/$slug"

# Ensure directory exists
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

# --- 1. Banner Image ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 30)) # Dark bg

# Visual: Split screen. Left: High view count (Green). Right: Dead Chat (Red/Grey).
# Left side
$brushGreen = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(40, 60, 40))
$g.FillRectangle($brushGreen, 0, 0, 600, 630)

# Right side
$brushRed = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(60, 40, 40))
$g.FillRectangle($brushRed, 600, 0, 600, 630)

# Text
$fontTitle = New-Object System.Drawing.Font("Arial", 48, [System.Drawing.FontStyle]::Bold)
$fontSub = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
$brushWhite = [System.Drawing.Brushes]::White
$brushGray = [System.Drawing.Brushes]::LightGray

Draw-TextCentered $g "2.4k Views" $fontTitle $brushWhite (New-Object System.Drawing.RectangleF 0, 200, 600, 100)
Draw-TextCentered $g "(The Scroll Metric)" $fontSub $brushGray (New-Object System.Drawing.RectangleF 0, 300, 600, 50)

Draw-TextCentered $g "0 Chat Messages" $fontTitle $brushWhite (New-Object System.Drawing.RectangleF 600, 200, 600, 100)
Draw-TextCentered $g "(The Reality)" $fontSub $brushGray (New-Object System.Drawing.RectangleF 600, 300, 600, 50)

# Bottom Title
$rectTitle = New-Object System.Drawing.RectangleF 0, 500, 1200, 100
Draw-TextCentered $g "Why TikTok Viewers Don't Talk" $fontSub $brushWhite $rectTitle

$bmp.Save("$outDir/$slug-banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- 2. Diagram: The FYP Interruption Model ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)

$penBlack = New-Object System.Drawing.Pen([System.Drawing.Color]::Black), 3
$fontNode = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$brushNode = [System.Drawing.Brushes]::White
$brushText = [System.Drawing.Brushes]::Black

# Draw flow: Twitch (Destination) vs TikTok (Interruption)

# Header
Draw-TextCentered $g "Twitch vs TikTok: The Viewer Mindset Gap" $fontNode $brushText (New-Object System.Drawing.RectangleF 0, 20, 1200, 50)

# Left: Twitch
$g.FillRectangle([System.Drawing.Brushes]::BlueViolet, 100, 100, 400, 400)
Draw-TextCentered $g "TWITCH" $fontNode $brushNode (New-Object System.Drawing.RectangleF 100, 110, 400, 40)
Draw-TextCentered $g "Viewer INTENDS to watch" $fontNode $brushNode (New-Object System.Drawing.RectangleF 100, 200, 400, 40)
Draw-TextCentered $g "Click = Investment" $fontNode $brushNode (New-Object System.Drawing.RectangleF 100, 250, 400, 40)
Draw-TextCentered $g "Chat = Participation" $fontNode $brushNode (New-Object System.Drawing.RectangleF 100, 300, 400, 40)

# Right: TikTok
$g.FillRectangle([System.Drawing.Brushes]::Black, 700, 100, 400, 400)
Draw-TextCentered $g "TIKTOK LIVE" $fontNode $brushNode (New-Object System.Drawing.RectangleF 700, 110, 400, 40)
Draw-TextCentered $g "Viewer is SCROLLING past" $fontNode $brushNode (New-Object System.Drawing.RectangleF 700, 200, 400, 40)
Draw-TextCentered $g "View = Accident (0.5s)" $fontNode $brushNode (New-Object System.Drawing.RectangleF 700, 250, 400, 40)
Draw-TextCentered $g "Chat = Effort" $fontNode $brushNode (New-Object System.Drawing.RectangleF 700, 300, 400, 40)

$bmp.Save("$outDir/$slug-diagram-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

# --- 3. Explain: The 3-Second Hook Rule ---
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::WhiteSmoke)

Draw-TextCentered $g "The 3-Second 'Stop the Scroll' Test" $fontTitle $brushText (New-Object System.Drawing.RectangleF 0, 50, 1200, 100)

# Three panels
# 1. Silent Gameplay (Fail)
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 100, 200, 300, 300)
Draw-TextCentered $g "Silent Gameplay" $fontNode $brushText (New-Object System.Drawing.RectangleF 100, 220, 300, 50)
Draw-TextCentered $g "RESULT: SKIP" $fontTitle [System.Drawing.Brushes]::Red (New-Object System.Drawing.RectangleF 100, 350, 300, 100)

# 2. Looking at Chat (Fail)
$g.FillRectangle([System.Drawing.Brushes]::LightGray, 450, 200, 300, 300)
Draw-TextCentered $g "Reading Silent Chat" $fontNode $brushText (New-Object System.Drawing.RectangleF 450, 220, 300, 50)
Draw-TextCentered $g "RESULT: SKIP" $fontTitle [System.Drawing.Brushes]::Red (New-Object System.Drawing.RectangleF 450, 350, 300, 100)

# 3. Talking to Camera (Pass)
$g.FillRectangle([System.Drawing.Brushes]::LightGreen, 800, 200, 300, 300)
Draw-TextCentered $g "Direct Eye Contact" $fontNode $brushText (New-Object System.Drawing.RectangleF 800, 220, 300, 50)
Draw-TextCentered $g "RESULT: STAY" $fontTitle [System.Drawing.Brushes]::DarkGreen (New-Object System.Drawing.RectangleF 800, 350, 300, 100)

$bmp.Save("$outDir/$slug-explain-1.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
$g.Dispose()

Write-Host "Images generated in $outDir"
