# Store local path of repo
REPO=$(PWD)

all: link

link: 
	@# Link the dotfiles in the local repo to dotfiles at ~
	@# -s: create a symbolic link
	@# -f: (force) if the target file already exists, unlink it, so that the 
	@# link can be made again.
	@# Config file for zsh
	@ln -sf $(REPO)/zshrc ~/.zshrc
	@# File with zsh aliases.
	@ln -sf $(REPO)/aliases.sh ~/.aliases.sh
	@ln -sf $(REPO)/nvm.sh ~/.nvm.sh
	@# .gitconfig
	@ln -sf $(REPO)/gitconfig ~/.gitconfig
	@# tmux.conf
	@ln -sf $(REPO)/tmux.conf ~/.tmux.conf
	@# nvim
	@mkdir -p ~/.config
	@rm -rf ~/.config/nvim
	@ln -sf $(REPO)/nvim ~/.config/nvim
	@# lfrc
	@# Create file directory if it does not exist
	@mkdir -p ~/.config/lf
	@ln -sf $(REPO)/lfrc ~/.config/lf/lfrc
	@ln -sf $(REPO)/psqlrc ~/.psqlrc

.PHONY : link
