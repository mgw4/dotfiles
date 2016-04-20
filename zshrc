#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

PATH=$PATH:$HOME/bin
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh



# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi
# # Customize to your needs...
#
