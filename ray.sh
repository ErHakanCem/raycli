#!/bin/bash

# Ensure gum and fzf are installed
command -v fzf >/dev/null || { echo "fzf is not installed"; exit 1; }
command -v gum >/dev/null || { echo "gum is not installed"; exit 1; }

# Title (like Raycast search)
gum style --foreground 212 --border double --margin "1 2" --padding "1 2" --align center "🚀 Quick Command Launcher"

# List of actions
ACTION=$(printf "%s\n" \
  "📝 Open Logseq" \
  "🔍 Search Files" \
  "📁 Open Downloads" \
  "📋 Copy Date to Clipboard" \
  "🌐 Open Google" \
  "🛑 Shutdown Prompt" \
  | fzf --prompt="Select Action: " --height=40% --border)

# Handle selection
case "$ACTION" in
  "📝 Open Logseq")
    open -a "Logseq"
    ;;

  "🔍 Search Files")
    QUERY=$(gum input --placeholder "Enter search term")
    rg "$QUERY" ~
    ;;

  "📁 Open Downloads")
    open ~/Downloads
    ;;

  "📋 Copy Date to Clipboard")
    date "+%Y-%m-%d" | pbcopy
    echo "📅 Date copied to clipboard!"
    ;;

  "🌐 Open Google")
    open "https://google.com"
    ;;

  "🛑 Shutdown Prompt")
    CONFIRM=$(gum confirm "Really shut down?")
    [ "$CONFIRM" = "true" ] && sudo shutdown -h now
    ;;
esac

