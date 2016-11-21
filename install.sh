#!/bin/bash
# 
# Tested on yakkety

# Verify this is Ubuntu
if [ $(cat /etc/lsb-release | grep DISTRIB_ID | grep -c Ubuntu) -ne 1 ]; then
  echo "Can only run on Ubuntu... :("
  exit 1
fi

# Refresh sudo cache
sudo -v 

# Add repositories
PPA_REPOS="ppa:webupd8team/java
           ppa:webupd8team/atom"

for ppa in $PPA_REPOS; do
  sudo add-apt-repository $ppa
done

# Non PPA's
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" |
  sudo tee /etc/apt/sources.list.d/google-chrome.list

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Refresh Repos and update system
sudo apt update && sudo apt -y upgrade

# Install packages
sudo apt -y install oracle-java8-installer vim-gtk3-py2 \
  python-dev python-pip virtualenv virtualenvwrapper \
  python-openstackclient python-novaclient python-neutronclient \
  python-designateclient python-glanceclient python-cinderclient \
  python-barbicanclient python-cinderclient python-magnumclient \
  python-ceilometerclient python-heatclient python-ironicclient 

# Install rcm manually ;(
RCM_DEB=rcm_1.3.0-1_all.deb
RCM_DEB_PATH=/tmp/${RCM_DEB}
wget -P /tmp https://thoughtbot.github.io/rcm/debs/${RCM_DEB}
sudo dpkg -i ${RCM_DEB_PATH}
rm -f ${RCM_DEB_PATH}

# Create dirs
mkdir ~/bin
mkdir -p ~/repos/venv

# Git clone stuff
git clone https://github.com/lynxnot/powerline-openstack-segment.git ~/repos/github.com/lynxnot/powerline-openstack-segment
git clone https://github.com/rupa/z.git ~/repos/github.com/rupa/z

# Setup fonts
mkdir -p ~/.fonts ~/.config/fontconfig/conf.d 
wget -P ~/.fonts https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget -P ~/.config/fontconfig/conf.d https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -vf ~/.fonts/

# Install powerline
pip install --user powerline-status
pushd ~/.local/lib/python2.7/site-packages/powerline
patch -p2 < ~/repos/github.com/lynxnot/powerline-openstack-segment/powerline-openstack-segment.patch
popd

# rcup
# cheat-in .rcrc
ln -s ~/repos/github.com/lynxnot/dotfiles/rcrc ~/.rcrc
pushd $HOME
rcup -vf
popd

# sexy-gnome-terminal
#oracle-java8-installer vim-gtk3-py2 keepass2 xdotool \
#  spotify-client google-chrome-stable atom weechat
