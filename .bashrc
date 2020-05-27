# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# PROMPT
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ALIASES
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# alias vi='vim'
# alias nv='nvim'
# alias v='vim'
alias la="ls -A"
alias tree="tree -I '__pycache__|*.pyc|.git|venv|node_modules|undodir|plugged'"
alias fd="fdfind"
alias ipy="ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner"
alias config='/usr/bin/git --git-dir=/home/milo/.dotfiles/ --work-tree=/home/milo'
alias rvim="OpenFileInEnclosingVim"

# ENVIRONMENT VARIABLES
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL="vim"
export PATH=$PATH:/home/milo/.local/bin

# COMMANDS
# FZF Stuff
vman() { vim <(man $1); } # man page in vim

function OpenFileInEnclosingVim {
    if [ -z "${VIM_TERMINAL}" ]; then
        echo "Not running in Vim's terminal. Open a new vim!"
        return
    fi
        echo -e "\033]51;[\"drop\", \"$1\"]\007" # :h terminal-api
}
