# ============================================================================
# FNM (Fast Node Manager) Configuration
# ============================================================================
# Lazy load fnm to improve shell startup time

# Function to initialize fnm when needed
_fnm_init() {
  eval "$(fnm env --use-on-cd)"
  
  # Auto-switch node version based on .node-version or .nvmrc
  autoload -U add-zsh-hook
  _fnm_autoload_hook() {
    if [[ -f .node-version || -f .nvmrc ]]; then
      fnm use --silent-if-unchanged
    fi
  }
  add-zsh-hook chpwd _fnm_autoload_hook
  _fnm_autoload_hook
}

# Lazy load fnm on first use
if command -v fnm &> /dev/null; then
  fnm() {
    unfunction fnm
    _fnm_init
    fnm "$@"
  }
  
  node() {
    unfunction node
    _fnm_init
    node "$@"
  }
  
  npm() {
    unfunction npm
    _fnm_init
    npm "$@"
  }
  
  npx() {
    unfunction npx
    _fnm_init
    npx "$@"
  }
fi
