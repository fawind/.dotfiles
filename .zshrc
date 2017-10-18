# Oh-my-zsh
export ZSH=/home/fabian/.oh-my-zsh

DEFAULT_USER="fabian"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(z vi-mode)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# Custom programs
export PATH="/home/$USER/.bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Tmux bell when command finishes
precmd () {
  echo -n -e "\a"
}

# Aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gits="git status"
alias gitd="git diff"
alias gitc="git commit -m"
alias gita="git add -A"
alias gitca="git commit --amend"
alias gitco="git checkout"
alias gitl="git log --pretty=format:\"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]\" --decorate"
alias gitll="git log --pretty=format:\"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]\" --decorate --numstat"
alias tms="~/.config/tmux/startTmux.sh"
alias pss="pass show -c"
