#!/bin/bash

# Load functions
source "$(dirname "$0")/functions/chrome_history.sh"
source "$(dirname "$0")/functions/shell_history.sh"
source "$(dirname "$0")/functions/clipboard_history.sh"

ACTION=$(printf "🌐 Chrome History\n⌨️ Shell History\n📋 Clipboard History\n" | fzf --prompt="✨ Choose Action: ")

case "$ACTION" in
  "🌐 Chrome History") search_chrome_history ;;
  "⌨️ Shell History")  search_shell_history ;;
  "📋 Clipboard History") search_clipboard_history ;;
esac
