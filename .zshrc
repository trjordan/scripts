source $HOME/.secrets
source $HOME/.aliases
source $HOME/.login # Unnecessary, but why not

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Function to get the current git branch
git_branch() {
  branch="$(git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{FS="""/"""} {print $NF}')"
  if [ -n "$branch" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      echo "%F{red}(${branch})"
    else
      echo "%F{green}(${branch})"
    fi
  else
    echo ""
  fi
}

# Ruby noise
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.4.1

# Set up the prompt (with git branch name)
setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%F{cyan}%~%f $(git_branch) %f${NEWLINE}$ '

# Enable colors
autoload -U colors && colors

PATH=$PATH:$(go env GOPATH)/bin

source /Users/trjordan/.config/broot/launcher/bash/br
