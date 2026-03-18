@echo off
setlocal
cd /d "%~dp0"

echo === Scoring + selecting images -> for_pdf/ ===
python The-Tongues-Book.py --score
if errorlevel 1 (
    echo ERROR: scoring failed
    pause
    exit /b 1
)
echo === Done ===
pause
