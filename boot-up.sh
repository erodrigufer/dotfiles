#!/bin/sh
# Eduardo Rodriguez [@erodrigufer] 2023 (c) 

PACKAGES="tmux go gh neovim lf difftastic node yarn direnv fzf act glow fd ripgrep bat tree z eza tfenv awscli urlview zsh-syntax-highlighting shellcheck"

which brew > /dev/null || { echo "brew must be installed in the system!"; exit 1 ; }

# Update the information about packages and brew itself.
brew update

# Basic apps.
brew install "${PACKAGES}" && "The following packages were properly installed: ${PACKAGES}"

# To install useful key bindings and fuzzy completion for fzf:
$(brew --prefix)/opt/fzf/install

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "oh-my-zsh was properly installed!"

## Requirements for nvim
# Install nerd font
brew tap homebrew/cask-fonts && brew install font-hack-nerd-font
# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install TS tools.
npm install -g typescript-language-server typescript prettier

## tmux
# Install tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install config files of this repo with make.
make
