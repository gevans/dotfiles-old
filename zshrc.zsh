export DOTFILES=$HOME/Code/dotfiles

# Path to your oh-my-zsh configuration.
ZSH=$DOTFILES/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gevans"

# Set executables PATH
export PATH="$HOME/bin:$HOME/pear/bin:$PATH"

# Set editor
export EDITOR="subl -w"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ls="ls -G"
#alias git="hub"
#hub alias -s zsh
function git() { hub "$@" }

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler gem git-flow heroku rvm vagrant projects)

PLATFORM=`uname`

if [[ $PLATFORM == "Darwin" ]] ; then
  PLATFORM=osx
elif [[ $PLATFORM == "Linux" ]] ; then
  PLATFORM=linux
fi

# Load platform-specific configurations
[[ -s "$DOTFILES/platforms/$PLATFORM.zsh" ]] && source "$DOTFILES/platforms/$PLATFORM.zsh"

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

__rvm_project_rvmrc

# Override upgrade_oh_my_zsh to pull upstream changes
function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $DOTFILES/tools/upgrade.sh
}
