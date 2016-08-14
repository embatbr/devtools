#!/bin/bash

# in the .bashrc insert `source ~/programming/system/custom_terminal.sh`


RED="\[\033[31m\]"
YELLOW="\[\033[33m\]"
GREEN="\[\033[32m\]"
BLUE="\[\033[34m\]"
CYAN="\[\033[36m\]"
WHITE="\[\033[97m\]"
NO_COLOR="\[\033[00m\]"

show_git_prompt() {
    git_prompt=""
    git_branch="$(__git_ps1 "(%s)")"
    if [ ! -z "$git_branch" ]; then
        git_branch="`git branch | sed -n -e 's/^\* \(.*\)/\1/p'`"
        if [ ! -z "$git_branch" ]; then
            git_prompt="$WHITE.git:$GREEN$git_branch$NO_COLOR"
            echo "$git_prompt "
        fi
    fi
}

show_pyvenv_prompt() {
    pyenv_prompt="$(python3 ~/programming/system/pyvenv_detection.py $HOME)"

    if [ ! -z "$pyenv_prompt" ]; then
        pyenv_prompt="$WHITE.venv:$BLUE$pyenv_prompt$NO_COLOR"
        echo "$pyenv_prompt "
    fi
}

show_prompt() {
    user_and_host="$YELLOW\u$RED@$BLUE\h$NO_COLOR"

    datetime="$CYAN`date +'%a %b %d, %H:%M'`$NO_COLOR"

    smart_path="$(python3 ~/programming/system/path_reducer.py `pwd` $HOME)"
    smart_path="$GREEN$smart_path$NO_COLOR"

    git_prompt="$(show_git_prompt)"

    pyenv_prompt="$(show_pyvenv_prompt)"

    PS1="$user_and_host $datetime $smart_path\n$git_prompt$pyenv_prompt$WHITE\$$NO_COLOR "
}

show_prompt

cd() {
    builtin cd "$@"
    show_prompt
}

# see https://en.wikipedia.org/wiki/Unix_signal
trap show_prompt SIGINT
trap show_prompt SIGQUIT
trap show_prompt SIGTSTP
trap show_prompt SIGCHLD # made the branch be updated
