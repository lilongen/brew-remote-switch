#!/bin/bash
#

to=${1:-null}

tap_base_default=https://github.com/Homebrew
tap_base_aliyun=https://mirrors.aliyun.com/homebrew
tap_base_tsinghua=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew

bottles_default=https://mirrors.aliyun.com/homebrew/homebrew-bottles
bottles_aliyun=https://mirrors.aliyun.com/homebrew/homebrew-bottles
bottles_tsinghua=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles


usage() {
    echo "usage:"
    echo "$0 %to"
    echo "%to valid value: default, aliyun, tsinghua"
    echo "$0 tsinghua"
    echo "$0 default"
    echo 
}

regular_to() {
    if [ $to != "tsinghua" ] && [ $to != "aliyun" ] && [ $to != "default" ]; then
        usage
        exit 1
    fi
}

switch() {
    tap_base=tap_base_${to}
    bottles=bottles_${to}
    url_base=${!tap_base}
    bottles_url=${!bottles}
    git -C "$(brew --repo)" remote set-url origin ${url_base}/brew.git
    git -C "$(brew --repo homebrew/core)" remote set-url origin ${url_base}/homebrew-core.git
    git -C "$(brew --repo homebrew/cask)" remote set-url origin ${url_base}/homebrew-cask.git
    echo "export HOMEBREW_BOTTLE_DOMAIN=${bottles_url}" >> ~/.bash_profile
    source ~/.bash_profile
}

main() {
    regular_to

    echo "brew remote set to ${to} ..."
    switch
    echo "brew remote set to ${to} ... done"

    echo "brew update ..."
    brew update -v
    echo "brew update ... done"
}

main
