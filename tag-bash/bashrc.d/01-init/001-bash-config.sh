# sourced by .bashrc
#
# Contains Bash configuration, see man bash

# bash history setup
HISTCONTROL=ignoreboth,erasedups
HISTSIZE=1000
HISTFILESIZE=10000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
