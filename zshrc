POSTGRES_PATH="/opt/homebrew/opt/postgresql@16/bin"
export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:${POSTGRES_PATH}:$PATH

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Add homebrew zsh completions.
export FPATH=/opt/homebrew/share/zsh/site-functions:$FPATH

# Standard file editor.
export VISUAL=nvim
export EDITOR="$VISUAL"

# Solve color problems when using vim-airline with tmux.
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
export BAT_THEME="gruvbox-dark"

# source is a shell built-in command that executes the content of the file 
# passed as argument in the current shell.
source $ZSH/oh-my-zsh.sh

# Configure email used by git (requires sourcing `~/.secrets` file).
# By running this command I am not exposing my email publically in the repo,
# since otherwise I would have to explicitly write the email in the `.gitconfig`
# file.
# IMPORTANT: This actually did not work, it copies my email to the per-user
# gitconfig file. So I had to write my email directly into the gitconfig file
# at /usr/local/etc. Maybe I find in the future another command that writes
# that file instead of the one at $HOME.
# git config --global user.email ${EMAIL_GIT}

# Shell wrapper that provides the ability to change the current 
# working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source ~/.aliases.sh

# Fetch weather information.
# Use the first user input as the city for which the weather information
# is desired. 
# No user input defaults to the city that wttr.in determines through your IP.
clima() {
  curl "v2.wttr.in/$1"
}

# Print help pages with bat.
help() {
    "$@" --help 2>&1 | bat --plain --language=help
}

# Integrate direnv into zsh.
# direnv automatically detects env variables in .envrc files and loads them into
# the working environment.
eval "$(direnv hook zsh)"

# Environment variables to configure difft. 
# Check the usage of difft `difft --help` for more information.
# Display results side by side and show both.
export DFT_DISPLAY="side-by-side-show-both"
# Use a light background.
export DFT_BACKGROUND="dark"

# z - replacement for cd.
source /opt/homebrew/etc/profile.d/z.sh

# Chage colors by eza (see `man eza_colors`).
# da = date 
# gm = git-modified flag
export EZA_COLORS="da=90:gm=32"

# Integrate z with fzf.
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
# Remap z aliases.
alias j=z

source ~/.nvm.sh

# Anthropic API key for avante.nvim plugin.
source ~/.anthropic.env

# Source zsh-vi-mode plugin.
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# zsh-vi-mode will auto execute this zvm_after_init function
# Since the default initialization mode, this plugin will overwrite the previous key bindings, 
# this causes the key bindings of other plugins (i.e. fzf, zsh-autocomplete, etc.) to fail.
function zvm_after_init() {
  # bind '^o' = Control + o to:
  # 1. clearing the line '^u' = Control + u 
  # 2. opening yazi in last-dir-path mode, using y()
  bindkey -s '^o' '^uy\n'

  bindkey -s '^ ' '^unvim $(fzf --multi --preview "bat --color=always --style=plain {}")\n'

  bindkey -s '^n' 'clear\n'

  bindkey -s '^k' 'lazygit\n'

  # Automatically added fzf keybindings during installation of fzf
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  # Use fd instead of find with fzf
  export FZF_DEFAULT_COMMAND="fd --type f --color=never" 
  # Enable regex in fzf
  export FZF_DEFAULT_OPS="--extended --no-height"
  export FZF_CONTROL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
  export FZF_CTRL_T_OPTS="--no-height --preview 'bat --color=always --line-range :50 {}'"
  # Alt key is <Esc+C> in Mac OS X.
  # See: https://github.com/junegunn/fzf/issues/164
  export FZF_ALT_C_COMMAND='fd --type d . --color=never'
  export FZF_ALT_C_OPTS="--no-height --preview 'tree -C {} | head -50'"

}

# -------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------
# Fish-like syntax highlighting for zsh.
# Must be sourced at the end as of installation guide!
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
