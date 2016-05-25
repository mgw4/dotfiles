#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

PATH=$PATH:$HOME/bin


# load virtualenvwrapper for python (after custom PATHs)
venvwrap="virtualenvwrapper.sh"
/usr/bin/which -s $venvwrap
if [ $? -eq 0 ]; then
    venvwrap=`/usr/bin/which $venvwrap`
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
