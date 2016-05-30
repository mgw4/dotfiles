#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

PATH=$PATH:$HOME/bin
PIP_DOWNLOAD_CACHE=$HOME/pip

#set vim editting mode
bindkey -v
zle -N zle-line-init
zle -N zle-keymap-select

# load virtualenvwrapper for python (after custom PATHs)
venvwrap="/usr/share/virtualenvwrapper/virtualenvwrapper.sh"
venvwrap=`locate virtualenvwrapper.sh`

if [ -e $venvwrap ]; then
    source $venvwrap
fi


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi
# # Customize to your needs...
#
