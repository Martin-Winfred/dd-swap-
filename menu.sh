#!/bin/bash
#Identify USER
if [ $EUID -ne 0 ]; then
<<<<<<< HEAD
    echo -e "This script must be run as root\nAnd does not start with sudo command" 1>&2
=======
    echo "This script must be run as root" 1>&2
>>>>>>> upstream/main
    exit 1
fi


clear

echo "1) Create Swap"

echo "2) Disable Swap"

echo "3) Enable Swap"

echo "4) Unstall Swap"

echo "5) Clear Swap"

echo "0) Exit"
read choise

<<<<<<< HEAD
=======
#createSwap
function createSwap() (
    clear
    bash $(pwd)/ddswap.sh -D
)

>>>>>>> upstream/main
#offSwap
function offSwap() (
    clear
    swapoff /mnt/swap
    bash menu.sh
)

#onSwap
function onSwap() (
    clear
    swapon /mnt/swap
<<<<<<< HEAD
    bash menu.sh
=======
    free -h
>>>>>>> upstream/main
)

#uninstallSwap
function uninstallSwap() (
    clear
    swapoff /mnt/swap
    rm /mnt/swap
    bash menu.sh
)

function restartSwap() (
    swapoff -a
    swapon -a
    bash menu.sh
)

#generateSwap
function createSwap() (
    clear
    if [ "$1" == "-D" ]; then 
        dd if=/dev/zero of=/mnt/swap bs=1M count=2048 
    else 
        echo -e "Input how many swap you want to make (MB)\n Eg.2048" 
        echo "Warning Do not use oversized space" 
        echo "You need to manually enable it"
        read coun 
        dd if=/dev/zero of=/mnt/swap bs=1M count=$coun
    fi

    mkswap /mnt/swap
    bash menu.sh
)

case $choise in
    1)
    createSwap;;
    2)
    offSwap;;
    3)
    onSwap;;
    4)
    uninstallSwap;;
    5)
    restartSwap;;
    0)
    echo "Bye"
    exit 1;;
esac
