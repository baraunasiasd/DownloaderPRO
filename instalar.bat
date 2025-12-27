@echo off
title Instalador DownloaderPRO
cls

echo ======================================================
echo    INSTALANDO COMPONENTES NECESSARIOS (AGUARDE)
echo ======================================================
echo.

:: 1. Executa o comando no PowerShell para o Instalador de Aplicativos
echo [1/2] Configurando DesktopAppInstaller via PowerShell...
powershell -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe"

echo.
:: 2. Executa o comando no CMD para instalar o yt-dlp
:: O parametro --accept-source-agreements evita que o usuario precise digitar 'S'
echo [2/2] Instalando yt-dlp via Winget...
winget install yt-dlp --accept-source-agreements --accept-package-agreements

echo.
echo ======================================================
echo    INSTALACAO CONCLUIDA COM SUCESSO!
echo    Pressione qualquer tecla para sair.
echo ======================================================
pause >nul
echo instalacao_concluida > instalado.txt