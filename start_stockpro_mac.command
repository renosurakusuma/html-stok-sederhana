#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PORT=8765
URL="http://127.0.0.1:${PORT}/"

if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  echo "Python tidak ditemukan. Install Python 3 terlebih dahulu."
  exit 1
fi

echo "Menjalankan StockPro di ${URL}"
echo "Tekan Control+C untuk menghentikan server."

sleep 1
open "$URL" >/dev/null 2>&1 || true
"$PYTHON_BIN" -m http.server "$PORT"
