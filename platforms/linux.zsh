# Add osx plugin
plugins+=(osx)

# Set node modules path
export NODE_PATH="/usr/local/lib/node_modules"

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

alias ls="ls --color=auto"

# Load solarized directory colors
eval `dircolors $DOTFILES/dircolors-solarized/dircolors.ansi-dark`
