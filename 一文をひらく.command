#!/bin/bash
# 「一文」をダブルクリックで起動する。
# サーバーが未起動なら立ち上げ、ブラウザで開く。
DIR="$(cd "$(dirname "$0")" && pwd)"
PORT=4177
URL="http://localhost:$PORT"

if ! lsof -i ":$PORT" >/dev/null 2>&1; then
  cd "$DIR" || exit 1
  nohup python3 -m http.server "$PORT" >/dev/null 2>&1 &
  sleep 1
fi

open "$URL"
