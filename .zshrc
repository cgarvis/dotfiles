export ZSH=/root/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="chrisgarvis"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.my-zsh

# TMUX configs
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false

plugins=(aws debian docker gem git heroku node npm osx pip rails ruby sudo tmux web-search yarn)

source $ZSH/oh-my-zsh.sh

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# USe vim as the editor
export EDITOR='vim'

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Aliases
alias c="cd"
