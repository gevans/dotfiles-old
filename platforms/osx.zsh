# Add osx plugin
plugins+=(osx brew)

# Source rbenv completions
source "$(brew --prefix rbenv)/completions/rbenv.zsh"

# Set PHP paths
# export PATH="/usr/local/Cellar/php/5.3.11/bin:$HOME/pear/bin:$PATH"
# export PATH="$HOME/pear/bin:$PATH"
# # Add PHPEnv
# export PATH="$PATH:/Users/gevans/.phpenv/bin"

# Set Apple Terminal.app resume directory
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' $PWD_URL
  }

  chpwd
}

# Use GNU ls and dircolors
function ls() { gls --color=auto "$@"; }

# Load solarized directory colors
eval `gdircolors $DOTFILES/dircolors-solarized/dircolors.ansi-dark`

# All commands have been installed with the prefix 'g'.
#
# A file that aliases these commands to their normal names is available
# and may be used in your bashrc like:
#
#source /usr/local/Cellar/coreutils/8.12/aliases
#
# But note that sourcing these aliases will cause them to be used instead
# of Bash built-in commands, which may cause problems in shell scripts.
# The Bash "printf" built-in behaves differently than gprintf, for instance,
# which is known to cause problems with "bash-completion".
#
# The man pages are still referenced with the g-prefix.

# # Initialize PHPEnv
# eval "$(phpenv init -)"