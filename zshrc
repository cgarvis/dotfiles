# Path to your oh-my-zsh installation.
export ZSH=/Users/cgarvis/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="chrisgarvis"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.my-zsh

# TMUX configs
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false

plugins=(gem git heroku node npm osx rails ruby sudo tmux web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
