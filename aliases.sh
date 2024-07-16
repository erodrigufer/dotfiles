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

# Interactively search for a file with fzf.
# File is then opened by nvim.
alias i='nvim $(fzf --multi --preview "bat --color=always --style=plain {}")'

# ChatGPT command line integration.
alias c='maguet c -p'

# Send notification as banner and audio message.
# Audio message changes depending on returned status code.
function create_notification() {
  RETURNED_CODE=$?
  if [ ${RETURNED_CODE} -eq 0 ]
  then 
    SPEECH="Successfully done with command line task."
  else
    SPEECH="An error occured."
  fi

  terminal-notifier -title "Terminal" -message "Done with CLI task! Exit status: ${RETURNED_CODE}"; say ${SPEECH}
}
alias n='create_notification'

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
alias gm="git checkout main && git pull"

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

# direnv aliases.
alias de='direnv edit'

# brew aliases.
alias update="brew update && brew upgrade && brew upgrade --cask --greedy"
# Show what would be updated without updating anything.
alias fetch_update="brew update && brew upgrade --dry-run"
