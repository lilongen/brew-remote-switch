#!/bin/bash
#

to=${1:-null}

usage() {
    echo "usage:"
    echo "$0 %to, %to valid value: default or tsinghua"
    echo "$0 tsinghua"
    echo "$0 default"
    echo 
}

regular_to() {
    if [ $to != "tsinghua" ] && [ $to != "default" ]; then
        usage
        exit 1
    fi
}

to_tsinghua() {
    git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
    git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    git -C "$(brew --repo caskroom/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
}

to_default() {
    git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git
    git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git
    git -C "$(brew --repo caskroom/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask.git
}

main() {
    regular_to

    echo "brew remote set to ${to} ..."
    to_${to}
    echo "brew remote set to ${to} ... done"
    
    echo "brew update ..."
    brew update
    echo "brew update ... done"
}

main
