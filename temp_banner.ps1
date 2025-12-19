Add-Type -AssemblyName System.Drawing

$width = 1280
$height = 720
$bitmap = New-Object System.Drawing.Bitmap $width, $height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.Clear([System.Drawing.Color]::FromArgb(20, 20, 20))

# Fonts and Brushes - Fixed Constructor Ambiguity
$family = New-Object System.Drawing.FontFamily "Arial"
$fontTitle = New-Object System.Drawing.Font $family, 60.0, "Bold", "Pixel"
$fontSub = New-Object System.Drawing.Font $family, 40.0, "Bold", "Pixel"

$brushWhite = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$brushRed = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 80, 80))
$penGreen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Lime, 5)
$penRed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red, 5)
$penGrid = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(50, 50, 50), 2)

# Draw Grid
for ($x = 0; $x -lt $width; $x += 100) { $graphics.DrawLine($penGrid, $x, 0, $x, $height) }
for ($y = 0; $y -lt $height; $y += 100) { $graphics.DrawLine($penGrid, 0, $y, $width, $y) }

# Text
$graphics.DrawString("STREAM HEALTH", $fontSub, $brushWhite, 50, 50)
$graphics.DrawString("0 kbps FREEZE", $fontTitle, $brushRed, 50, 100)

# Graph Data Simulation
$points = @()
$prevY = 400

# Normal Stream (Green)
for ($x = 50; $x -lt 600; $x += 10) {
    $y = 400 + (Get-Random -Minimum -20 -Maximum 20)
    $graphics.DrawLine($penGreen, ($x - 10), $prevY, $x, $y)
    $prevY = $y
}

# The Drop (Red)
$graphics.DrawLine($penRed, 600, $prevY, 650, 650)
$graphics.DrawLine($penRed, 650, 650, 1230, 650)

# "0 kbps" Label at the bottom right
$graphics.DrawString("0 kbps", $fontSub, $brushRed, 1000, 580)

# Save
$bitmap.Save("c:\Users\85148\Desktop\ttwise\public\static\images\tiktok-live-studio-freezes-mid-stream-fix-2025\banner.png", [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bitmap.Dispose()
