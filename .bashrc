# use .rvm for settings if one exists
if [ -d ~/.rvm ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

if [ -z "$GOPATH"]; then
    PATH=$PATH:$GOPATH/bin
fi

if [ -f ~/.mix/escripts ]; then
    PATH=$PATH:.mix/escripts
fi

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
