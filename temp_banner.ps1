Add-Type -AssemblyName System.Drawing

# Configuration
$slug = "fix-tiktok-live-mobile-gifts-not-showing-chat-2025"
$text = "INVISIBLE GIFTS?"
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
$g.Clear([System.Drawing.Color]::FromArgb(255, 10, 10, 15)) # Dark Blue/Black background
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# Colors
$white = [System.Drawing.Color]::White
$red = [System.Drawing.Color]::FromArgb(255, 255, 80, 80)
$gray = [System.Drawing.Color]::FromArgb(255, 60, 60, 70)
$lightGray = [System.Drawing.Color]::FromArgb(255, 160, 160, 170)

# Draw "Broken Flow" Diagram
# Left: Gift Box (Simplified as a square with a cross)
$boxSize = 150
$boxX = 200
$boxY = 285

$penWhite = New-Object System.Drawing.Pen -ArgumentList $white, 4
$brushGray = New-Object System.Drawing.SolidBrush -ArgumentList $gray

# Draw Gift Box body
$g.FillRectangle($brushGray, $boxX, $boxY, $boxSize, $boxSize)
$g.DrawRectangle($penWhite, $boxX, $boxY, $boxSize, $boxSize)
# Ribbon lines
$g.DrawLine($penWhite, [int]($boxX + $boxSize/2), $boxY, [int]($boxX + $boxSize/2), [int]($boxY + $boxSize))
$g.DrawLine($penWhite, $boxX, [int]($boxY + $boxSize/2), [int]($boxX + $boxSize), [int]($boxY + $boxSize/2))

# Label "SENT"
$fontLabel = New-Object System.Drawing.Font("Arial", 24.0, [System.Drawing.FontStyle]::Bold)
$brushWhite = New-Object System.Drawing.SolidBrush($white)
$g.DrawString("SENT", $fontLabel, $brushWhite, [float]($boxX + 25), [float]($boxY + $boxSize + 20))


# Right: Eye Icon with Slash (Not Seeing)
$eyeX = 900
$eyeY = 360
$eyeW = 160
$eyeH = 100

# Draw Eye (Ellipse)
$g.DrawEllipse($penWhite, [int]($eyeX - $eyeW/2), [int]($eyeY - $eyeH/2), $eyeW, $eyeH)
# Pupil
$g.FillEllipse($brushWhite, [int]($eyeX - 20), [int]($eyeY - 20), 40, 40)

# Slash (Red X)
$penRed = New-Object System.Drawing.Pen($red, 10)
$g.DrawLine($penRed, [int]($eyeX - 60), [int]($eyeY - 60), [int]($eyeX + 60), [int]($eyeY + 60))
$g.DrawLine($penRed, [int]($eyeX + 60), [int]($eyeY - 60), [int]($eyeX - 60), [int]($eyeY + 60))

# Label "NOT SEEN"
$g.DrawString("NOT SEEN", $fontLabel, $brushWhite, [float]($eyeX - 80), [float]($eyeY + 80))


# Middle: Arrow with "X"
$arrowStartX = $boxX + $boxSize + 50
$arrowEndX = $eyeX - 100
$arrowY = 360

$penArrow = New-Object System.Drawing.Pen -ArgumentList $lightGray, 6
$penArrow.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($penArrow, $arrowStartX, $arrowY, $arrowEndX, $arrowY)

# X on the arrow
$crossX = ($arrowStartX + $arrowEndX) / 2
$g.DrawLine($penRed, [int]($crossX - 20), [int]($arrowY - 20), [int]($crossX + 20), [int]($arrowY + 20))
$g.DrawLine($penRed, [int]($crossX + 20), [int]($arrowY - 20), [int]($crossX - 20), [int]($arrowY + 20))


# Title Text Overlay
$fontTitle = New-Object System.Drawing.Font("Arial", 60.0, [System.Drawing.FontStyle]::Bold)
$textSize = $g.MeasureString($text, $fontTitle)
$textX = ($width - $textSize.Width) / 2
$textY = 100

# Text Background for readability
$bgColor = [System.Drawing.Color]::FromArgb(180, 0, 0, 0)
$brushBg = New-Object System.Drawing.SolidBrush($bgColor)
$g.FillRectangle($brushBg, [float]($textX - 20), [float]($textY - 10), [float]($textSize.Width + 40), [float]($textSize.Height + 20))

$g.DrawString($text, $fontTitle, $brushWhite, $textX, $textY)

# Save
$bmp.Save($outputFile)
$g.Dispose()
$bmp.Dispose()

Write-Host "Banner generated at $outputFile"
