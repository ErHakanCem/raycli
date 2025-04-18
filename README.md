# RayCLI

`raycli` is a lightweight and modular terminal-based productivity tool inspired . It provides a simple launcher to quickly access powerful search utilities using `fzf`, including:

## ✨ Features

### 1. 🌐 Chrome History Search
Search and open recently visited websites from your Google Chrome history using `fzf`.

### 2. ⌨️ Shell Command History
Browse and copy your shell command history (supports `zsh` by default, can be adjusted for Bash).

### 3. 📋 Clipboard History
Keep a rolling log of your clipboard contents and search through it.

---

## 🚀 Getting Started

### 1. Prerequisites

- `fzf` (fuzzy finder)
- `sqlite3`
- `pbcopy`, `pbpaste` (macOS clipboard utilities)
- `open` command (macOS)
- Google Chrome installed

### 2. Installation

```bash
unzip raycli.zip
cd raycli
chmod +x ray.sh functions/*.sh
./ray.sh
```

---

## 🧠 Suggested Improvements

Here are ideas to grow `raycli` into a more powerful tool:

### 🔧 Functional

- [ ] Add Safari browser history support
- [ ] Support for Bash history and `fish` shell
- [ ] Clipboard manager daemon with duplication detection
- [ ] Quick Launcher for local files/apps using `mdfind` or `spotlight`

### 🌐 Web API Integrations

- [ ] GPT/AI assistant using `curl` + OpenAI API
- [ ] Google search shortcut with `ddgr` or `googler`

### 📦 Packaging

- [ ] Turn into Homebrew formula for easy install
- [ ] Create `.app` wrapper to launch from Spotlight

### 💻 UI

- [ ] Use `gum` or `dialog` for richer UI
- [ ] Color themes and icons for each action
- [ ] Keyboard shortcuts to speed up launch

---

## 🤝 Contributing

Feel free to fork and improve. This repo aims to be beginner-friendly for shell scripting learners and productivity tool enthusiasts.

---

## 📂 Structure

```
raycli/
├── ray.sh                  # Main launcher
└── functions/
    ├── chrome_history.sh   # Google Chrome history search
    ├── shell_history.sh    # Shell command history
    └── clipboard_history.sh# Clipboard history search + logger
```

---

Happy hacking!
