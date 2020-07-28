#!/bin/bash
if [ -d "vnb" ];then
    echo "Directory vnb already exits do you want to overwrite it?[y/n]"
    read x
    if [ "$x" == "y" ] || [ "$x" == "Y" ];then
        rm -rf "vnb"
    else
        echo "exiting"
        exit 1
    fi
fi
git clone "https://github.com/amogha0x00/vnb.git" && cd vnb && (cp -v bashrc ~/.bashrc ; cp -v vimrc ~/.vimrc ; sudo cp -v 51-android.rules /etc/udev/rules.d/ && (sudo udevadm control --reload ; sudo service udev restart))
