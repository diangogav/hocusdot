# Dotfiles Installation

Modern dotfiles configuration using [Dotbot](https://github.com/anishathalye/dotbot).

## Quick Install

```bash
cd ~/.dotfiles
./install
```

## What Gets Installed

### Symlinks
- **Zsh**: `~/.zshrc`, `~/.zshenv`
- **Git**: `~/.gitconfig`
- **Starship**: `~/.config/starship.toml`
- **VS Code**: Settings, keybindings, snippets
- **Cursor**: Shared config with VS Code
- **Warp**: Pixel Art theme

### Tools (Auto-installed if missing)
- ✅ Ollama (local AI)
- ✅ direnv (environment variables)
- ✅ fnm (Node.js version manager)
- ✅ zoxide (smart cd)
- ✅ starship (prompt)
- ✅ bat (cat replacement)
- ✅ lsd (ls replacement)
- ✅ fzf (fuzzy finder)
- ✅ git-delta (git diffs)
- ✅ lazygit (git TUI)

## Manual Steps

After installation:

1. **Reload shell**:
   ```bash
   source ~/.zshrc
   ```

2. **Install VS Code/Cursor extensions**:
   ```bash
   scripts/vscode/install-extensions
   ```

3. **Download Ollama models** (optional):
   ```bash
   ollama pull llama3
   ollama pull codellama
   ```

## Updating

```bash
cd ~/.dotfiles
git pull
./install
```

## Rollback

If something breaks:
```bash
cd ~/.dotfiles
git checkout HEAD~1
./install
```

## Structure

```
.dotfiles/
├── install              # Dotbot installer
├── install.conf.yaml    # Installation config
├── terminal/
│   ├── zsh/            # Zsh configuration
│   ├── starship/       # Starship themes
│   ├── warp/           # Warp terminal theme
│   ├── ai/             # Ollama AI config
│   └── nodejs/         # fnm, npm config
├── git/                # Git configuration
├── vscode/             # VS Code/Cursor config
└── scripts/            # Utility scripts
```
