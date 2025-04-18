#!/bin/bash

search_chrome_history() {
  local DB="$HOME/Library/Application Support/Google/Chrome/Default/History"
  local TMP_DB="/tmp/chrome_history_$$.db"

  [[ -f "$DB" ]] || { echo "❌ Chrome history DB not found."; return 1; }

  cp "$DB" "$TMP_DB"

  sqlite3 "$TMP_DB" "SELECT url, title FROM urls ORDER BY last_visit_time DESC LIMIT 1000;" \
  | grep -v "chrome-extension://" \
  | awk -F '|' '{ printf "%s (%s)\n", $2, $1 }' \
  | fzf --prompt="🌐 Chrome History: " \
  | sed -E 's/.*\((https?:\/\/[^)]+)\).*/\1/' \
  | xargs open

  rm "$TMP_DB"
}
