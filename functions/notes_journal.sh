#!/bin/bash
launch_notes_or_journal() {
  local NOTES_DIR=~/Documents/notes
  mkdir -p "$NOTES_DIR"
  local file=$(ls "$NOTES_DIR" 2>/dev/null | fzf --prompt="🧠 Notes/Journal: ")
  [[ -n "$file" ]] && open "$NOTES_DIR/$file"
}
