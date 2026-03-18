@echo off
cd /d "%~dp0"

set DOWNLOADS=%USERPROFILE%\Downloads

if exist "to_add.txt" goto run
if exist "to_remove.txt" goto run

if exist "%DOWNLOADS%\to_add.txt" copy /y "%DOWNLOADS%\to_add.txt" "to_add.txt" >nul
if exist "%DOWNLOADS%\to_remove.txt" copy /y "%DOWNLOADS%\to_remove.txt" "to_remove.txt" >nul

if not exist "to_add.txt" if not exist "to_remove.txt" (
    echo No to_add.txt or to_remove.txt found in project dir or Downloads.
    pause & exit /b 1
)

:run
echo === Applying selection to for_pdf/ ===
python The-Tongues-Book.py --select
if errorlevel 1 ( pause & exit /b 1 )
if exist "%DOWNLOADS%\to_add.txt" del "%DOWNLOADS%\to_add.txt"
if exist "%DOWNLOADS%\to_remove.txt" del "%DOWNLOADS%\to_remove.txt"
pause
