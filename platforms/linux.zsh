# Set node modules path
#export NODE_PATH="/usr/local/lib/node_modules"

alias ls="ls --color=auto"

# Add rbenv to path
PATH="$HOME/.rbenv/bin:$PATH"

source "$HOME/.rbenv/completions/rbenv.zsh"

# Load solarized directory colors
eval `dircolors $DOTFILES/dircolors-solarized/dircolors.ansi-dark`
