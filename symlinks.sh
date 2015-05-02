#!/bin/bash
############################
# symlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Based on awesome https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
###########################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="vimrc zshrc"               # list of files/folders to symlink in homedir
username="czarnodziej"            # name of my personal config files
##########

#### Remove old files

if [-f ~/.vimrc]; then
rm -rf ~/.vimrc
fi

if [! -f ~/.zshrc]; then
rm -rf ~/.zshrc
fi

if [ -f ~/.oh-my-zsh/custom/plugins/$username/$username.plugin.zsh ]; then
rm -rf ~/.oh-my-zsh/custom/plugins/$username/$username.plugin.zsh
fi

if [ -f ~/.oh-my-zsh/custom/themes/$username.zsh-theme ]; then
rm -rf ~/.oh-my-zsh/custom/themes/$username.zsh-theme
fi

####

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

####

install_vim_plug () {
if [! -f ~/.vim/autoload/plug.vim]; then
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
}

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    #symlink plugin with personal aliases...
    mkdir ~/.oh-my-zsh/custom/plugins/$username; ln -s $dir/$username.plugin.zsh ~/.oh-my-zsh/custom/plugins/$username/$username.plugin.zsh
    #...and bash prompt theme
    mkdir ~/.oh-my-zsh/custom/themes; ln -s $dir/$username.zsh-theme ~/.oh-my-zsh/custom/themes/$username.zsh-theme
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi

else
        sudo apt-get install zsh
        install_zsh
fi
}

install_zsh
install_vim_plug
echo "Done!"
