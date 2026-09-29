Add-Type -AssemblyName System.Drawing

function New-Icon([int] $size, [string] $path) {
    $bitmap = [System.Drawing.Bitmap]::new($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $graphics.Clear([System.Drawing.Color]::Transparent)
    $margin = [int]($size * 0.04)
    $diameter = $size - 2 * $margin
    $background = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#4F46E5'))
    $foreground = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::White)
    $font = [System.Drawing.Font]::new('Malgun Gothic', [single]($size * 0.48), [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
    try {
        $graphics.FillEllipse($background, $margin, $margin, $diameter, $diameter)
        $format = [System.Drawing.StringFormat]::new()
        $format.Alignment = [System.Drawing.StringAlignment]::Center
        $format.LineAlignment = [System.Drawing.StringAlignment]::Center
        $bounds = [System.Drawing.RectangleF]::new(0, [single](-$size * 0.015), $size, $size)
        $graphics.DrawString([string][char]0xD55C, $font, $foreground, $bounds, $format)
        $bitmap.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        $format.Dispose()
    } finally {
        $font.Dispose()
        $foreground.Dispose()
        $background.Dispose()
        $graphics.Dispose()
        $bitmap.Dispose()
    }
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
New-Icon 64 (Join-Path $root 'icon.png')
New-Icon 192 (Join-Path $root 'icon-192.png')
New-Icon 512 (Join-Path $root 'icon-512.png')
New-Icon 180 (Join-Path $root 'apple-touch-icon.png')
