#!/bin/sh

GTK_THEME=$(grep gtk-theme-name $HOME/.config/gtk-3.0/settings.ini | cut -b 18-)

GSETTINGS_VALUE=$(gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g")

if [ "$GSETTINGS_VALUE" != "$GTK_THEME" ]; then
 echo "Change"
 gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
fi
