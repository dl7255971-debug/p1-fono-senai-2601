# Script de Publicação para o GitHub
# Define a URL do repositório remoto
$remoteUrl = "https://github.com/dl7255971-debug/p1-fono-senai-2601.git"

Write-Host "Iniciando processo de publicação..." -ForegroundColor Cyan

# Verifica se o repositório tem o remote 'origin' configurado
$hasOrigin = git remote -v | Select-String "origin"

if (-not $hasOrigin) {
    Write-Host "Adicionando remote 'origin'..." -ForegroundColor Yellow
    git remote add origin $remoteUrl
} else {
    Write-Host "Remote 'origin' já configurado. Atualizando URL por precaução..." -ForegroundColor Yellow
    git remote set-url origin $remoteUrl
}

# Muda para a branch main (caso esteja em master)
Write-Host "Garantindo que estamos na branch 'main'..." -ForegroundColor Yellow
git branch -M main

# Faz o push para o repositório remoto
Write-Host "Enviando código para o GitHub ($remoteUrl)..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Publicação concluída com sucesso!" -ForegroundColor Green
} else {
    Write-Host "❌ Erro ao enviar para o GitHub. Verifique suas credenciais e permissões." -ForegroundColor Red
}
