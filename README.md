6. Install LSP. Currently Tailwind via npm and elixirls/elixir-ls built locally

# System Setup

## Setup Github SSH Key

[Adding your SSH key to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Download Dotfiles

```
git init
git remote add origin git@github.com:cgarvis/dotfiles.git
git fetch
git checkout nvim
```

## Install Applications

Use [brew](https://brew.sh).

```
brew install rectangle --cask
brew install neovim
brew install tmux
brew install node
brew install fzf
brew install ripgrep
brew install asdf
brew install eza

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

## Setup Shell

```
brew install zsh
```

Open the file below

```
sudo vi /etc/shells
```

add `/usr/local/bin/zsh` to the list.

Now that /user/local/bin/zsh is added, change the default terminal to use that one instead.

```
chsh -s /usr/local/bin/zsh
```

## Install Nerd Fonts

```
brew tap homebrew/cask-fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
```

Set iTerm's Font to `Hack Nerd Font Mono`.

## Install iTerm2 theme

[Nord](https://github.com/nordtheme/iterm2?tab=readme-ov-file)

## Setup VIM

1. Install [Packer](https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart)

```
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

2. Install LSPs

```
npm install -g @tailwindcss/language-server
brew install elixir-ls
```
