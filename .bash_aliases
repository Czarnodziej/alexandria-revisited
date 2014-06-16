#Basic
alias dir='dir -achltr --group-directories-first --color=auto'
alias h='history'
alias c='clear'
alias bc='bc -l'

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -lah'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias wget='wget -c'

alias sha1='openssl sha1'
alias mkdir='mkdir -pv'

alias diff='colordiff'
alias mount='mount |column -t'

# handy shortcuts #
alias h='history'
alias j='jobs -l'

# date n time
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

#vim
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
alias xvim='sudoedit'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias ports='netstat -tulanp'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'

# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# get web server headers #
alias header='curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

alias ax="sudo aptitude"
alias au="sudo aptitude update"

# update on one command
alias aug='sudo aptitude update && sudo aptitude upgrade'

# become root #
alias root='sudo -i'
alias su='sudo -i'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# services
alias service='sudo service '
alias apl='sudo service apache reload'
alias apr='sudo service apache restart'

alias msl='sudo service mysql reload'
alias msr='sudo service mysql restart'

alias sshl='sudo service ssh reload'
alias sshr='sudo service ssh restart'

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'

#Apps
alias gen='LANG=en_US geany'
alias mc='LANG=en_US mc'
alias aptitude='sudo LANG=en_US aptitude'
alias sudo='sudo '

#Symfony2
alias sf='php app/console'
alias sfcl='php app/console cache:clear'
alias sfroute='php app/console router:debug'
alias sfgb='php app/console generate:bundle'
