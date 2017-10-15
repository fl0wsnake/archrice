#
# ~/.bashrc
#


# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
export HISTFILESIZE=
export HISTSIZE=
# export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


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


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
