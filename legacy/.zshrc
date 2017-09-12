# by néco

export CC=gcc
export CXX=g++
export CFLAGS="-Wall -Werror -Wextra -pedantic -std=c99"
export LANG=en_US.UTF-8
export PAGER="most"

setopt appendhistory extended_glob HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS sh_word_split
unsetopt beep notify

export CLICOLOR="YES"
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"

alias reboot='/sbin/shutdown -r now'
alias poweroff='/sbin/shutdown -p now'
alias ls='ls -I'
alias ll='ls -l'
alias l='ll'
alias la='ls -la'
alias lla='ls -la'
alias emacs='emacs -nw'
alias reload="source ~/.zshrc"
alias metalock="metalock --theme ../../../../../home/dupuis_a/themes"

autoload -U colors && colors

PROMPT="%(!.%F{red}%B.%F{white})%n %F{cyan}%~%f%#%f%b "
RPROMPT='%F{blue}%T%f%f'
setopt nopromptcr

bindkey -e
bindkey '^W' vi-backward-kill-word
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '[D' emacs-backward-word
bindkey '[C' emacs-forward-word

export EDITOR=vim
NNTPSERVER='news.epita.fr' && export NNTPSERVER

export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
export TERM=screen-256color       # for a tmux -2 session (also for screen)
export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session
