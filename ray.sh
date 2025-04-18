#!/bin/bash
command -v fzf >/dev/null || { echo "fzf is not installed"; exit 1; }
command -v gum >/dev/null || { echo "gum is not installed"; exit 1; }

# Main Menu
MAIN=$(printf "\U0001F4C1 Files\n\U0001F9E0 Notes\n\U0001F4CB Clipboard\n⚙️ System\n\U0001F30D Web\n" | fzf --prompt="Choose category: ")

case "$MAIN" in
  "\U0001F4C1 Files")
    ACTION=$(printf "Open Downloads\nFind Recent Files\n" | fzf)
    case "$ACTION" in
      "Open Downloads") open ~/Downloads ;;
      "Find Recent Files") find ~ -type f -mtime -2 | fzf ;;
    esac
    ;;
  "\U0001F9E0 Notes")
    ACTION=$(printf "Open Journal\nCreate New Note\nSearch Notes\n" | fzf)
    case "$ACTION" in
      "Open Journal") open ~/logseq/journals/$(date +%Y-%m-%d).md ;;
      "Create New Note")
        TITLE=$(gum input --placeholder "Note title")
        touch ~/notes/"$TITLE.md" && open ~/notes/"$TITLE.md"
        ;;
      "Search Notes")
        rg "$(gum input --placeholder 'search term')" ~/notes
        ;;
    esac
    ;;
  "\U0001F4CB Clipboard")
    ACTION=$(printf "Show Clipboard\nCopy Date\n" | fzf)
    case "$ACTION" in
      "Show Clipboard") pbpaste | gum pager ;;
      "Copy Date") date "+%Y-%m-%d" | pbcopy && echo "\U0001F4C5 Date copied!" ;;
    esac
    ;;
  "⚙️ System")
    ACTION=$(printf "Battery Status\nDisk Usage\nRAM Info\n" | fzf)
    case "$ACTION" in
      "Battery Status") pmset -g batt ;;
      "Disk Usage") df -h ;;
      "RAM Info") vm_stat ;;
    esac
    ;;
  "\U0001F30D Web")
    ACTION=$(printf "Open Google\nOpen GitHub\n" | fzf)
    case "$ACTION" in
      "Open Google") open https://google.com ;;
      "Open GitHub") open https://github.com ;;
    esac
    ;;
esac
