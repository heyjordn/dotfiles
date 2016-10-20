#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# compton
#cp -rf  ${BASEDIR}/compton.conf $HOME/.config/compton.conf

# dunst
#cp -rf  ${BASEDIR}/dunstrc $HOME/.config/dunstrc

# feh
cp -f $HOME/.fehbg ${BASEDIR}/fehbg 

# goobook
#cp -rf  ${BASEDIR}/goobookrc $HOME/.goobookrc

# urlview
#cp -rf  ${BASEDIR}/urlview $HOME/.urlview

# xinitrc
cp -f  $HOME/.xinitrc ${BASEDIR}/xinitrc

# Xresources
cp -f  $HOME/.Xresources ${BASEDIR}/Xresources

# bin
#cp -rf  ${BASEDIR}/bin $HOME/bin

# dropbox-cli
#cp -rf  ${BASEDIR}/dropbox-cli $HOME/.dropbox-cli

# fontconfig
#cp -rf  ${BASEDIR}/fontconfig $HOME/.config/fontconfig

# fonts
#cp -rf  ${BASEDIR}/fonts $HOME/.fonts

# dwm
cp -rf  $HOME/.dwm/* dwm 
cp -rf  $HOME/.dwmstatus/* dwmstatus 

# st
cp -rf  $HOME/.st/* st
# mpd
#cp -rf  ${BASEDIR}/mpd $HOME/.mpd

# mpdscribble
#cp -rf  ${BASEDIR}/mpdscribble $HOME/.mpdscribble

# mplayer
#cp -rf  ${BASEDIR}/mplayer $HOME/.mplayer

# msmtp
#cp -rf  ${BASEDIR}/msmtprc $HOME/.msmtprc


# mutt
#cp -rf  ${BASEDIR}/mutt $HOME/.mutt

# ncmpcp -rfp
#cp -rf  ${BASEDIR}/ncmpcp -rfp $HOME/.ncmpcp -rfp

# offlineimap
#cp -rf  ${BASEDIR}/offlineimap.py $HOME/.offlineimap.py
#cp -rf  ${BASEDIR}/offlineimaprc $HOME/.offlineimaprc

# pass
#cp -rf  ${BASEDIR}/pass $HOME/.passwordtore

# qutebrowser
#cp -rf  ${BASEDIR}/qutebrowser $HOME/.config/qutebrowser

# ranger
cp -rf  $HOME/.config/ranger/* ranger 

# browser homepage
#cp -rf  ${BASEDIR}/startpage $HOME/.startpage

# todo
#cp -rf  ${BASEDIR}/todo $HOME/.todo

# nvim
cp -rf  $HOME/.config/nvim/init.vim init.vim 

# weechat
#cp -rf  ${BASEDIR}/weechat $HOME/.weechat

#Xresources.d
#cp -rf  $HOME/.Xresources.d ${BASEDIR}/Xresources.d 

# zsh
cp -rf  $HOME/.zprezto zsh/zprezto 
cp -rf  $HOME/.zshrc zsh/zshrc 

