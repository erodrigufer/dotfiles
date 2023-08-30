#!/bin/sh
# Eduardo Rodriguez [@erodrigufer] 2023 (c) 

PACKAGES="tmux go gh neovim lf difftastic node yarn direnv fzf"

# Basic apps.
brew install $(PACKAGES) && "The following packages were properly installed: $(PACKAGES)"

# Install typescript globally.
npm install --global typescript && echo "typescript was properly installed!"

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "oh-my-zsh was properly installed!"
