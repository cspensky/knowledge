REMOTE_HOST="10.42.0.2"
dbus-monitor --session "type='signal',interface='org.gnome.ScreenSaver'" | ( 
while true; 
do read X; 
        # Locked Screen
        if echo $X | grep "boolean true" &> /dev/null; 
                then ssh $REMOTE_HOST "pmset displaysleepnow"; 
#       # Unlock screen
#       elif echo $X | grep "boolean false" &> /dev/null; 
#               then ssh $REMOTE_HOST "DISPLAY=:0 gnome-screensaver-command -d"; 
        fi done )
