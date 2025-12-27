@echo off
title DownloaderPRO
chcp 65001 >nul

echo =========================================
echo DownloaderPRO - Iniciando Download
echo =========================================

rem Argumento 1 (TIPO)
set "TIPO=%1"
rem Argumento 2 (URL)
set "URL_LIMPA=%~2"
rem Argumento 3 (CAMINHO DA PASTA)
set "PASTA_DESTINO=%~3"

if "%URL_LIMPA%"=="" (
    echo ERRO: URL nao foi fornecida.
    pause
    exit
)

if "%PASTA_DESTINO%"=="" (
    echo ERRO: Pasta de destino nao foi fornecida.
    pause
    exit
)

cd /d "%PASTA_DESTINO%"

echo Pasta de destino: %PASTA_DESTINO%
echo Formato: %TIPO%
echo URL: %URL_LIMPA%
echo --------------------------------

echo Executando yt-dlp...
echo.

rem --- LOGICA DE DOWNLOAD ---

if /I "%TIPO%"=="video" (
    yt-dlp --no-playlist -o "%%(title)s_[VIDEO].%%(ext)s" "%URL_LIMPA%"
)

if /I "%TIPO%"=="mp3" (
    yt-dlp --no-playlist -x --audio-format mp3 -o "%%(title)s_[MP3].mp3" "%URL_LIMPA%"
)

rem --- NOVO: LOGICA PARA PLAYLIST ---
if /I "%TIPO%"=="playlist" (
    rem Cria uma subpasta com o nome da playlist para não bagunçar o destino
    yt-dlp --yes-playlist -o "%%(playlist_title)s/%%(playlist_index)s - %%(title)s.%%(ext)s" "%URL_LIMPA%"
)

echo.
echo ================================
echo ✅ Finalizado
echo ================================
pause