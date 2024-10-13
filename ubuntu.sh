#!/bin/bash

user=$(whoami)
echo $user

wget -O sudoers.file https://raw.githubusercontent.com/elath/setup/refs/heads/main/sudoers.file
sudo visudo sh -c -f ./sudoers.file

sudo apt update
sudo apt dist-upgrade
sudo apt install -y vim curl zsh git qemu-guest-agent

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i -e "s|robbyrussell|alanpeabody|g" /home/$user/.zshrc
sudo cp -r /home/$user/.oh-my-zsh /root
sudo cp /home/$user/.zshrc /root

sudo chsh -s /usr/bin/zsh $user
sudo chsh -s /usr/bin/zsh root

git config --global user.name "Bryce Klippenstein"
git config --global user.email "bryceklippenstein@gmail.com"