# Path to the oh-my-zsh installation
export ZSH=/home/fabian/.oh-my-zsh

DEFAULT_USER="fabian"

ZSH_THEME="agnoster"

# Use case-sensitive completion
# CASE_SENSITIVE="true"

# Use hyphen-insensitive completion
# Case sensitive must be off. _ and - will be interchangeable
# HYPHEN_INSENSITIVE="true"

# Disable auto-setting terminal title
# DISABLE_AUTO_TITLE="true"

# Auto-correciton
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Override custom folder
# ZSH_CUSTOM=/path/to/new-custom-folder

# Load plugins
plugins=(z sudo)


# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/tools:$PATH


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gits="git status"
alias subl="subl3"
alias vi="vim"
alias v="vim"
alias qq="exit"
