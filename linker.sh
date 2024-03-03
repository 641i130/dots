#!/bin/sh


# Link folders in the given list
for folder in dunst i3 polybar redshift rofi; do
  rm -rf /home/$USER/.config/$folder/
  mkdir -p /home/$USER/.config/$folder/
  echo "Linking $folder"
  ln -s /home/$USER/dots/$folder/*  /home/$USER/.config/$folder/
done

# Link home files here
rm /home/$USER/.zshrc
rm /home/$USER/.zshenv
rm /home/$USER/.Xresources
ln -s /home/$USER/dots/home/* /home/$USER/ 
