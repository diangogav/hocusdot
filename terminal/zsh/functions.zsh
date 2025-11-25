# ============================================================================
# Useful Functions for Zsh
# ============================================================================

# Create directory and cd into it
mkcd() {
  if [[ -z "$1" ]]; then
    echo "Usage: mkcd <directory>"
    return 1
  fi
  mkdir -p "$1" && cd "$1"
}

# Extract any compressed file
extract() {
  if [[ -z "$1" ]]; then
    echo "Usage: extract <file>"
    return 1
  fi
  
  if [[ ! -f "$1" ]]; then
    echo "Error: '$1' is not a valid file"
    return 1
  fi
  
  case "$1" in
    *.tar.bz2)   tar xjf "$1"     ;;
    *.tar.gz)    tar xzf "$1"     ;;
    *.tar.xz)    tar xJf "$1"     ;;
    *.bz2)       bunzip2 "$1"     ;;
    *.rar)       unrar x "$1"     ;;
    *.gz)        gunzip "$1"      ;;
    *.tar)       tar xf "$1"      ;;
    *.tbz2)      tar xjf "$1"     ;;
    *.tgz)       tar xzf "$1"     ;;
    *.zip)       unzip "$1"       ;;
    *.Z)         uncompress "$1"  ;;
    *.7z)        7z x "$1"        ;;
    *)           echo "Error: '$1' cannot be extracted via extract()" ;;
  esac
}

# Search history with fzf and execute
h() {
  eval $(history | fzf --tac --no-sort | sed 's/^ *[0-9]* *//')
}

# Visual git status with colors and icons
git-status-visual() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  
  # Get current branch
  local branch=$(git branch --show-current 2>/dev/null)
  if [[ -n "$branch" ]]; then
    echo "🌿 Branch: $branch"
  else
    echo "⚠️  Not a git repository"
    return 1
  fi
  
  # Show status
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  git status --short --branch
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
}

# Zoxide with preview
zoxide-preview() {
  local dir=$(zoxide query -l | fzf \
    --prompt="📂 Jump to > " \
    --preview='lsd --tree --depth 2 --color=always {}' \
    --preview-window=right:50% \
    --height=80% \
    --layout=reverse)
  
  if [[ -n "$dir" ]]; then
    cd "$dir"
  fi
}

# Find and kill process by name
killport() {
  if [[ -z "$1" ]]; then
    echo "Usage: killport <port>"
    return 1
  fi
  
  local pid=$(lsof -ti:$1)
  if [[ -n "$pid" ]]; then
    kill -9 $pid
    echo "✓ Killed process on port $1"
  else
    echo "⚠️  No process found on port $1"
  fi
}

# Quick backup of a file
backup() {
  if [[ -z "$1" ]]; then
    echo "Usage: backup <file>"
    return 1
  fi
  
  cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
  echo "✓ Backup created: $1.backup.$(date +%Y%m%d_%H%M%S)"
}

# Find files by name
ff() {
  find . -type f -iname "*$1*" 2>/dev/null
}

# Find directories by name
fd() {
  find . -type d -iname "*$1*" 2>/dev/null
}
