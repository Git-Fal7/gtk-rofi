#!/bin/sh

DIR=$HOME/.config/rofi/gtk-rofi

#The scripts we will be using
SCRIPTDIR=$DIR/scripts

#Settings file
SETTINGS=$DIR/settings.ini

#The themes
THEMEDIR=$DIR/themes

#The templates
TEMPDIR=$DIR/templates

#Gets the current gtk using gsettings and removes the quotes
CURRENT_GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
CURRENT_GTK_THEME="${CURRENT_GTK_THEME#?}"
CURRENT_GTK_THEME="${CURRENT_GTK_THEME%?}"

#Gets the gtk theme that is in the settings.ini file
SETTINGS_GTK_THEME=$(grep "GTK_THEME" "${SETTINGS}" | cut -b 11-)

#Checks either icon or gtk theme isn't the same
if [ "${SETTINGS_GTK_THEME}" != "${CURRENT_GTK_THEME}" ]; then
 echo "Updating settings"
 sed -i "s:GTK_THEME=${SETTINGS_GTK_THEME}:GTK_THEME=${CURRENT_GTK_THEME}:g" "${SETTINGS}"

 for f in "$TEMPDIR"/*; do
  file=$(basename "${f}")
  "${SCRIPTDIR}"/file_gtk_style.py "${TEMPDIR}"/"${file}" > "${THEMEDIR}"/"${file}"
 done

else
 echo "All Good"
fi

THEME=${*:$#}

if [ -e "${THEMEDIR}"/"${THEME}".rasi ]; then
 echo "Theme exists, great"
 rofi "${@:1:($#-1)}" -theme "${THEMEDIR}"/"${THEME}".rasi -theme-str "configuration { show-icons: true; icon-theme: $(gsettings get org.gnome.desktop.interface icon-theme | tr "'" '"');}"
else
 echo "Theme doesn't exist"
fi
