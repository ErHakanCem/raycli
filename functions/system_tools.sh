#!/bin/bash
system_tools() {
  local choice=$(printf "💻 Activity Monitor\n🔌 System Preferences\n📦 Disk Utility\n" | fzf --prompt="⚙️ System Tools: ")
  case "$choice" in
    "💻 Activity Monitor") open -a "Activity Monitor" ;;
    "🔌 System Preferences") open -a "System Settings" ;;
    "📦 Disk Utility") open -a "Disk Utility" ;;
  esac
}
