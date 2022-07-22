# gtk-rofi
theme your rofi css using gtk

![Video](video.mkv)

# Cloning

Copy this onto your terminal

```
git clone https://github.com/git-fal7/gtk-rofi $HOME/.config/rofi/gtk-rofi
cd $HOME/.config/rofi/gtk-rofi
chmod +x ./launcher.sh
```

# Usage

```./launcher.sh (Rofi arguments) (Your theme (without .rasi extension)```

example

```./launch.sh -show drun spotlight```

# Themeing

the script uses the ``templates`` folder to use the theme as a template, then it replaces ``{@CONTEXT}`` valid tags and turn it onto a proper gtk style context color, then it outputs it into the ``themes`` folder.

![List of style context colors](https://github.com/Git-Fal7/gtk-rofi/blob/8fab89f8efd8df3b1360a8f0ac97ecd7eda1fe53/scripts/file_gtk_style.py#L31)

![Heres some themes that works](https://github.com/Git-Fal7/gtk-rofi/tree/main/templates)
