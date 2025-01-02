source $HOME/.secrets
source $HOME/.aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Function to get the current git branch
git_branch()
{
  branch="$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="""/"""} {print $NF}')"
  if [ -n "$branch" ]; then
    echo "%F{green}(${branch})"
  else 
    echo ""
  fi
}

# Set up the prompt (with git branch name)
setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%F{cyan}%~%f $(git_branch) %f${NEWLINE}$ '

# Enable colors
autoload -U colors && colors

PATH=$PATH:$(go env GOPATH)/bin