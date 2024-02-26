# Home 
alias h='cd'

alias ..='cd ..'

# Copy to clipboard (Mac OS X).
alias copy=pbcopy

# Killing vim.
alias vim=nvim

alias v=nvim
# e for edit.
alias e=nvim

alias fb='nvim +"Telescope file_browser"'

# Send notification as banner and audio message.
alias n='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?"; say "Done with command line task"'

# Git aliases.
alias gg='git diff'
alias gss='git status'
# 'gb': Output the current local branches without accessing a pager.
alias gb='git --no-pager branch'
alias gl='ga -l'
# fzf through local branches.
function git_checkout() {
  if [ $# -eq 0 ]
  then
    git checkout $(git branch | fzf)
  else
    git checkout $@
  fi
};
alias gc="git_checkout"
alias gp="git pull"
alias lg="lazygit"

# Docker aliases.
alias ldr="lazydocker"

# eza aliases.
alias l.='eza --long --all --list-dirs --icons --git .*'
alias ls='eza --icons --oneline'
alias ll='eza --long --group --icons --git'
alias lt='eza --icons --tree'
alias la='eza --long --all --group --icons --git'

# Terraform aliases.
alias tf='terraform'
alias tfw='terraform workspace'
alias tfl='terraform workspace list'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfd='terraform destroy'
alias tfda='terraform apply -destroy -auto-approve'
alias tfp='terraform plan'
alias tff='terraform fmt'
alias tfi='terraform init -upgrade'

# tmux aliases.
function create_new_tmux_session() {
  session_name="$@"
  if [[ -z "$session_name" ]]; then
    echo "No name was provided for the new tmux session!"
    return 1
  fi

  # Check if a tmux session exists with a given name.
  tmux has-session -t=$session_name 2> /dev/null

  # Create the session if it doesn't exists.
  if [[ $? -ne 0 ]]; then
    TMUX='' tmux new-session -d -s "$session_name"
  else
    echo "A tmux session with the provided name already exists!"
    return 1
  fi

  # Attach if outside of tmux, switch if you're in tmux.
  if [[ -z "$TMUX" ]]; then
    tmux attach -t "$session_name"
  else
    tmux switch-client -t "$session_name"
  fi
}
alias tmn="create_new_tmux_session"

# brew aliases.
alias update="brew update && brew upgrade && brew upgrade --cask --greedy"
