#Basic
## Colorize the ls output ##
alias ls='LANG=C ls -lah --color --group-directories-first'

#vim
alias xvim='sudoedit'

#Apps
alias dnse='xvim /etc/dnsmasq.d/hosts.conf'
alias dnsr='sudo systemctl restart dnsmasq'
alias mc='LANG=en_US mc'

#Symfony2
alias sf='php app/console'
alias sfcc='sudo rm -rf app/cache/* && sudo rm -rf app/logs/*'
alias sfccp='php app/console cache:clear --env=prod --no-debug'

#USER
alias cdw='cd /home/marcin/dev/www'
alias pacman='sudo pacman'
alias sysupg='pacaur -Syu'
