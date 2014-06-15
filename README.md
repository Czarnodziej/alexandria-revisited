1) git clone https://github.com/Czarnodziej/vim-config.git ~/vim-config

2) ln -s ~/vim-config/.vimrc ~/.vimrc

(global) sudo ln -s ~/vim-config/.vimrc /etc/vim/vimrc.local

4) git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

5) open vim and execute :BundleInstall

x) ln -s ~/vim-config/.bash_aliases ~/.bash_aliases

(global) sudoedit /etc/bash.bashrc ->

if [ -f /home/<profile name>/.bash_aliases ]; then
. /home/<profile name>/.bash_aliases
fi

