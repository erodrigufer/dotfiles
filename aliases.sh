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

# xh - curl replacement
alias http='xh'

# Send notification as banner and audio message.
# Audio message changes depending on returned status code.
function create_notification() {
  RETURNED_CODE=$?
  repo_name="$(basename "$(git rev-parse --show-toplevel)")" 2> /dev/null
  ERROR_IN_REPO_NAME=$?
  if [ ${ERROR_IN_REPO_NAME} -ne 0 ]
  then
    repo_name=""
  fi
  if [ ${RETURNED_CODE} -eq 0 ]
  then 
    SPEECH="${repo_name} Successfully done with command line task."
  else
    SPEECH="${repo_name} An error occured."
  fi

  terminal-notifier -title "Terminal" -message "Done with CLI task! Exit status: ${RETURNED_CODE}"; say "${SPEECH}"
}
alias n='create_notification'

# Git aliases.
alias gg='gh action ; n'
alias lg="lazygit"
# Turn GPG for local git repo on or off.
# Sometimes it is required to turn GPG off to 
# use some functionality of lazygit that only works 
# with no GPG.
function turn_off_gpg(){
  git config tag.gpgSign false
  git config commit.gpgSign false
};
function turn_on_gpg(){
  git config tag.gpgSign true
  git config commit.gpgSign true
};
alias gpg_off="turn_off_gpg"
alias gpg_on="turn_on_gpg"

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
