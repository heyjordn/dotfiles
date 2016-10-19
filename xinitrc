while true; do

# Power/Battery Status
if [ "$( cat /sys/class/power_supply/AC0/online )" -eq "1" ]; then
        DWM_BATTERY="AC";
        DWM_RENEW_INT=3;
else
        DWM_BATTERY=$(( `cat /sys/class/power_supply/BAT0/energy_now` * 100 / `cat /sys/class/power_supply/BAT0/energy_full` ));
        if [ $DWM_BATTERY -gt 80 ] && [ $DWM_BATTERY -lt 100 ] && [ $DWM_BATTEY -eq 100 ]; then
			DWM_BATTERY_ICON="";
		fi;
		if [ $DWM_BATTERY -gt 50 ] && [ $DWM_BATTERY -lt 80 ]; then
			DWM_BATTERY_ICON="";
		fi;
		if [ $DWM_BATTERY -gt 30 ] && [ $DWM_BATTERY -lt 50 ]; then
			DWM_BATTERY_ICON="";
		fi;
		if [ $DWM_BATTERY -lt 30 ]; then
			DWM_BATTERY_ICON="";
		fi;
		DWM_RENEW_INT=30;
fi;

# Wi-Fi eSSID
if [ "$( cat /sys/class/net/wlp2s0/link_mode )" -eq "1" ]; then
		  DWM_ESSID=$( /usr/bin/iwgetid -r );
else
		  DWM_ESSID="OFF";
fi;
#Volume
DWM_VOLUME=$(pamixer --get-volume);
DWM_VOLUME_ICON="";
#high volume
if [ $DWM_VOLUME -eq 100 ]; then
	DWM_VOLUME_ICON="";
fi;
#volume lowered
if [ $DWM_VOLUME -lt 90 ]; then
	DWM_VOLUME_ICON="";
fi;
#mute
if [ $DWM_VOLUME -eq 0 ]; then
	DWM_VOLUME_ICON="";
fi;
# Keyboard layout
DWM_LAYOUT_ICON="";
if [ "`xset -q | awk -F \" \" '/Group 2/ {print($4)}'`" = "on" ]; then
		  DWM_LAYOUT="ru";
else
		  DWM_LAYOUT="en";
fi;


# Date and Time
DWM_CLOCK=$( date '+%e %b %Y %a | %k:%M' );

# Overall output command
DWM_STATUS=" $DWM_ESSID | $DWM_VOLUME% $DWM_VOLUME_ICON | $DWM_LAYOUT_ICON $DWM_LAYOUT | $DWM_BATTERY% $DWM_BATTERY_ICON | $DWM_CLOCK";
xsetroot -name "$DWM_STATUS";
#dwmstatus
sleep 1;

done &

feh --bg-fill /home/proxima/.wallpapers/original.png &
#xrandr --output eDP1 --scale .6x.6
xrdb -merge .Xresources
dwm
