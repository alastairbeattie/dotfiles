# allow per-user 'global' npm installs

#xcape -e 'Control_L=Escape'

#### ALIASES ####
# alias for dotfiles repository
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias tj=vimwiki_today
alias tasks='nvim ~/vimwiki/tasks.md'
vimwiki_today() {
    TODAY_FILE=~/vimwiki/Journal_$(date +%Y%m%d).md
    if [ ! -f "$TODAY_FILE" ]; then
        touch $TODAY_FILE
        echo "### Notes ###" >> $TODAY_FILE
    fi
    nvim $TODAY_FILE
}
start_fakecam() {
    sudo modprobe v4l2loopback;
    node ~/src/Linux-Fake-Background-Webcam/bodypix/app.js &;
    python3 ~/src/Linux-Fake-Background-Webcam/fakecam/fake.py -w /dev/video0 --fps 30 --no-foreground
}
## compnow costing
alias cost="~/cost.py"
abe_cpu_frequency() {
    sudo cpupower frequency-info -fm | egrep -o "[0-9i,\.]{3,5} [GM]Hz"
}

vpnup() {
    ~/vpnup.sh start
}
prompt_git_detail() {
    if [ -d .git ]; then
        local TRACKED=$(( $(git status -s |grep '^A' -c) + $(git status -s |grep '^M' -c) ))
        local UNTRACKED=$(( $(git status -s |grep '^??' -c) + $(git status -s |grep '^ M' -c) ))
    
        echo "%F{123} $( git branch |grep '^*' |cut -d ' ' -f 2- ) %F{red}$UNTRACKED%f:%F{green}$TRACKED%f"
    else
        echo ""
    fi;
}

autoload -Uz compinit
compinit
if [ "$USER" = "root" ]; then
    echo bang
    export PS1="%F{160}%n%F{237}@%F{22}%m %F{25}%~%f %F{100}[%h] %f%# "

elif [ -z "$SSH_CONNECTION" ]; then
    export PS1="%F{28}%n%F{237}@%F{22}%m %F{25}%~%f %F{100}[%h] %f%# "
else
    export PS1="%F{97}%n%F{237}@%F{22}%m %F{25}%~%f %F{100}[%h] %f%# "
fi

bindkey -v # Enable vi mode
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line
bindkey '^P' up-history
bindkey '^n' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-ndbackward
bindkey '^K' kill-line #maybe turn on if required 
export PS1_USER_COLOR=97
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} %F{39} [% NORMAL]%  %{$reset_color%}"
    RPS1="%F{238}%c${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} %F{16}$(prompt_git_detail)$EPS1"
    zle reset-prompt
    if [ "$USER" = "root" ]; then
        PS1="%F{160}%n%F{237}@%F{22}%m %F{25}%~%f %F{100}[%h] %f%# "
        PS1_USER_COLOR=160
    elif [ -z "$SSH_CONNECTION" ]; then
        PS1="%F{28}%n%F{237}@%F{22}%m %F{25}%~%f %F{100}[%h] %f%# "
        PS1_USER_COLOR=28
    else
        PS1="%F{97}%n%F{237}@%F{22}%m %F{25}%~%f %F{100}[%h] %f%# "
        PS1_USER_COLOR=97
    fi
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1


DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

alias dh='dirs -v'

#colouring
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color auto'
alias yay='yay --color auto'
alias ip='ip -c'
alias ls='ls --color=auto'
alias restart='sudo systemctl restart'
alias stop='sudo systemctl stop'
alias start='sudo systemctl start'
alias df='df -H'
alias vim='nvim'
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi
source /home/alastair/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
export MOZ_ENABLE_WAYLAND=1
