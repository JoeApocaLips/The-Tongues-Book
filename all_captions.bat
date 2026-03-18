@echo off
cd /d "%~dp0"
echo === Loading all captions ===
python The-Tongues-Book.py --all-captions
if errorlevel 1 ( pause & exit /b 1 )
notepad "tongues\for_pdf\bad_captions_review.txt"
pause
