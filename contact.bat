@echo off
cd /d "%~dp0"
echo === Generating contact sheet ===
python The-Tongues-Book.py --contact
if errorlevel 1 ( pause & exit /b 1 )
start contact.html
pause
