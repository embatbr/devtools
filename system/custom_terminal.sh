#!/bin/bash


RED="\[\033[31m\]"
YELLOW="\[\033[33m\]"
GREEN="\[\033[32m\]"
BLUE="\[\033[34m\]"
CYAN="\[\033[36m\]"
NO_COLOR="\[\033[00m\]"

show_prompt() {
    user_and_host="$YELLOW\u$RED@$BLUE\h$NO_COLOR"

    datetime="$CYAN`date +'%a %b %d, %H:%M'`$NO_COLOR"

    smart_path=$(python3 ~/programming/system/path_reducer.py `pwd` $HOME)
    smart_path="$GREEN$smart_path$NO_COLOR"

    git_prompt=""
    git_branch="$(__git_ps1 "(%s)")"
    if [ ! -z "$git_branch" ]; then
        git_branch="`git branch | grep "\* " | awk '{print $2}'`"
        git_branch="`echo $git_branch | sed 's/ //g'`"
        git_prompt="($GREEN$git_branch$NO_COLOR) "
    fi

    PS1="$user_and_host $datetime $smart_path\n$git_prompt$ "
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
