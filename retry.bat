@echo off
setlocal
cd /d "%~dp0"

if "%~1"=="" (
    set /p JSON="Path to .json file to retry: "
) else (
    set JSON=%~1
)

echo === Retrying: %JSON% ===
python The-Tongues-Book.py --retry "%JSON%"
if errorlevel 1 (
    echo ERROR: retry failed
    pause
    exit /b 1
)
echo === Done ===
pause
