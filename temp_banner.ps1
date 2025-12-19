Add-Type -AssemblyName System.Drawing

$width = 1280
$height = 720
$bitmap = New-Object System.Drawing.Bitmap $width, $height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.Clear([System.Drawing.Color]::FromArgb(20, 20, 20))

# Fonts and Brushes - Using proven constructor
$family = New-Object System.Drawing.FontFamily "Arial"
$fontTitle = New-Object System.Drawing.Font $family, 60.0, "Bold", "Pixel"
$fontSub = New-Object System.Drawing.Font $family, 40.0, "Bold", "Pixel"

$brushWhite = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$brushRed = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 80, 80))
$brushGray = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(100, 100, 100))

$penGreen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Lime, 4)
$penRed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red, 4)
$penGrid = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(50, 50, 50), 2)

# Draw Grid
for ($x = 0; $x -lt $width; $x += 100) { $graphics.DrawLine($penGrid, $x, 0, $x, $height) }
for ($y = 0; $y -lt $height; $y += 100) { $graphics.DrawLine($penGrid, 0, $y, $width, $y) }

# Text
$graphics.DrawString("HIGH END PC", $fontSub, $brushGray, 50, 50)
$graphics.DrawString("CHOPPY STREAM?", $fontTitle, $brushWhite, 50, 100)

# Visualizing 144Hz vs 30Hz Mismatch
# Top Line: 144Hz (Smooth Green)
$graphics.DrawString("144Hz Game", $fontSub, $brushWhite, 50, 250)
$prevX = 50
for ($x = 50; $x -lt 1200; $x += 5) {
    $y = 320 + (Get-Random -Minimum -5 -Maximum 5)
    $graphics.DrawLine($penGreen, $prevX, 320, $x, $y)
    $prevX = $x
}

# Bottom Line: 30Hz Stutter (Choppy Red)
$graphics.DrawString("30FPS Stream", $fontSub, $brushRed, 50, 450)
$prevX = 50
for ($x = 50; $x -lt 1200; $x += 60) {
    # Draw a flat line then a sudden jump to represent stutter
    $graphics.DrawLine($penRed, $prevX, 520, ($x - 10), 520)
    $graphics.DrawLine($penRed, ($x - 10), 520, $x, 520) 
    # Draw a vertical "dropped frame" marker
    $graphics.FillRectangle($brushRed, $x, 500, 10, 40)
    $prevX = $x
}

# Save
$bitmap.Save("c:\Users\85148\Desktop\ttwise\public\static\images\tiktok-live-studio-choppy-high-end-pc-fix-2025\banner.png", [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bitmap.Dispose()
