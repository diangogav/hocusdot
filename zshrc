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
export PATH="$PATH:$DOTFILES_PATH/scripts/:"

# Load aliases file
source $DOTFILES_PATH/aliases

# Load Starship
eval "$(starship init zsh)"

# ZSH Plugins
source $DOTFILES_PATH/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_PATH/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
