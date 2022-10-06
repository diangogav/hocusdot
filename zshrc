# Set up the prompt

autoload -Uz promptinit
promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Environment Variables

# Dotfiles directory
export DOTFILES_PATH="$HOME/.dotfiles"

# Add scripts folder
# export PATH="$PATH:$DOTFILES_PATH/scripts/:"
export PATH=~/.dotfiles/scripts:${PATH}
export PATH="$PATH:$HOME/.local/bin"

# Load aliases file
source $DOTFILES_PATH/aliases

# Load Starship
eval "$(starship init zsh)"

# load ZSH completions
source $DOTFILES_PATH/completion.zsh

# ZSH Plugins
source $DOTFILES_PATH/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_PATH/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH Configurations
set -o noclobber #ensure that shell redirection will not overwrite existing files

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


_reverse_search() {
  local selected_command=$(fc -rl 1 | awk '{$1="";print substr($0,2)}' | fzf)
  LBUFFER=$selected_command
}

zle -N _reverse_search
bindkey '^r' _reverse_search