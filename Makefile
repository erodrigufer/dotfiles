# Store local path of repo
REPO=$(PWD)

all: link

link: 
	@# Link the dotfiles in the local repo to dotfiles at ~
	@# -s: create a symbolic link
	@# -f: (force) if the target file already exists, unlink it, so that the 
	@# link can be made again
	@# Config file for zsh
	@ln -sf $(REPO)/.zshrc ~/.zshrc
	@# tmux.conf
	@ln -sf $(REPO)/.tmux.conf ~/.tmux.conf
	@# vimrc
	@ln -sf $(REPO)/.vimrc ~/.vimrc
	@# lfrc
	@# Create file directory if it does not exist
	@mkdir -p ~/.config/lf
	@ln -sf $(REPO)/lfrc ~/.config/lf/lfrc

.PHONY : link
