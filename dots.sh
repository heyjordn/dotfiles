#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# compton
#ln -s ${BASEDIR}/compton.conf $HOME/.config/compton.conf

# dunst
#ln -s ${BASEDIR}/dunstrc $HOME/.config/dunstrc

# feh
ln -s $HOME/.fehbg ${BASEDIR}/fehbg

# goobook
#ln -s ${BASEDIR}/goobookrc $HOME/.goobookrc

# urlview
#ln -s ${BASEDIR}/urlview $HOME/.urlview

# xinitrc
ln -s $HOME/.xinitrc ${BASEDIR}/xinitrc

# Xresources
ln -s $HOME/.Xresources ${BASEDIR}/Xresources

# bin
#ln -s ${BASEDIR}/bin $HOME/bin

# dropbox-cli
#ln -s ${BASEDIR}/dropbox-cli $HOME/.dropbox-cli

# fontconfig
#ln -s ${BASEDIR}/fontconfig $HOME/.config/fontconfig

# fonts
#ln -s ${BASEDIR}/fonts $HOME/.fonts

# dwm
ln -s $HOME/.dwm ${BASEDIR}/dwm 
ln -s $HOME/.dwmstatus ${BASEDIR}/dwmstatus 

# st
ln -s $HOME/.st ${BASEDIR}/st
# mpd
#ln -s ${BASEDIR}/mpd $HOME/.mpd

# mpdscribble
#ln -s ${BASEDIR}/mpdscribble $HOME/.mpdscribble

# mplayer
#ln -s ${BASEDIR}/mplayer $HOME/.mplayer

# msmtp
#ln -s ${BASEDIR}/msmtprc $HOME/.msmtprc


# mutt
#ln -s ${BASEDIR}/mutt $HOME/.mutt

# ncmpcpp
#ln -s ${BASEDIR}/ncmpcpp $HOME/.ncmpcpp

# offlineimap
#ln -s ${BASEDIR}/offlineimap.py $HOME/.offlineimap.py
#ln -s ${BASEDIR}/offlineimaprc $HOME/.offlineimaprc

# pass
#ln -s ${BASEDIR}/pass $HOME/.password-store

# qutebrowser
#ln -s ${BASEDIR}/qutebrowser $HOME/.config/qutebrowser

# ranger
ln -s $HOME/.config/ranger ${BASEDIR}/ranger 

# browser homepage
#ln -s ${BASEDIR}/startpage $HOME/.startpage

# todo
#ln -s ${BASEDIR}/todo $HOME/.todo

# nvim
ln -s $HOME/.config/nvim/init.vim ${BASEDIR}/init.vim 
ln -s $HOME/.config/nvim ${BASEDIR}/nvim 

# weechat
#ln -s ${BASEDIR}/weechat $HOME/.weechat

#Xresources.d
ln -s $HOME/.Xresources.d ${BASEDIR}/Xresources.d 

# zsh
ln -s $HOME/.prezto ${BASEDIR}/zsh/prezto 
ln -s $HOME/.preztorc ${BASEDIR}/zsh/preztorc 
ln -s $HOME/.zprofile ${BASEDIR}/zsh/zprofile 
ln -s $HOME/.zshrc ${BASEDIR}/zsh/zshrc 

