Add-Type -AssemblyName System.Drawing

$slug = "tiktok-live-gaming-overwhelm-single-monitor-fix-2026"
$dir = "public\static\images\$slug"
# Ensure dir exists (already done, but safe to keep)
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }

# --- 1. Banner Image ---
$bannerPath = Join-Path $dir "${slug}-banner.png"
$bmp = New-Object System.Drawing.Bitmap 1200,600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.Clear([System.Drawing.Color]::Black)

# Background Split
$g.FillRectangle((New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255,40,20,20))), 0, 0, 600, 600) # Reddish Left
$g.FillRectangle((New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255,20,40,30))), 600, 0, 600, 600) # Greenish Right

# Left: Chaos
$fontBig = New-Object System.Drawing.Font("Arial", 40, [System.Drawing.FontStyle]::Bold)
$fontMed = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$brushWhite = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$brushGray = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::Gray)

$g.DrawString("ALT-TAB", $fontBig, $brushGray, 100, 150)
$g.DrawString("PANIC", $fontBig, (New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::Red)), 150, 220)
$g.DrawString("MISSED CHAT", $fontMed, $brushGray, 120, 300)

# Right: Control
$g.DrawString("FOCUSED", $fontBig, (New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::LightGreen)), 700, 150)
$g.DrawString("NO TABBING", $fontMed, $brushWhite, 720, 230)
$g.DrawString("PHONE FOR CHAT", $fontMed, (New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::Yellow)), 720, 280)

# Title Overlay
$g.FillRectangle((New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(200,0,0,0))), 0, 450, 1200, 150)
$g.DrawString("Gaming + TikTok Live Overwhelm?", $fontBig, $brushWhite, 50, 470)
$g.DrawString("Stop Alt-Tabbing. Start Streaming.", $fontMed, (New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::Cyan)), 50, 540)

$bmp.Save($bannerPath, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()


# --- 2. Diagram Image (The Alt-Tab Death Loop) ---
$diagPath = Join-Path $dir "${slug}-diagram-1.png"
$bmp = New-Object System.Drawing.Bitmap 800,1000
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::White)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$penBlack = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black), 3
$brushBox = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::WhiteSmoke)
$brushRedBox = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::MistyRose)
$brushGreenBox = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::Honeydew)

# Helper for box
function Draw-Box($x, $y, $w, $h, $text, $color) {
    $rect = New-Object System.Drawing.Rectangle $x, $y, $w, $h
    $g.FillRectangle($color, $rect)
    $g.DrawRectangle($penBlack, $rect)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center
    $sf.LineAlignment = [System.Drawing.StringAlignment]::Center
    
    # Cast to RectangleF for DrawString
    $rectF = New-Object System.Drawing.RectangleF $x, $y, $w, $h
    $g.DrawString($text, $fontMed, [System.Drawing.Brushes]::Black, $rectF, $sf)
}

# Title
$g.DrawString("The 'Alt-Tab' Death Loop", $fontMed, [System.Drawing.Brushes]::Black, 250, 20)

# Flow
Draw-Box 250 80 300 80 "Playing Game" $brushBox
# Arrow down
$g.DrawLine($penBlack, 400, 160, 400, 200)

Draw-Box 250 200 300 80 "Hear Chat Notification" $brushBox
# Arrow down
$g.DrawLine($penBlack, 400, 280, 400, 320)

Draw-Box 250 320 300 80 "Alt-Tab to Check" $brushRedBox
# Arrow down
$g.DrawLine($penBlack, 400, 400, 400, 440)

Draw-Box 250 440 300 80 "Game Minimizes / Lags" $brushRedBox
# Arrow down
$g.DrawLine($penBlack, 400, 520, 400, 560)

Draw-Box 250 560 300 80 "Character Dies In-Game" $brushRedBox

# Arrow back up (Loop)
$g.DrawArc($penBlack, 100, 120, 300, 500, 90, 180) 
$g.DrawString("FRUSTRATION", $fontMed, [System.Drawing.Brushes]::Red, 50, 350)

$bmp.Save($diagPath, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()


# --- 3. Explain Image (The Hardware Stack) ---
$explainPath = Join-Path $dir "${slug}-explain-1.png"
$bmp = New-Object System.Drawing.Bitmap 800,600
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(255,240,240,245))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# Monitor
$g.FillRectangle([System.Drawing.Brushes]::Black, 200, 100, 400, 250) # Frame
$g.FillRectangle([System.Drawing.Brushes]::LightBlue, 210, 110, 380, 230) # Screen
$g.DrawString("GAME ONLY", $fontMed, [System.Drawing.Brushes]::White, 300, 200)
$g.FillRectangle([System.Drawing.Brushes]::Black, 380, 350, 40, 50) # Stand
$g.FillRectangle([System.Drawing.Brushes]::Black, 350, 400, 100, 20) # Base

# Phone (Chat)
$g.FillRectangle([System.Drawing.Brushes]::Black, 650, 250, 80, 140) # Phone Body
$g.FillRectangle([System.Drawing.Brushes]::White, 655, 255, 70, 130) # Phone Screen
$g.DrawString("CHAT", (New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)), [System.Drawing.Brushes]::Black, 665, 300)

# Labels
$g.DrawString("Primary Monitor", $fontMed, [System.Drawing.Brushes]::Black, 300, 450)
$g.DrawString("Full Screen Game", (New-Object System.Drawing.Font("Arial", 12)), [System.Drawing.Brushes]::Gray, 320, 480)

$g.DrawString("Phone on Stand", $fontMed, [System.Drawing.Brushes]::Black, 620, 450)
$g.DrawString("Dedicted Chat", (New-Object System.Drawing.Font("Arial", 12)), [System.Drawing.Brushes]::Gray, 630, 480)

# Arrow connection
$penDashed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Green), 3
$penDashed.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
$g.DrawLine($penDashed, 500, 200, 650, 300)
$g.DrawString("Eyes move, not windows", (New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Italic)), [System.Drawing.Brushes]::Green, 520, 250)

$bmp.Save($explainPath, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
