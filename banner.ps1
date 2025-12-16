$bitmap = New-Object System.Drawing.Bitmap 1280,720
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.Clear([System.Drawing.Color]::Black)
$font = New-Object System.Drawing.Font "Arial", 48
$brush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$graphics.DrawString("Fix OBS Bitrate for TikTok Live", $font, $brush, 100, 300)
$bitmap.Save("public/static/images/fix-wrong-obs-bitrate-tiktok-live-2025/banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()