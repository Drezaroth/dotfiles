# Powerline
if [ $(which powerline-daemon) ];then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
