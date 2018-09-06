# --------------------
# PATH
# --------------------
export PATH=$HOME/.cask/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# --------------------
# hist
# --------------------
HISTSIZE=100000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# --------------------
# bash_completion
# --------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# --------------------
# ls Aliases
# --------------------
alias ls='ls -G'
alias ll='ls -GlF'
alias la='ls -GaF'

# --------------------
# Intelli J Aliase
# --------------------
alias ij='open -b com.jetbrains.intellij'

# --------------------
# Git Aliases
# --------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gdm='git branch -m'
alias gdr='git branch -r'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcod='git checkout develop'
alias gcodp='git checkout develop && git pull --rebase origin develop'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gp='git pull'
alias gs='git status'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'

# --------------------
# Git Function
# --------------------
function glf() { git log --all --grep="$1"; }

# --------------------
# GIT PS1
# --------------------
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\W\[\033[37m\]]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
