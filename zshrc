ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.my-zsh
ZSH_THEME=moveline

plugins=(brew cake gem git heroku node npm osx ruby)

source ~/.oh-my-zsh/oh-my-zsh.sh

if [ -f ~/.localrc ]; then
    source ~/.localrc
fi
