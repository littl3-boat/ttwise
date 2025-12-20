
Add-Type -AssemblyName System.Drawing

# Paths
$slug = "fix-tiktok-live-viewers-wont-follow-conversion-2025"
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

# Draw Grid
for ([int]$x = 0; $x -lt $width; $x += 40) { $g.DrawLine($penGrid, $x, 0, $x, $height) }
for ([int]$y = 0; $y -lt $height; $y += 40) { $g.DrawLine($penGrid, 0, $y, $width, $y) }

# Funnel Visualization
# Top Bar (Viewers)
[int]$topW = 800
[int]$topH = 80
[int]$topX = ($width - $topW) / 2
[int]$topY = 150
$g.FillRectangle($brushGreen, $topX, $topY, $topW, $topH)
$g.DrawString("10,000 VIEWERS", $fontTitle, [System.Drawing.Brushes]::Black, [float]($topX + 200), [float]($topY + 5))

# Bottom Bar (Followers)
[int]$botW = 100
[int]$botH = 80
[int]$botX = ($width - $botW) / 2
[int]$botY = 550
$g.FillRectangle($brushWhite, $botX, $botY, $botW, $botH)
$g.DrawString("12", $fontTitle, [System.Drawing.Brushes]::Black, [float]($botX + 10), [float]($botY + 5))
$g.DrawString("FOLLOWERS", $fontSmall, $brushWhite, [float]($botX - 20), [float]($botY + 90))

# Connecting Lines (Funnel Shape)
# Fix: Pass arguments separated by comma, NO PARENTHESES around the list
[int]$p1x = $topX
[int]$p1y = $topY + $topH
$p1 = New-Object System.Drawing.Point $p1x, $p1y

[int]$p2x = $topX + $topW
[int]$p2y = $topY + $topH
$p2 = New-Object System.Drawing.Point $p2x, $p2y

[int]$p3x = $botX + $botW
[int]$p3y = $botY
$p3 = New-Object System.Drawing.Point $p3x, $p3y

[int]$p4x = $botX
[int]$p4y = $botY
$p4 = New-Object System.Drawing.Point $p4x, $p4y

$points = @($p1, $p2, $p3, $p4)
$brushFunnel = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(50, 255, 255, 255))
$g.FillPolygon($brushFunnel, $points)

# The "Leak" (Passive Scroll)
[int]$leakStartX = $topX + $topW - 50
[int]$leakStartY = $topY + $topH + 50
[int]$leakEndX = $topX + $topW + 200
[int]$leakEndY = $topY + $topH + 150

$leakArrowStart = New-Object System.Drawing.Point $leakStartX, $leakStartY
$leakArrowEnd = New-Object System.Drawing.Point $leakEndX, $leakEndY

$penLeak = New-Object System.Drawing.Pen $brushRed, 10
$penLeak.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penLeak, $leakArrowStart, $leakArrowEnd)

$g.DrawString("PASSIVE SCROLL", $fontLabel, $brushRed, [float]($leakEndX - 100), [float]($leakEndY + 20))
$g.DrawString("99% LOSS", $fontTitle, $brushRed, [float]($leakEndX - 100), [float]($leakEndY + 60))

# Main Title
$g.DrawString("WHY THEY DON'T FOLLOW", $fontTitle, $brushWhite, 50.0, 50.0)

# Save
$bmp.Save($outFile)
$g.Dispose()
$bmp.Dispose()

Write-Host "Banner generated at $outFile"
