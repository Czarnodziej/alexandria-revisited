#Basic
alias dir='dir -achltr --group-directories-first --color=auto'
alias h='history'
alias c='clear'
alias bc='bc -l'

## Colorize the ls output ##
alias ls='LANG=C ls -lah --color --group-directories-first'

## Use a long listing format ##
alias ll='LANG=C ls -lah --color --group-directories-first'

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
#alias grep='grep --color=auto'
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'

alias wget='wget -c'

alias sha1='openssl sha1'
alias mkdir='mkdir -pv'

alias diff='colordiff'
#alias mount='mount |column -t'

# handy shortcuts #
#alias h='history'
#alias j='jobs -l'

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
alias xvim='sudo -E vim'

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

alias ax='sudo aptitude'
alias au='sudo aptitude update'

# update on one command
alias aug='sudo aptitude update && sudo aptitude upgrade'

# become root #
alias root='sudo -i'
#alias su='sudo -i'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

alias service='sudo service '

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
alias dnse='xvim /etc/dnsmasq.d/devtld.conf'
alias dnsr='sudo systemctl restart dnsmasq'

alias gen='LANG=en_US geany'
#alias mc='LANG=en_US mc -b'
alias mc='LANG=en_US mc'

alias aptitude='sudo LANG=en_US aptitude'
alias sudo='sudo '

alias service='sudo service'
alias a2ensite='sudo a2ensite'
alias a2dissite='sudo a2dissite'
alias a2enmod='sudo a2enmod'
alias a2dismod='sudo a2dismod'

#FPM
alias php53='sudo /etc/init.d/php53-fpm'
alias php54='sudo /etc/init.d/php54-fpm'
alias php55='sudo /etc/init.d/php55-fpm'
alias php56='sudo /etc/init.d/php56-fpm'

#Symfony2
alias sf='php app/console'
alias sfcc='sudo rm -rf app/cache/* && sudo rm -rf app/logs/*'
alias sfccp='php app/console cache:clear --env=prod --no-debug'

#USER
alias cdl='cd /home/marcin/dev/www/labelart'
alias muxs='tmuxinator start startowy'
alias muxn='tmuxinator start nasopen'
alias cdw='cd /home/marcin/dev/www'
alias pacman='sudo pacman'