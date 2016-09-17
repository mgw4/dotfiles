PATH=$PATH:$HOME/bin
PIP_DOWNLOAD_CACHE=$HOME/pip

# set vim editting mode
bindkey -v
zle -N zle-line-init
zle -N zle-keymap-select

# load virtualenvwrapper for python (after custom PATHs)
# I have to come up with a better way to do this
if [ -e $VIRTUAL_ENV/bin/virtualenvwrapper.sh ]
then
    VENVWRAP=$VIRTUAL_ENV/bin/virtualenvwrapper.sh
else
    export VENVWRAP="/usr/local/bin/virtualenvwrapper.sh"
fi


if [ -e $VENVWRAP ]; then
    source $VENVWRAP
    # echo "$VENVWRAP Initialized"
fi


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi
# 
# Customize to your needs...
#
