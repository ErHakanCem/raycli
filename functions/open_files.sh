#!/bin/bash
open_files_or_dirs() {
  local target=$(find ~ -type f -o -type d 2>/dev/null | fzf --prompt="📁 Open File/Dir: ")
  [[ -n "$target" ]] && open "$target"
}
