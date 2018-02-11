PATH=$PATH:/usr/local/go/bin:$HOME/bin:$HOME/go/bin:$HOME/bin:/opt/android-studio/bin/
PIP_DOWNLOAD_CACHE=$HOME/pip

# set vim editting mode
#bindkey -v
#zle -N zle-line-init
#zle -N zle-keymap-select

export GOPATH=$HOME/go

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# load virtualenvwrapper for python (after custom PATHs)
# I have to come up with a better way to do this
# if [ -e $VIRTUAL_ENV/bin/virtualenvwrapper.sh ]
# then
#     VENVWRAP=$VIRTUAL_ENV/bin/virtualenvwrapper.sh
# else
     export VENVWRAP="/usr/local/bin/virtualenvwrapper.sh"
# fi
# 
# 
if [ -e $VENVWRAP ]; then
    source $VENVWRAP
    # echo "$VENVWRAP Initialized"
fi


# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi
#
# Auto rehash files
#
zstyle ":completion:*:commands" rehash 1
# 
# Customize to your needs...
#
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

source $HOME/.antigenrc
#
# Support for bash
PROMPT_COMMAND='prompt'

# Mirrored support for zsh. See: https://superuser.com/questions/735660/whats-the-zsh-equivalent-of-bashs-prompt-command/735969#735969 
precmd() { eval "$PROMPT_COMMAND" }

function prompt()
{
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        get_venv_dir $PWD
        #test -e .venv && activate_venv
    fi
}

function get_venv_dir() {

    if [ "$1" = "/" ]
    then
        return 0
    fi

    dname=$(dirname $1)
    bname=$(basename $1)
    if [ -f "$dname/$bname/.venv" ]
    then
        env_name=$(cat $dname/$bname/.venv)
        if [ "$(basename $VIRTUAL_ENV 2> /dev/null)" != "$env_name" ]
        then
            workon $env_name && echo Launching venv $env_name
        fi
    else
        get_venv_dir $dname
    fi
}
