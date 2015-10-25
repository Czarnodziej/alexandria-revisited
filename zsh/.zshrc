# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/marcin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (set above)
antigen bundle git
antigen bundle command-not-found
antigen bundle git-extras
antigen bundle archlinux
antigen bundle history-substring-search
antigen bundle systemd
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme bhilburn/powerlevel9k powerlevel9k
#
# Tell antigen that you're done.
antigen apply

if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'
export TERM="xterm-256color"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#zsh-syntax-highlighter
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

source /home/marcin/.phpbrew/bashrc

# This loads nvm
export NVM_DIR="/home/marcin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export DEFAULT_USER=marcin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim man viewer
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma number' -\""

# Base16 Shell
BASE16_SHELL="$HOME/.zsh/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

##ALIASES
#Basic
alias ls='LANG=C ls -lah --color --group-directories-first'

#vim
alias xvim='sudo -e'

#Apps
alias dnse='xvim /etc/dnsmasq.d/hosts.conf'
alias dnsr='sudo systemctl restart dnsmasq'
alias mc='LANG=en_US mc -b'

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

