# 🎮 Modern Dotfiles

> A pixel art themed, highly functional development environment

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

### 🏥 System Health
- **Health Check**: Comprehensive system verification (`health-check`)
- **Auto Updates**: Keep everything up to date (`update-all`)
- **Backup**: Automated dotfiles backup (`backup`)

### 📋 50+ Smart Aliases
- **Git**: `gst`, `glog`, `ga`, `gc`, `gp`, `gl`
- **Docker**: `dps`, `dimg`, `dclean`, `dstop`
- **System**: `ports`, `myip`, `speedtest`
- **Files**: `ll`, `la`, `lt` (with lsd)

### 🔧 10 Useful Functions
- `mkcd <dir>` - Create and enter directory
- `extract <file>` - Universal archive extractor
- `h` - History search with fzf
- `gst` - Beautiful git status
- `zz` - Zoxide with preview
- `killport <port>` - Kill process by port
- `bak <file>` - Quick file backup
- `ff/fd` - Find files/directories

### 🎨 Pixel Art Theme
- **Starship**: Retro gaming prompt
- **Warp**: Custom pixel art theme
- **Colors**: Vibrant 8-bit palette

### 🤖 AI Integration
- **Ollama**: Local AI assistant
- Aliases: `ai`, `code-ai`

## 🚀 Quick Start

```bash
cd ~/.dotfiles
./install
source ~/.zshrc
```

## 📦 Tools Included

| Tool | Purpose | Command |
|------|---------|---------|
| **Zsh** | Shell | `zsh` |
| **Starship** | Prompt | Auto |
| **Zinit** | Plugin Manager | Auto |
| **FZF** | Fuzzy Finder | `fzf` |
| **Bat** | Cat replacement | `bat` |
| **LSD** | Ls replacement | `lsd` |
| **Zoxide** | Smart cd | `z` |
| **Delta** | Git diffs | Auto |
| **Lazygit** | Git TUI | `lazygit` |
| **FNM** | Node manager | `fnm` |
| **Direnv** | Env vars | Auto |
| **Ollama** | Local AI | `ai` |
| **TLDR** | Quick help | `tldr` |

## 🎯 Key Commands

```bash
# Browse and run scripts
spellbook

# Check system health
health-check

# Beautiful git status
gst

# Search history
h

# Jump to directory
z <dir>
zz  # with preview

# Quick help
tldr <command>

# AI assistance
ai "your question"
code-ai "coding question"
```

## 📁 Structure

```
.dotfiles/
├── install              # Dotbot installer
├── install.conf.yaml    # Installation config
├── terminal/
│   ├── zsh/            # Zsh configuration
│   ├── starship/       # Starship themes
│   ├── warp/           # Warp terminal
│   ├── ai/             # Ollama config
│   └── aliases         # All aliases
├── git/                # Git configuration
├── vscode/             # VS Code/Cursor
└── scripts/            # Utility scripts
    ├── health-check    # System verification
    ├── update-system   # Update everything
    ├── backup-dotfiles # Backup to git
    └── welcome-banner  # Terminal greeting
```

## 🔄 Updates

```bash
# Update dotfiles
cd ~/.dotfiles
git pull
./install

# Update all tools
update-all
```

## 🎨 Customization

### Change Starship Theme
Edit `terminal/starship/starship.toml`

### Add Aliases
Edit `terminal/aliases`

### Add Functions
Edit `terminal/zsh/functions.zsh`

### Add Scripts
Add executable files to `scripts/` directory

## 🐛 Troubleshooting

```bash
# Verify installation
health-check

# Reload configuration
reload

# Check specific tool
command -v <tool>
```

## 📝 License

MIT License - feel free to use and modify!

## 🙏 Credits

Built with:
- [Starship](https://starship.rs/)
- [Zinit](https://github.com/zdharma-continuum/zinit)
- [Dotbot](https://github.com/anishathalye/dotbot)
- And many other amazing open source tools!
