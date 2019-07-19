#!/bin/bash
#*******************************************************************************
gameId="107410"
#The 'gameId' is the id of the game for which you want to download mods from the Steam workshop.
#
#For example:
#gameId="107410" # Arma 3

steamcmdLocation="./steamcmd"
#The 'steamcmdLocation' is the path to the folder where the stemacmd.sh file is located.
#The path can be either relative to the script or absolute.
#
#For example:
#steamcmdLocation="./steamcmd"
#steamcmdLocation="/home/steam/steamcmd"

modsDestFolder="/home/arma3server/serverfiles/mods"
#The 'modsDestFolder' is the path to the folder where the downloaded mods will be
#linked after downloading from the workshop. This is necessary because during download 
#from the workshop the folders will be named with the id and stored in the workshop folder of Steam.  
#By using a hard link to the 'modsDestFolder' the mods will be renamed (no additional disk space will be used). 
#The path can be either relative to the script or absolute.
#
#For example:
#modsDestFolder="./arma3server/serverfiles/mods"
#modsDestFolder="/home/arma3server/serverfiles/mods"


#username=""
#password=""
#If you want to use the script in a non interactive way you can hardcode the Username and Password here and comment out the 'read' lines.

downloadPath="./mods"

#*******************************************************************************

workshopLoction=$steamcmdLocation/$downloadPath/steamapps/workshop/content/$gameId
arrPos=0
currI=0

#arma additional


#Read CSV file
IFS=","
while read f1 f2
do
        arrModsId+=($f1)
        arrModsName+=($f2)
        let arrPos=$arrPos+1
        done < modList.csv

read -p 'Steam username: ' username
read -sp 'password: ' password

#Steam download
for index in ${!arrModsId[*]}
do
	
        echo        
        echo "*******************************************************************************"
        echo "Start download of:" ${arrModsName[$index]}
        echo "*******************************************************************************"
		echo
        
        $steamcmdLocation/"steamcmd.sh" +login $username $password +force_install_dir $downloadPath +workshop_download_item $gameId ${arrModsId[$index]} validate +quit      

        cp -al $workshopLoction/${arrModsId[$index]} $modsDestFolder/${arrModsName[$index]}

        echo
        echo "*******************************************************************************"
        echo "Finished download of:" ${arrModsName[$index]}
		echo
		echo "$currI of" ${#arrModsId[*]} "done!"
        echo "*******************************************************************************"       
		
		let currI=$index+1
done
