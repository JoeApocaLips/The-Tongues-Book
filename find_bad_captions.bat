@echo off
cd /d "%~dp0"
echo === Finding bad captions ===
python The-Tongues-Book.py --find-bad
if errorlevel 1 ( pause & exit /b 1 )
notepad "tongues\for_pdf\bad_captions_review.txt"
pause
