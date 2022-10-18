#!/bin/bash

# Get the patht to the dotfiles
dotfilesDir=$(pwd)
dateStr=$(date +%Y-%m-%d-%H%M)

function linkDotFile {
    local dst="${HOME}/$1"
    local src="$dotfilesDir/$2"

    if [ -h "${dst}" ]; then
        echo "Removing existing symlink!"
        rm ${dst}

    elif [ -f "${dst}" ]; then
        echo "Backing up existing file!"
        mv ${dst}{,.${dateStr}}

    elif [ -d "${dst}" ]; then
        echo "Backing up existing dir!"
        mv ${dst}{,.${dateStr}}
    fi

    echo "Creating symlink!"
    ln -s ${src} ${dst}
}


# actually link the dotfiles to the user's home directory
linkDotFile ".gitconfig" "git/gitconfig"
linkDotFile ".vim" "vim/vimfiles"
linkDotFile ".vimrc" "vim/vimrc"
linkDotFile ".zshrc" "shells/zshrc"
linkDotFile ".zshrc.local" "shells/zshrc.local"

# setup Vim
if [ ! -d "$dotfilesDir/vim/vimfiles/bundle/Vundle.vim" ]; then
    echo "Fetching Vundle!"
    git submodule update --init
fi

echo "Installing/updating vim plugins!"
vim +PluginInstall! +qall

echo "Successfully completed setup!"
