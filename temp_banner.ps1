Add-Type -AssemblyName System.Drawing
$bitmap = New-Object System.Drawing.Bitmap -ArgumentList 1280,720
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.Clear([System.Drawing.Color]::FromArgb(30,30,30))
$font = New-Object System.Drawing.Font -ArgumentList "Arial", 36.0, ([System.Drawing.FontStyle]::Bold)
$brush = New-Object System.Drawing.SolidBrush -ArgumentList ([System.Drawing.Color]::White)
$graphics.DrawString("OBS Preview: Smooth 60FPS", $font, $brush, 100, 200)
$graphics.DrawString("TikTok Live: Feels Like 30FPS?", $font, $brush, 100, 250)
$penSmooth = New-Object System.Drawing.Pen -ArgumentList ([System.Drawing.Color]::Lime), 4
$graphics.DrawLine($penSmooth, 100, 350, 600, 350)
$penChoppy = New-Object System.Drawing.Pen -ArgumentList ([System.Drawing.Color]::Red), 4
$graphics.DrawLine($penChoppy, 100, 400, 150, 400)
$graphics.DrawLine($penChoppy, 150, 400, 200, 450)
$graphics.DrawLine($penChoppy, 200, 450, 250, 400)
$graphics.DrawLine($penChoppy, 250, 400, 300, 450)
$graphics.DrawLine($penChoppy, 300, 450, 350, 400)
$graphics.DrawLine($penChoppy, 350, 400, 400, 450)
$graphics.DrawLine($penChoppy, 400, 450, 450, 400)
$graphics.DrawLine($penChoppy, 450, 400, 500, 450)
$graphics.DrawLine($penChoppy, 500, 450, 550, 400)
$graphics.DrawLine($penChoppy, 550, 400, 600, 450)
$bitmap.Save("public/static/images/obs-preview-smooth-tiktok-live-fps-lags-2025/banner.png", [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()