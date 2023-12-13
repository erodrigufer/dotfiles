# Home 
alias h='cd'

alias ..='cd ..'

# Copy to clipboard.
alias clip=pbcopy

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

# brew aliases.
alias update="brew update && brew upgrade && brew upgrade --cask --greedy"
