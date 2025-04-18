#!/bin/bash

search_clipboard_history() {
  local CLIP_FILE=~/clipboard.log
  touch "$CLIP_FILE"

  tac "$CLIP_FILE" | fzf --prompt="📋 Clipboard History: " | pbcopy
  echo "📎 Copied to clipboard!"
}

track_clipboard_forever() {
  local CLIP_FILE=~/clipboard.log
  touch "$CLIP_FILE"
  while true; do
    pbpaste >> "$CLIP_FILE"
    sleep 2
  done
}
