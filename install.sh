#!/bin/bash 
#This program downloads dependencies from
#ThePayloadGhost and install
#where the same corresponds.
sudo apt-get install dialog -y
clear
dialog --begin 10 30 --backtitle "ThePayloadGhost Install" \
--title "About" \
--msgbox 'ThePayloadGhost is not responsible for the misuse of this tool as it was created for sample purposes. ' 0 0
dialog --begin 10 30 --backtitle "ThePayloadGhost Install" \
--title "About" \
--msgbox 'This program will download Dialog, Metasploit-Framework, Apktool, OpenJDK-11-JDK and Jarsigner. After the download you will have a launcher to run the tool from your preference menu and save the codes in "/usr/" y "/usr/local/bin" .' 0 0
clear
setterm -foreground white
sudo apt-get install metasploit-framework -y
sudo apt-get install apktool -y 
sudo apt-get install openjdk-11-jdk -y 
unzip Imagenes
sudo chmod +x *
sudo cp -r Imagenes /usr/share/
sudo cp tpg /usr/local/bin
sudo cp tpg /usr/share/applications
echo ""
setterm -foreground red
echo ""
echo "                                Run tph to run the program."
