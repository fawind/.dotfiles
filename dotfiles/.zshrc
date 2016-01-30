# Oh-my-zsh
export ZSH=/home/fabian/.oh-my-zsh

DEFAULT_USER="fabian"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(z sudo)


# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# Custom programs
export PATH="/home/$USER/.bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Android
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/tools:$PATH

# Aliases
alias gits="git status"
alias gitc="git commit -m"
alias gita="git add -A"
alias gitl="git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
alias gitll="git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --numstat"
alias vi="vim"
alias v="vim"
alias emacs=vim
