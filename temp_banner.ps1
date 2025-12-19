Add-Type -AssemblyName System.Drawing

$width = 1280
$height = 720
$bitmap = New-Object System.Drawing.Bitmap $width, $height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.Clear([System.Drawing.Color]::FromArgb(20, 20, 20))

# Fonts and Brushes
$family = New-Object System.Drawing.FontFamily "Arial"
$fontTitle = New-Object System.Drawing.Font $family, 60.0, "Bold", "Pixel"
$fontSub = New-Object System.Drawing.Font $family, 40.0, "Bold", "Pixel"
$fontSmall = New-Object System.Drawing.Font $family, 24.0, "Regular", "Pixel"

$brushWhite = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$brushRed = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 80, 80))
$brushGray = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(100, 100, 100))

$penBlue = New-Object System.Drawing.Pen ([System.Drawing.Color]::Cyan, 4)
$penRed = New-Object System.Drawing.Pen ([System.Drawing.Color]::Red, 4)
$penGrid = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(50, 50, 50), 2)

# Draw Grid
for ($x = 0; $x -lt $width; $x += 100) { $graphics.DrawLine($penGrid, $x, 0, $x, $height) }
for ($y = 0; $y -lt $height; $y += 100) { $graphics.DrawLine($penGrid, 0, $y, $width, $y) }

# Text
$graphics.DrawString("OBS AUDIO", $fontSub, $brushGray, 50, 50)
$graphics.DrawString("DESYNC AFTER 1HR?", $fontTitle, $brushWhite, 50, 100)

# Visualizing Drift
# Top Waveform (Video Frame) - Blue
$graphics.DrawString("Video Frame (48kHz)", $fontSmall, $brushWhite, 50, 280)
$prevX = 50
for ($x = 50; $x -lt 1100; $x += 5) {
    $y = 350 + ([math]::Sin($x / 20) * 40)
    $graphics.DrawLine($penBlue, $prevX, ($prevY), $x, $y)
    $prevX = $x
    $prevY = $y
}
# Marker for "Action"
$graphics.FillRectangle($brushWhite, 1000, 310, 5, 80) 

# Bottom Waveform (Audio Drift) - Red
$graphics.DrawString("Audio (44.1kHz Drift)", $fontSmall, $brushRed, 50, 480)
$prevX = 50
# The red wave starts synced but slowly shifts right (lag)
for ($x = 50; $x -lt 1100; $x += 5) {
    # Phase shift increases with X to simulate drift
    $shift = $x / 10 
    $y = 550 + ([math]::Sin(($x - $shift) / 20) * 40)
    $graphics.DrawLine($penRed, $prevX, ($prevY2), $x, $y)
    $prevX = $x
    $prevY2 = $y
}
# Marker for "Sound" (Delayed)
$graphics.FillRectangle($brushRed, 1100, 510, 5, 80)

# Connection Arrow showing gap
$penDashed = New-Object System.Drawing.Pen ([System.Drawing.Color]::White, 2)
$penDashed.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
$graphics.DrawLine($penDashed, 1000, 390, 1000, 510)
$graphics.DrawLine($penDashed, 1100, 390, 1100, 510)
$graphics.DrawString("2 SEC DELAY", $fontSmall, $brushRed, 1005, 450)

# Save
$bitmap.Save("c:\Users\85148\Desktop\ttwise\public\static\images\obs-audio-desync-tiktok-live-sample-rate-fix-2025\banner.png", [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bitmap.Dispose()
