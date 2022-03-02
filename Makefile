# Store local path of repo
REPO=$(PWD)

all: link

link: 
	@# Link the dotfiles in the local repo to dotfiles at ~
	@# -s: create a symbolic link
	@# -f: (force) if the target file already exists, unlink it, so that the link
	@#  can occur
	@ln -sf $(REPO)/.tmux.conf ~/.tmux.conf
	@ln -sf $(REPO)/.vimrc ~/.vimrc

.PHONY : link
