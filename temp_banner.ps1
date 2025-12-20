
Add-Type -AssemblyName System.Drawing

# Paths
$slug = "fix-tiktok-live-studio-gifts-not-showing-overlay-2025"
$basePath = "c:\Users\85148\Desktop\ttwise"
$outDir = "$basePath\public\static\images\$slug"
$outFile = "$outDir\banner.png"

# Create Directory
if (-not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Force -Path $outDir | Out-Null
}

# Canvas
[int]$width = 1280
[int]$height = 720
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(20, 20, 25))
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# Fonts
$fontTitle = New-Object System.Drawing.Font("Arial", 50, [System.Drawing.FontStyle]::Bold)
$fontLabel = New-Object System.Drawing.Font("Arial", 32, [System.Drawing.FontStyle]::Bold)
$fontSmall = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Regular)

# Brushes/Pens
$brushGreen = [System.Drawing.Brushes]::SpringGreen
$brushRed = [System.Drawing.Brushes]::Salmon
$brushWhite = [System.Drawing.Brushes]::White
$brushGray = [System.Drawing.Brushes]::Gray
$penGrid = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(40, 40, 40)), 2
$penConn = New-Object System.Drawing.Pen $brushGreen, 4
$penBroken = New-Object System.Drawing.Pen $brushRed, 4

# Draw Grid
for ([int]$x = 0; $x -lt $width; $x += 40) { $g.DrawLine($penGrid, $x, 0, $x, $height) }
for ([int]$y = 0; $y -lt $height; $y += 40) { $g.DrawLine($penGrid, 0, $y, $width, $y) }

# Visualization: Server -> PC -> Overlay (Broken)
# Node 1: TikTok Server
[int]$n1x = 200
[int]$n1y = 300
[int]$nSize = 120
$g.FillEllipse($brushGreen, $n1x, $n1y, $nSize, $nSize)
$g.DrawString("TIKTOK", $fontSmall, [System.Drawing.Brushes]::Black, [float]($n1x + 15), [float]($n1y + 45))

# Node 2: PC/Studio
[int]$n2x = 600
[int]$n2y = 300
$g.FillEllipse($brushGray, $n2x, $n2y, $nSize, $nSize)
$g.DrawString("STUDIO", $fontSmall, [System.Drawing.Brushes]::Black, [float]($n2x + 15), [float]($n2y + 45))

# Node 3: Overlay (Broken)
[int]$n3x = 1000
[int]$n3y = 300
$g.DrawRectangle($penBroken, $n3x, $n3y, $nSize, $nSize) # Empty Box
$g.DrawString("?", $fontTitle, $brushRed, [float]($n3x + 40), [float]($n3y + 30))

# Connections
# TikTok -> Studio (OK)
$g.DrawLine($penConn, [int]($n1x + $nSize), [int]($n1y + $nSize/2), [int]$n2x, [int]($n2y + $nSize/2))
$g.DrawString("DATA OK", $fontSmall, $brushGreen, [float]($n1x + 150), [float]($n1y + $nSize/2 - 30))

# Studio -> Overlay (Broken)
$g.DrawLine($penBroken, [int]($n2x + $nSize), [int]($n2y + $nSize/2), [int]$n3x, [int]($n3y + $nSize/2))
# X Mark on line
$g.DrawString("X", $fontTitle, $brushRed, [float]($n2x + 150), [float]($n2y + $nSize/2 - 40))
$g.DrawString("CACHE ERROR", $fontSmall, $brushRed, [float]($n2x + 120), [float]($n2y + $nSize/2 + 10))

# Title
$g.DrawString("GIFTS NOT SHOWING", $fontTitle, $brushWhite, 50.0, 50.0)

# Save
$bmp.Save($outFile)
$g.Dispose()
$bmp.Dispose()

Write-Host "Banner generated at $outFile"
