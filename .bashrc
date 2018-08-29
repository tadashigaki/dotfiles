export PATH=$PATH:$HOME/.cask/bin
export PATH=$PATH:$HOME/.nodebrew/current/bin

HISTSIZE=100000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# aliases
alias ls='ls -G'
alias ll='ls -GlaF'
alias ij='open -b com.jetbrains.intellij'

# git ps1
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\W\[\033[37m\]]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
