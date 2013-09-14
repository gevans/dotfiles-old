DOTFILES=$HOME/Code/dotfiles

# Path to your oh-my-zsh configuration.
ZSH=$DOTFILES/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gevans"

# Add npm executables
PATH="/usr/local/share/npm/bin:$PATH"

# Set $HOME executables PATHs
PATH="$HOME/bin:$HOME/pear/bin:$PATH"

# Set editor
export EDITOR="vim"

# Set timezone
export TZ="America/Los_Angeles"

# Disable oh-my-zsh title updating for tmux
export DISABLE_AUTO_TITLE=true

# Ensure Rubinius runs in 1.9 mode
export RBXOPT=-X19

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ls="ls -G"
#alias git="hub"
#hub alias -s zsh
function git() { hub "$@"; }

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

# Add zsh-completions
# Note: You may also need to force rebuild `zcompdump`:
#   $ rm -f ~/.zcompdump; compinit
fpath=(/usr/local/share/zsh-completions $fpath)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler gem git-flow heroku vagrant projects eifion knife)

PLATFORM=`uname`

if [[ $PLATFORM == "Darwin" ]] ; then
  PLATFORM=osx
elif [[ $PLATFORM == "Linux" ]] ; then
  PLATFORM=linux
fi

# Load platform-specific configurations
[[ -s "$DOTFILES/platforms/$PLATFORM.zsh" ]] && source "$DOTFILES/platforms/$PLATFORM.zsh"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Override upgrade_oh_my_zsh to pull upstream changes
function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $DOTFILES/tools/upgrade.sh
}

source $DOTFILES/custom/git.zsh

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Set node modules path
NODE_PATH="/usr/local/lib/node_modules"

# Load private exports
[[ -s "$DOTFILES/exports.zsh" ]] && source "$DOTFILES/exports.zsh"

# Load tmuxinator
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"
