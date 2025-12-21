Add-Type -AssemblyName System.Drawing

# Configuration
$slug = "tiktok-live-chat-dead-engagement-fix-2025"
$text = "DEAD CHAT?"
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
$g.Clear([System.Drawing.Color]::FromArgb(255, 20, 20, 25)) # Dark background
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# Colors
$white = [System.Drawing.Color]::White
$green = [System.Drawing.Color]::FromArgb(255, 50, 255, 50)
$red = [System.Drawing.Color]::FromArgb(255, 255, 50, 50)
$gridColor = [System.Drawing.Color]::FromArgb(40, 255, 255, 255)

# Draw Grid
$penGrid = New-Object System.Drawing.Pen($gridColor, 2)
for ($i = 0; $i -lt $width; $i += 100) {
    $g.DrawLine($penGrid, $i, 0, $i, $height)
}
for ($j = 0; $j -lt $height; $j += 100) {
    $g.DrawLine($penGrid, 0, $j, $width, $j)
}

# Fonts
$fontLabel = New-Object System.Drawing.Font("Arial", 30.0, [System.Drawing.FontStyle]::Bold)
$fontTitle = New-Object System.Drawing.Font("Arial", 80.0, [System.Drawing.FontStyle]::Bold)
$brushWhite = New-Object System.Drawing.SolidBrush($white)
$brushGreen = New-Object System.Drawing.SolidBrush($green)
$brushRed = New-Object System.Drawing.SolidBrush($red)

# Draw "VIEWS" Graph (Top, Green, Spiky/Up)
$penGreen = New-Object System.Drawing.Pen($green, 8)
$pointsViews = @(
    (New-Object System.Drawing.Point 100, 300),
    (New-Object System.Drawing.Point 200, 250),
    (New-Object System.Drawing.Point 300, 280),
    (New-Object System.Drawing.Point 400, 150),
    (New-Object System.Drawing.Point 500, 200),
    (New-Object System.Drawing.Point 600, 100),
    (New-Object System.Drawing.Point 700, 120),
    (New-Object System.Drawing.Point 800, 80),
    (New-Object System.Drawing.Point 900, 150),
    (New-Object System.Drawing.Point 1000, 50)
)
$g.DrawLines($penGreen, $pointsViews)
$g.DrawString("VIEWS: 2,500", $fontLabel, $brushGreen, 100.0, 50.0)

# Draw "CHAT" Graph (Bottom, Red, Flatline)
$penRed = New-Object System.Drawing.Pen($red, 8)
$flatY = 600
$g.DrawLine($penRed, 100, $flatY, 1100, $flatY)

# Small "blip" on flatline
$g.DrawLine($penRed, 400, $flatY, 410, $flatY - 20)
$g.DrawLine($penRed, 410, $flatY - 20, 420, $flatY + 20)
$g.DrawLine($penRed, 420, $flatY + 20, 430, $flatY)

$g.DrawString("CHAT: 0", $fontLabel, $brushRed, 100.0, 520.0)

# Title Text Overlay (Center)
$textSize = $g.MeasureString($text, $fontTitle)
$textX = ($width - $textSize.Width) / 2
$textY = ($height - $textSize.Height) / 2

# Text Background
$brushBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(200, 0, 0, 0))
$g.FillRectangle($brushBg, [float]($textX - 20), [float]($textY - 10), [float]($textSize.Width + 40), [float]($textSize.Height + 20))

$g.DrawString($text, $fontTitle, $brushWhite, [float]$textX, [float]$textY)

# Save
$bmp.Save($outputFile)
$g.Dispose()
$bmp.Dispose()

Write-Host "Banner generated at $outputFile"
