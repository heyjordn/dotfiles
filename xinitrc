#Set background
feh --bg-fill /home/proxima/.wallpapers/morning.jpg &

#Merge XResources
xrdb -merge .Xresources

#Starts composite manager
compton -b & 
#Starts key mapper

sxhkd &
#Starts window manager
exec bspwm

#Makeshift sticky note window
st -c scratchpad -e /home/proxima/.config/bspwm/scratch&
