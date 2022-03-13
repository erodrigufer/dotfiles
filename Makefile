# Store local path of repo
REPO=$(PWD)

all: link

link: 
	@# Link the dotfiles in the local repo to dotfiles at ~
	@# -s: create a symbolic link
	@# -f: (force) if the target file already exists, unlink it, so that the link
	@#  can occur
	@# tmux.conf
	@ln -sf $(REPO)/.tmux.conf ~/.tmux.conf
	@# vimrc
	@ln -sf $(REPO)/.vimrc ~/.vimrc
	@# lfrc
	@ln -sf $(REPO)/lfrc ~/.config/lf/lfrc

.PHONY : link
