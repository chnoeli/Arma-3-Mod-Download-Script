# Arma 3 Mod Download script
This script is for downloading mods via steamcmd. To make live easier for a Arma 3 server administrator. The script can also be used in a cron job to automate the update process.

The script was currently **only tested with Arma 3** but should work with almost any Steam game that relies on workshop mods.

## Motivation
The motivation for this project is that I don't have to manually upload the mod updates every X Week. As I am the server maintainer of our Arma 3 Milsim Clan([Task Force Hornet](https://task-force-hornet.de)). So I wrote this little script to run the process directly on the server.

## Status

Linux - running properly
Windows - coming soon

### Tested Games

* Arma 3 Server - 107410

## Usage

Clone the Source to your server:
``` sh
git clone https://github.com/chnoeli/Arma-3-Mod-Download-Script.git
cd Arma-3-Mod-Download-Script
```
Edit the 'modList.csv' file and add your mods.
The first column is the steam id of the mod you get this id at the steam workshop page. The second column is the name the mod should have in the Arma 3 mod folder. **For Linux remember to only use small letters.**

Edit the parameters of the 'linux.sh' script so it matches your enviroment (description of the parameters are in the File).

## License
MIT © chnoeli

