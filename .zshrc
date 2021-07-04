# --------------------
# PATH
# --------------------
export PATH=$HOME/.cask/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH

# --------------------
# hist
# --------------------
HISTSIZE=100000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# --------------------
# ls Aliases
# --------------------
alias ls='ls -G'
alias ll='ls -GlF'
alias la='ls -GaF'

# --------------------
# grep Aliases
# --------------------
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'
alias grep='ggrep'

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
alias gbm='git branch -m'
alias gbr='git branch -r'
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
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'

# --------------------
# Terraform Aliases
# --------------------
alias tf='terraform'

# --------------------
# Git Function
# --------------------
function glf() { git log --all --grep="$1"; }

# --------------------
# GIT PS1
# --------------------
PROMPT="%{${fg[blue]}%}%~%{${reset_color}%}"
RPROMPT=

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT=$PROMPT' ${vcs_info_msg_0_}> '

# --------------------
# tmux
# --------------------
if [ "$SHLVL" = 1 ]; then tmux attach || tmux new; fi
export TERM=xterm-256color

# --------------------
# env
# --------------------
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;36m") \
        LESS_TERMCAP_md=$(printf "\e[1;36m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# --------------------
# GOLANG
# --------------------
export PATH=/usr/local/bin/go/bin:$PATH
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GO15VENDOREXPERIMENT=1

# --------------------
# MySQL Client
# --------------------
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# --------------------
# Rust
# --------------------
export PATH="$HOME/.cargo/bin:$PATH"

# --------------------
# anyenv
# --------------------
eval "$(anyenv init -)
export PATH="$HOME/.anyenv/bin:$PATH""

# --------------------
# kubectl
# --------------------
alias k=kubectl

# --------------------
# ZSH
# --------------------
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit
compinit -u
