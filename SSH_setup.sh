#!/usr/bin/env bash
echo "Type password:"
read sudoPassword
ssh-keygen -b 4096 -t rsa -f $HOME/.ssh/id_rsa -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo $sudoPassword | sudo -S apt-get -y install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Public RSA SSH Key added to clipboard"
