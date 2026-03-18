@echo off
setlocal
cd /d "%~dp0"

set /p N="How many images? "
set /p MODE="Mode (classic/wild) [classic]: "
if "%MODE%"=="" set MODE=classic

echo === Generating %N% images [mode: %MODE%] ===
python The-Tongues-Book.py %N% --mode %MODE%
if errorlevel 1 (
    echo ERROR: generation failed
    pause
    exit /b 1
)
echo === Done ===
pause
