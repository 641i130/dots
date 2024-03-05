#!/bin/sh


# Link folders in the given list
for folder in dunst i3 polybar redshift rofi kitty; do
  rm -rf /home/$USER/.config/$folder/
  mkdir -p /home/$USER/.config/$folder/
  echo "Linking $folder"
  ln -s /home/$USER/dots/$folder/*  /home/$USER/.config/$folder/
done

# Link home files here
rm /home/$USER/.zshrc 2>/dev/null
rm /home/$USER/.zshenv 2>/dev/null
rm /home/$USER/.Xresources 2>/dev/null
ln -s /home/$USER/dots/home/{*,.*} /home/$USER/ 

# Link folder
ln -s /home/$USER/dots/Scripts /home/$USER/Scripts
