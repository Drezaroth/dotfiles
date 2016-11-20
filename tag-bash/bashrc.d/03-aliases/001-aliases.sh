# some more ls aliases
alias ll='ls -lhF --dereference-command-line-symlink-to-dir'
alias la='ls -alhF'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# More Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
