Add-Type -AssemblyName System.Drawing

# Configuration
$slug = "tiktok-live-vs-twitch-gaming-growth-2025"
$text = "TWITCH vs TIKTOK"
$outputDir = "c:\Users\85148\Desktop\ttwise\public\static\images\$slug"
$outputFile = "$outputDir\banner.png"

# Create directory
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

# Canvas settings
$width = 1280
$height = 720
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# Colors
$purple = [System.Drawing.Color]::FromArgb(255, 145, 70, 255) # Twitch Purple
$darkPurple = [System.Drawing.Color]::FromArgb(255, 40, 20, 60)
$cyan = [System.Drawing.Color]::FromArgb(255, 0, 240, 240) # TikTok Cyan
$pink = [System.Drawing.Color]::FromArgb(255, 250, 40, 80) # TikTok Pink
$white = [System.Drawing.Color]::White
$gray = [System.Drawing.Color]::FromArgb(255, 50, 50, 50)
$brushWhite = New-Object System.Drawing.SolidBrush($white)

# Split Screen Background
# Left (Twitch)
$brushLeft = New-Object System.Drawing.SolidBrush($darkPurple)
$g.FillRectangle($brushLeft, 0, 0, 640, 720)

# Right (TikTok)
$brushRight = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black)
$g.FillRectangle($brushRight, 640, 0, 640, 720)

# Divider
$penWhite = New-Object System.Drawing.Pen($white, 10)
$g.DrawLine($penWhite, 640, 0, 640, 720)


# LEFT SIDE: Empty Room (Symbolic)
# Draw a simple chair or "0"
$fontBig = New-Object System.Drawing.Font("Arial", 100.0, [System.Drawing.FontStyle]::Bold)
$brushPurple = New-Object System.Drawing.SolidBrush($purple)
$g.DrawString("0", $fontBig, $brushPurple, 250.0, 250.0)

$fontSmall = New-Object System.Drawing.Font("Arial", 30.0, [System.Drawing.FontStyle]::Bold)
$g.DrawString("VIEWERS", $fontSmall, $brushWhite, 200.0, 400.0)
$g.DrawString("HARD MODE", $fontSmall, $brushPurple, 200.0, 500.0)


# RIGHT SIDE: Chaos/Growth
# Draw many small circles (people)
$brushCyan = New-Object System.Drawing.SolidBrush($cyan)
$brushPink = New-Object System.Drawing.SolidBrush($pink)
$rand = New-Object Random

for ($i = 0; $i -lt 50; $i++) {
    $x = $rand.Next(660, 1200)
    $y = $rand.Next(100, 600)
    $size = $rand.Next(10, 30)
    
    if ($i % 2 -eq 0) {
        $g.FillEllipse($brushCyan, $x, $y, $size, $size)
    } else {
        $g.FillEllipse($brushPink, $x, $y, $size, $size)
    }
}

$g.DrawString("100+", $fontBig, $brushCyan, 800.0, 250.0)
$g.DrawString("VIEWERS", $fontSmall, $brushWhite, 850.0, 400.0)
$g.DrawString("EASY MODE", $fontSmall, $brushPink, 850.0, 500.0)


# Title Overlay
$fontTitle = New-Object System.Drawing.Font("Arial", 60.0, [System.Drawing.FontStyle]::Bold)
$textSize = $g.MeasureString($text, $fontTitle)
$textX = ($width - $textSize.Width) / 2
$textY = 50

# Text Background
$brushBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(200, 0, 0, 0))
$g.FillRectangle($brushBg, [float]($textX - 20), [float]($textY - 10), [float]($textSize.Width + 40), [float]($textSize.Height + 20))

$g.DrawString($text, $fontTitle, $brushWhite, [float]$textX, [float]$textY)

# Save
$bmp.Save($outputFile)
$g.Dispose()
$bmp.Dispose()

Write-Host "Banner generated at $outputFile"
