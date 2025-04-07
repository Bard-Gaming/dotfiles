#
# |----------------------------------------------------------|
# |                                                          |
# |                        Welcome :^)                       |
# |                                                          |
# |----------------------------------------------------------|
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Enable bookmarks.
# For more information, check out
# the .bash_bookmarks file.
if [ -f "$HOME/.bash_bookmarks" ]; then
    source ~/.bash_bookmarks
fi

# Enable aliases.
# If you wish to disable them, simply
# delete the .bash_aliases file.
if [ -f "$HOME/.bash_aliases" ]; then
    source ~/.bash_aliases
fi

# Enable bash completion.
# This has to be done explicitely.
if [ -d '/usr/share/bash-completion/completions' ]; then
    completion_list=(
        "git"
    )

    for cmd in "${completion_list[@]}"; do
        source "/usr/share/bash-completion/completions/$cmd"
    done

    unset completion_list
    unset cmd
fi

# Icons (uses nerdfonts - https://www.nerdfonts.com/cheat-sheet):
CALENDAR_ICON=$'\uf073 '
USER_ICON=$'\uf007 '
FOLDER_ICON=$'\uf07b '

# Ansi styles and colors:
STYLE_RESET=$"\[\033[0m\]"
STYLE_BOLD="\[\033[1m\]"
COLOR_RESET="\[\033[39m\]"
COLOR_RED="\[\033[91m\]"
COLOR_BLUE="\[\033[34m\]"
COLOR_GREEN="\[\033[92m\]"
COLOR_YELLOW="\[\033[93m\]"

# Shell PS1 style:
PS1_DATE="$COLOR_RED$CALENDAR_ICON\D{%b %d}$COLOR_RESET"
PS1_USER="$COLOR_GREEN$USER_ICON\u$COLOR_RESET"
PS1_WDIR="$COLOR_YELLOW$FOLDER_ICON\W$COLOR_RESET"
PS1="$STYLE_BOLD$PS1_DATE $PS1_USER $PS1_WDIR$STYLE_RESET $ "

# Emacs config
export PATH="$HOME/.config/emacs/bin:$PATH"  # for "doom" cmd
# alias emacs="emacsclient -q -c -nw -a 'emacs-server'"

# Enable custom scripts
export PATH="$HOME/.custom_scripts:$PATH"

# Prevent others changing aliases outside of config files
# (has to happen at the end of .bashrc file)
alias unalias="echo \"unalias: command not found\" && :"
alias alias="echo \"alias: command not found\" && :"
