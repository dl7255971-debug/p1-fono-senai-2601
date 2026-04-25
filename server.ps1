$port = 3000
$path = $PSScriptRoot
if (-not $path) { $path = Get-Location }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host ""
Write-Host "========================================="
Write-Host "🚀 Servidor Dev Local Iniciado 🚀"
Write-Host "Aponte seu navegador para: http://localhost:$port/"
Write-Host "Pasta servida: $path"
Write-Host "Para parar o servidor, pressione: Ctrl+C"
Write-Host "========================================="
Write-Host ""

Start-Process "http://localhost:$port/"

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $localPath = $request.Url.LocalPath.TrimStart('/').Replace('/', '\')
        if ($localPath -eq '') { $localPath = 'index.html' }
        $filePath = Join-Path -Path $path -ChildPath $localPath
        
        if (Test-Path $filePath -PathType Leaf) {
            $extension = [System.IO.Path]::GetExtension($filePath)
            $contentType = switch ($extension.ToLower()) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".svg"  { "image/svg+xml" }
                ".webp" { "image/webp" }
                ".ico"  { "image/x-icon" }
                default { "application/octet-stream" }
            }
            $response.ContentType = $contentType
            
            try {
                $stream = [System.IO.File]::OpenRead($filePath)
                $response.ContentLength64 = $stream.Length
                $stream.CopyTo($response.OutputStream)
                $stream.Close()
            } catch {
                Write-Host "Erro lendo: $filePath"
            }
        } else {
            $response.StatusCode = 404
            $buffer = [System.Text.Encoding]::UTF8.GetBytes("404 - Arquivo não encontrado")
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        $response.Close()
        Write-Host "Servido: /$localPath"
    }
} finally {
    $listener.Stop()
}
