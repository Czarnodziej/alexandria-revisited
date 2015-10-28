##################################################################################
# create a zkbd compatible hash - working HOME, END fix #1 etc;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# # Finally, make sure the terminal is in application mode, when zle is
# # active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish


##################################################################################

# source ~/.zshrc.local
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="czarnodziej"
#ZSH_THEME="powerline"
#ZSH_THEME="candy"
#
ZSH_THEME="powerlevel9k/powerlevel9k"
# working HOME, END, insert, delete powerlevel9k fix
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[2"   overwrite-mode
bindkey  "^[[3"   delete-char
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(archlinux command-not-found git git-extras systemd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

#vi-mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

#
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# NVM
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi

export LANG=en_US.UTF-8

export EDITOR='vim'
#export TERM="xterm-256color"

#zsh-syntax-highlighter
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

#
source /home/marcin/.phpbrew/bashrc

DEFAULT_USER="${USER}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# vim man viewer
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma number' -\""

#command-not-found ARCH
source /usr/share/doc/pkgfile/command-not-found.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.zsh/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# such predictable, many useful
# autoload predict-on
# predict-on

# # you may also wish to bind it to some keys...
# zle -N predict-on
# zle -N predict-off
# bindkey '^X1' predict-on
# bindkey '^X2' predict-off

#yummy prompt broken TODO: make custom prompt
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d.%m.%Y}"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir node_version vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time vi_mode)
POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'
export KEYTIMEOUT=1

##ALIASES
#Basic
alias ls='LANG=C ls -lah --color --group-directories-first'

#vim
alias xvim='sudo -e'

#Apps
alias dnse='xvim /etc/dnsmasq.d/hosts.conf'
alias dnsr='sudo systemctl restart dnsmasq'
alias mc='mc -b'

#TMUX
# -2 = force term 256
alias tmux='tmux -2'
alias tmuxw='tmux -2 attach -t WORK'

#Symfony2
alias sf='php app/console'
alias sfcc='sudo rm -rf app/cache/* && sudo rm -rf app/logs/*'
alias sfccp='php app/console cache:clear --env=prod --no-debug'

#USER
alias cdw='cd /home/marcin/dev/www'
alias pacman='sudo pacman'
alias sysupg='pacaur -Syu'

#FZF
## fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

