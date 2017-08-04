#Set background
feh --bg-fill /home/proxima/.wallpapers/desert.jpg &

#Merge XResources
xrdb -merge .Xresources

#Starts composite manager
# compton --config ~/.config/compton/compton.conf -b

#Starts key mapper
sxhkd &

#Starts window manager
exec bspwm

#Makeshift sticky note window
# st -c scratchpad -e /home/proxima/.config/bspwm/scratch&
