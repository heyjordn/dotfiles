#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# compton
#cp -r  ${BASEDIR}/compton.conf $HOME/.config/compton.conf

# dunst
#cp -r  ${BASEDIR}/dunstrc $HOME/.config/dunstrc

# feh
cp -r $HOME/.fehbg ${BASEDIR}/fehbg 

# goobook
#cp -r  ${BASEDIR}/goobookrc $HOME/.goobookrc

# urlview
#cp -r  ${BASEDIR}/urlview $HOME/.urlview

# xinitrc
cp -r  $HOME/.xinitrc ${BASEDIR}/xinitrc

# Xresources
cp -r  $HOME/.Xresources ${BASEDIR}/Xresources

# bin
#cp -r  ${BASEDIR}/bin $HOME/bin

# dropbox-cli
#cp -r  ${BASEDIR}/dropbox-cli $HOME/.dropbox-cli

# fontconfig
#cp -r  ${BASEDIR}/fontconfig $HOME/.config/fontconfig

# fonts
#cp -r  ${BASEDIR}/fonts $HOME/.fonts

# dwm
cp -r  $HOME/.dwm ${BASEDIR}/dwm 
cp -r  $HOME/.dwmstatus ${BASEDIR}/dwmstatus 

# st
cp -r  $HOME/.st ${BASEDIR}/st
# mpd
#cp -r  ${BASEDIR}/mpd $HOME/.mpd

# mpdscribble
#cp -r  ${BASEDIR}/mpdscribble $HOME/.mpdscribble

# mplayer
#cp -r  ${BASEDIR}/mplayer $HOME/.mplayer

# msmtp
#cp -r  ${BASEDIR}/msmtprc $HOME/.msmtprc


# mutt
#cp -r  ${BASEDIR}/mutt $HOME/.mutt

# ncmpcp -rp
#cp -r  ${BASEDIR}/ncmpcp -rp $HOME/.ncmpcp -rp

# offlineimap
#cp -r  ${BASEDIR}/offlineimap.py $HOME/.offlineimap.py
#cp -r  ${BASEDIR}/offlineimaprc $HOME/.offlineimaprc

# pass
#cp -r  ${BASEDIR}/pass $HOME/.passwordtore

# qutebrowser
#cp -r  ${BASEDIR}/qutebrowser $HOME/.config/qutebrowser

# ranger
cp -r  $HOME/.config/ranger ${BASEDIR}/ranger 

# browser homepage
#cp -r  ${BASEDIR}/startpage $HOME/.startpage

# todo
#cp -r  ${BASEDIR}/todo $HOME/.todo

# nvim
cp -r  $HOME/.config/nvim/init.vim ${BASEDIR}/init.vim 
cp -r  $HOME/.config/nvim ${BASEDIR}/nvim 

# weechat
#cp -r  ${BASEDIR}/weechat $HOME/.weechat

#Xresources.d
cp -r  $HOME/.Xresources.d ${BASEDIR}/Xresources.d 

mkdir zsh
# zsh
cp -r  $HOME/.prezto ${BASEDIR}/zsh/prezto 
cp -r  $HOME/.preztorc ${BASEDIR}/zsh/preztorc 
cp -r  $HOME/.zprofile ${BASEDIR}/zsh/zprofile 
cp -r  $HOME/.zshrc ${BASEDIR}/zsh/zshrc 

