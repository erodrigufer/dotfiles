#!/bin/sh
# Eduardo Rodriguez [@erodrigufer] 2023 (c) 

PACKAGES="tmux go gh neovim lf difftastic node yarn direnv fzf act glow"

# Basic apps.
brew install $(PACKAGES) && "The following packages were properly installed: $(PACKAGES)"

# To install useful key bindings and fuzzy completion for fzf:
$(brew --prefix)/opt/fzf/install

# Install typescript globally.
npm install --global typescript && echo "typescript was properly installed!"

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "oh-my-zsh was properly installed!"
