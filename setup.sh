#!/bin/bash

dotfilesDir=$(pwd)
dateStr=$(date +%Y-%m-%d-%H%M)


# Check if the current user is ROOT.
#
# This function is POSIX-compliant, see
# https://stackoverflow.com/a/52586842
function is_user_root {
    [ "${EUID:-$(id -u)}" -eq 0 ];
}


# Check the availability of an executable.
#
# @param The executable
#
# This function is POSIX-compliant, see
# https://stackoverflow.com/a/677212
function check_executable {
    if ! command -v $1 &> /dev/null 2>&1; then
        return 1
    fi

    return 0
}


# Add a package to the list of missing executables.
#
# @param The executable to be checked.
# @param The package that is required.
function match_executable_with_package {
    check_executable $1
    if [ $? -eq 1 ]; then
        missingExecutables="$missingExecutables $2"
    fi
}


# Create a symlink from the user's home directory to the dotfile.
#
# @param The name of the dotfile as required in the user's home.
# @param The name of the dotfile, as provided in this repository.
#
# The function will remove existing symlinks and backup existing files and
# directories before creating the actual symlink.
function link_dotfile {
    local dst="${HOME}/$1"
    local src="$dotfilesDir/$2"

    if [ -h $dst ]; then
        #echo "Removing existing symlink!"
        rm $dst

    # check if $dst already exists and is a regular file
    elif [ -f $dst ]; then
        echo "Backing up existing file!"
        mv $dst{,.$dateStr}

    # check if $dst already exists and is a directory
    elif [ -d $dst ]; then
        echo "Backing up existing dir!"
        mv $dst{,.$dateStr}
    fi

    echo "Creating symlink!"
    ln -s $src $dst
}


# Track the missing executables. These may be used to install the required
# packages later.
missingExecutables=""

match_executable_with_package "git" "git"
match_executable_with_package "vim" "vim"
match_executable_with_package "zsh" "zsh"


# if there are missing executables, try to install them
if [ $missingExecutables -ne "" ]; then
    if is_user_root; then
        apt-get install --no-install-recommends --yes $missingExecutables
    else
        echo "Missing executables, but you're not 'root', not attempting to install"
        echo "Missing: $missingExecutables"
        exit 1;
    fi
fi

# actually link the dotfiles to the user's home directory
echo "Linking dotfiles to ~/"
link_dotfile ".gitconfig" "git/gitconfig"
link_dotfile ".vim" "vim/vimfiles"
link_dotfile ".vimrc" "vim/vimrc"
link_dotfile ".zshrc" "shells/zshrc"
link_dotfile ".zshrc.local" "shells/zshrc.local"

# setup Vim
if [ ! -d "$dotfilesDir/vim/vimfiles/bundle/Vundle.vim/autoload" ]; then
    echo "Fetching Vundle!"
    git submodule update --init
fi

echo "Installing/updating vim plugins!"
vim +PluginInstall! +qall

echo "Successfully completed setup!"
