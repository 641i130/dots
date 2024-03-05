#!/bin/bash
echo "Syncing music dump to phone!!!"
echo "Press enter to continue!"
read
folder_name=$(date +%d%m%Y)
cd $HOME/ytdl/ && mkdir $folder_name || echo "Folder was made already!!"
mv *.mp3 $folder_name
read -p "Enter IP address: " ip
rsync -e 'ssh -p 2222' -Pauv $folder_name rei@$ip:/data/data/com.arachnoid.sshelper/files/home/SDCard/  && echo "UPLOADED SUCCESSFULLY!!!"
