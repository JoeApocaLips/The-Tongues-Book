@echo off
setlocal
cd /d "%~dp0"

echo === Reprocessing PNG -> JPG ===
python The-Tongues-Book.py --reprocess
if errorlevel 1 (
    echo ERROR: reprocess failed
    pause
    exit /b 1
)
echo === Done ===
pause
