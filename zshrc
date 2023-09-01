# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/bin:$HOME/bin/shellUtilities:$PATH:$HOME/go/bin

# Standard file editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Solve color problems when using vim-airline with tmux
export TERM="screen-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Fix bug: output shows executed command, see:
# https://stackoverflow.com/questions/30940299/zsh-repeats-command-in-output
DISABLE_AUTO_TITLE="true"

# Theme used by bat.
export BAT_THEME="gruvbox-light"

# source is a shell built-in command that executes the content of the file 
# passed as argument in the current shell.
source $ZSH/oh-my-zsh.sh

# source is a shell built-in command that executes the content of the file 
# passed as argument in the current shell.
# store personal aliases, with sensitive server and username information in this
# file, so that it is not pushed to the open repo.
source $HOME/.personalAliases

# store personal aliases, with sensitive server and username information in this
# file, so that it is not pushed to the open repo, e.g. the email in the git
# config file.
source $HOME/.secrets

# Configure email used by git (requires sourcing `~/.secrets` file).
# By running this command I am not exposing my email publically in the repo,
# since otherwise I would have to explicitly write the email in the `.gitconfig`
# file.
# IMPORTANT: This actually did not work, it copies my email to the per-user
# gitconfig file. So I had to write my email directly into the gitconfig file
# at /usr/local/etc. Maybe I find in the future another command that writes
# that file instead of the one at $HOME.
# git config --global user.email ${EMAIL_GIT}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
	# Store a temp file name
	tmp="$(mktemp)"
	# run lf with the option to store pwd at end of lf program on tmp file
	# this will store in tmp the last path inside lf, when exiting lf
	lf -last-dir-path="$tmp" "$@"
	# if the temporary file exists
	if [ -f "$tmp" ]; then
		# store the contents of tmp into the variable dir, this will be 
		dir="$(cat "$tmp")"
		# forcefully remove tmp file
		rm -f "$tmp" >/dev/null
		# if dir is a directory and it is not pwd, change to it
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

# bind '^o' = Control + o to:
# 1. clearing the line '^u' = Control + u 
# 2. opening lf in last-dir-path mode, using lfcd()
bindkey -s '^o' '^ulfcd\n'

# bind '^h' = Control + h to:
# 1. clearing the line '^u' = Control + u 
# 2. running the shell-utility script fuzzyDirectory
bindkey -s '^f' '^ufuzzyDirectory\n'

# Ctrl+space: print Git status
bindkey -s '^ ' 'git status --short\n'

# bind '^v' = Control + v to:
# 1. clearing the line '^u' = Control + u 
# 2. running the shell-utility script fuzzyFile
bindkey -s '^v' '^ufuzzyFile\n'

alias v=nvim
# e for edit
alias e=nvim

# Open file in VSC.
alias vsc='open -a Visual\ Studio\ Code'

# Git aliases
alias gg='git diff'
alias gss='git status'
alias gc='git checkout'
alias gb='git --no-pager branch'

# ls should output only one element per row and display a '/' if element is a folder
alias ls='ls -p'

# The next 2 alias were created using the book "The Linux Command Line"
# Creates the new command l. to display only files starting with "."
alias l.='ls -d .*'

# Creates the new command ll to display a long list of the files
# If an element is a folder, then the name will have a '/' at the end [-p flag]
alias ll='ls -lp'

# Add alias to open Hacker News in Lynx in the terminal
alias hn='lynx https://news.ycombinator.com'

# Catalan dictionary; execute the js file that finds catalan definition of a 
# word with node.
alias cdic='node ${HOME}/jsCmdLine/catDict/scrape.js'

# Sadly this is only working on bash and not on zsh
# Customize the shell prompt
#PS1="\u@[ESX]-\A- \W \$ "
# \u gives the current user name
# ESX stands for Eduardo Shell eXtension
# \A gives the time in 24 hour format \W
# gives the last part of the working directory and 
# \$ prints a $ if not super-user
# Export variable to make it available in the personal shell
#export PS1

# Automatically added fzf keybindings during installation of fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use fd instead of find with fzf
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CONTROL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
# Enable regex in fzf
export FZF_DEFAULT_OPS="--extended"

# Integrate direnv into zsh.
# direnv automatically detects env variables in .envrc files and loads them into
# the working environment.
eval "$(direnv hook zsh)"

# Environment variables to configure difft. 
# Check the usage of difft `difft --help` for more information.
# Display results side by side and show both.
export DFT_DISPLAY="side-by-side-show-both"
# Use a light background.
export DFT_BACKGROUND="light"
