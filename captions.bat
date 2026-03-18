@echo off
setlocal
cd /d "%~dp0"

echo === Generating captions for for_pdf/*.jpg ===
python The-Tongues-Book.py --captions
if errorlevel 1 (
    echo ERROR: caption generation failed
    pause
    exit /b 1
)
echo === Done ===
pause
