#!/bin/bash

#make by mrTanTA
	echo -e "\e[32m============UFW Optimizer=============="
	echo -e "Allow special needed IPv4/IPv6 ports!"
	echo -e "Give Stars : Github.com/mrTanTA"
	echo -e "================Services================"
	echo -e "CloudFlare - SSH/OpenVPN - Ngnix - Apache"
	echo -e "Rathole - X-ray Core - Marzban - X-UI "
	echo -e "Needed Linux Ports - AntiAbuse - AntiScan"
	echo -e "======================================\033[0m"
		echo " "
			read -p "Are you sure you want to Install?[y/n]: " answer
		echo " "
				if [ "$answer" != "${answer#[Yy]}" ]; then
					echo " "
					
	# Ask Reboot
ask_reboot() {
    echo "Reboot now? (Recommended) (y/n)"
    echo 
    while true; do
        read choice
        echo 
        if [[ "$choice" == 'y' || "$choice" == 'Y' ]]; then
            sleep 0.5
            reboot
            exit 0
        fi
        if [[ "$choice" == 'n' || "$choice" == 'N' ]]; then
            break
        fi
    done
}

		echo "---- Right, Ready for takeoff ------"

	sleep 3
	
echo -e "\n\033[1;7;31mAllowing HTTP and HTTPS needed traffic ports...\033[0m\n"

sudo ufw disable

sleep 0.5

# Define an array of commonly used ports for various services
declare -a ports=("22" "80" "443" "21" "25" "53" "123" "3306" "5432" "137:139" "445" "514" "636" "993" "995" "2049" "5060" "5061" "8080" "8443" "8880" "2053" "2052")

# Define an array of commonly used Open ports for HTTPS & HTTP CloudFlare
cloudflare_ports=("80" "443" "2052" "2053" "2082" "2083" "2086" "2087" "2095" "2096" "8080" "8443" "8880")
ports+=("${cloudflare_ports[@]}")


# Loop through the array and allow each port in UFW
for port in "${ports[@]}"
do
    sudo ufw allow $port
done

sleep 0.5

# Allow specific ports for Apache, Nginx, and VPN
sudo ufw allow 'Apache Full'
sudo ufw allow 'Apache'
sudo ufw allow 'Nginx Full'
sudo ufw allow 'Nginx'
sudo ufw allow 'OpenSSH'
sudo ufw allow 'OpenVPN'
sudo ufw allow 'ssh'
sudo ufw allow 'rathole'


sleep 0.5

# Allow Range ports for X-ray Core
sudo ufw allow 9000:9200
sleep 1
# Allow specific ports for Marzban
sudo ufw allow 8000
sleep 0.5

# Reload UFW to apply the changes
sudo ufw reload
sleep 0.5

# Enable UFW 
sudo ufw Enable
sleep 0.5
sudo ufw reload

clear
			sleep 0.5
			echo -e "\n\e[92mThe script was successfully Instaled! \033[0m\n"
			echo -e "\n\e[92mYou can open port manually! Use: ufw allow x \033[0m\n"
			echo ""
			ask_reboot
			

   
else
			  echo -e "\e[41mCancel the Project installation.\033[0m\n"
			fi




