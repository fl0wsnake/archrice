#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"


# prompt colors
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"
PS1="$MAGENTA\u$BLUE@$GREEN\h $YELLOW\$PWD$RED\$$RESET "


path_addition=""
path_addition+=~/.yarn/bin/
path_addition+=":"
path_addition+=~/.local/bin
path_addition+=":"

PATH=$path_addition$PATH
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nvim
VISUAL=/usr/bin/nvim


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
