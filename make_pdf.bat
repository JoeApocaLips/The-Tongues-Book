@echo off
setlocal

cd /d "%~dp0"

echo === Step 1: generating .tex ===
python The-Tongues-Book.py --pdf
if errorlevel 1 (
    echo ERROR: The-Tongues-Book.py --pdf failed
    pause
    exit /b 1
)

echo === Step 2: xelatex (pass 1) ===
xelatex -interaction=nonstopmode tongues_book.tex
if errorlevel 1 (
    echo ERROR: xelatex failed — check tongues_book.log
    pause
    exit /b 1
)

echo === Step 2b: xelatex (pass 2 for refs) ===
xelatex -interaction=nonstopmode tongues_book.tex

echo === Done: tongues_book.pdf !!! ===
pause
