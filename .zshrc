# Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="windheuserfabian"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(z bgnotify zsh-syntax-highlighting)

# Export display for Crostini
export DISPLAY=:0

# Custom programs
export PATH="/home/$USER/.bin:/home/$USER/.local/bin:$PATH"
export VISUAL=nvim
export EDITOR="$VISUAL"

# GoPath
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Tmux bell when command finishes
precmd () {
  echo -n -e "\a"
}

# Aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# Git
alias gits="git status"
alias gitd="git diff"
alias gitc="git commit -m"
alias gita="git add -A"
alias gitca="git commit --amend"
alias gitco="git checkout"
alias gitl="git log --pretty=format:\"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]\" --decorate"
alias gitll="git log --pretty=format:\"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]\" --decorate --numstat"
# Programs
alias tms="~/.config/tmux/startTmux.sh"
alias pss="pass show -c"
alias vim="nvim"
