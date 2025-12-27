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
echo [2/2] Instalando yt-dlp via Winget...
winget install yt-dlp --accept-source-agreements --accept-package-agreements

echo.
echo ======================================================
echo    INSTALACAO CONCLUIDA COM SUCESSO!
echo ======================================================
echo.

:: Cria o arquivo sinalizador antes de fechar
echo instalacao_concluida > instalado.txt

echo O programa precisa ser reiniciado para reconhecer o novo motor.
echo Fechando em 5 segundos...
timeout /t 5

:: Fecha o DownloaderPRO (mshta.exe) para forçar a atualização do PATH
taskkill /f /im mshta.exe >nul 2>&1

exit