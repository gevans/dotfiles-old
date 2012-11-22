alias ls="ls --color=auto"
alias tmux="TERM=screen-256color-bce tmux"

# Set TERM to fix vim in tmux
TERM="screen-256color"

# Add Pyrus (PHP libraries) executables to path
PATH="$HOME/pyrus/bin:$PATH"

# Add rbenv to path and source completions
PATH="$HOME/.rbenv/bin:$PATH"
source "$HOME/.rbenv/completions/rbenv.zsh"

# Load solarized directory colors
eval `dircolors $DOTFILES/dircolors-solarized/dircolors.ansi-dark`
