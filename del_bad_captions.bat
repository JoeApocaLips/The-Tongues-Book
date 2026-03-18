@echo off
cd /d "%~dp0"

if not exist "tongues\for_pdf\bad_captions_review.txt" (
    echo ERROR: bad_captions_review.txt not found — run find_bad_captions.bat or all_captions.bat first
    pause
    exit /b 1
)

echo === Lines marked with '-' will be deleted ===
type "tongues\for_pdf\bad_captions_review.txt"
echo.
set /p CONFIRM="Delete marked captions and regenerate? (y/N): "
if /i not "%CONFIRM%"=="y" (
    echo Cancelled.
    pause
    exit /b 0
)
echo.
python The-Tongues-Book.py --clean-bad
if errorlevel 1 ( pause & exit /b 1 )
echo.
echo === Regenerating captions ===
python The-Tongues-Book.py --captions
pause
