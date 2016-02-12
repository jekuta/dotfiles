# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gits='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias go='git checkout '
alias gk='gitk --all&'

# development aliases
alias be='bundle exec'
alias grbs='rubocop -a `git diff --name-only --cached | grep '\.rb'`'
