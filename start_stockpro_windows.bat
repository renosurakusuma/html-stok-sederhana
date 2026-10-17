@echo off
setlocal
cd /d "%~dp0"

set PORT=8765
set URL=http://127.0.0.1:%PORT%/

where py >nul 2>nul
if %errorlevel%==0 (
  echo Menjalankan StockPro di %URL%
  start "" "%URL%"
  py -3 -m http.server %PORT%
  goto :eof
)

where python >nul 2>nul
if %errorlevel%==0 (
  echo Menjalankan StockPro di %URL%
  start "" "%URL%"
  python -m http.server %PORT%
  goto :eof
)

echo Python tidak ditemukan. Install Python 3 terlebih dahulu.
pause
