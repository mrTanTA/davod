#!/bin/bash

# Written By: wizwiz

if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[33mPlease run as root\033[0m"
    exit
fi

wait

echo -e "\e[32m


██╗██████╗░░█████╗░░█████╗░███╗░░██╗██╗
██║██╔══██╗██╔══██╗██╔══██╗████╗░██║██║
██║██████╔╝██║░░██║██║░░██║██╔██╗██║██║
██║██╔══██╗██║░░██║██║░░██║██║╚████║██║
██║██║░░██║╚█████╔╝╚█████╔╝██║░╚███║██║
╚═╝╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝
\033[0m"

#sleep
echo -e "\e[32mInstalling iRooni script ... \033[0m\n"
sleep 5


echo -e "\e[92mThe server was successfully updated ...\033[0m\n"


wait

git clone https://github.com/wizwizdev/wizwizxui-timebot.git /var/www/html/davood-timebot
sudo chown -R www-data:www-data /var/www/html/davood-timebot/
sudo chmod -R 755 /var/www/html/davood-timebot/
echo -e "\n\033[Irooni config and script have been installed successfully\033[0m"

wait
    
        
RANDOM_CODE="davood-panel"
mkdir "/var/www/html/$RANDOM_CODE"
echo "Directory created: $RANDOM_CODE"
echo "Folder created successfully!"

 cd /var/www/html/
 wget -O wizwizpanel.zip https://github.com/wizwizdev/wizwizxui-timebot/releases/download/9.1.9/wizwizpanel.zip

 file_to_transfer="/var/www/html/wizwizpanel.zip"
 destination_dir=$(find /var/www/html -type d -name "*$RANDOM_CODE*" -print -quit)

 if [ -z "$destination_dir" ]; then
   echo "Error: Could not find directory containing 'wiz' in '/var/www/html'"
   exit 1
 fi

 mv "$file_to_transfer" "$destination_dir/" && yes | unzip "$destination_dir/wizwizpanel.zip" -d "$destination_dir/" && rm "$destination_dir/wizwizpanel.zip" && sudo chmod -R 755 "$destination_dir/" && sudo chown -R www-data:www-data "$destination_dir/" 


wait


if [ ! -d "/root/condoov1" ]; then

    sudo mkdir /root/condoov1
    
    sleep 1
    
    touch /root/condoov1/dbrootwizwiz.txt
    sudo chmod -R 777 /root/condoov1/dbrootwizwiz.txt
    sleep 1
    
    randomdbpasstxt="root"

    ASAS="$"

    echo "${ASAS}user = 'root';" >> /root/condoov1/dbrootwizwiz.txt
    echo "${ASAS}pass = '${randomdbpasstxt}';" >> /root/condoov1/dbrootwizwiz.txt
    #echo "${ASAS}paths = '$RANDOM_CODE';" >> /root/condoov1/dbrootwizwiz.txt
    
    sleep 1

    passs=$(cat /root/condoov1/dbrootwizwiz.txt | grep '$pass' | cut -d"'" -f2)
    userrr=$(cat /root/condoov1/dbrootwizwiz.txt | grep '$user' | cut -d"'" -f2)

    sudo mysql -u $userrr -p$passs -e "alter user '$userrr'@'localhost' identified with mysql_native_password by '$passs';FLUSH PRIVILEGES;"

    echo "SELECT 1" | mysql -u$userrr -p$passs 2>/dev/null

    echo "Folder created successfully!"
else
    echo "Folder already exists."
fi

clear

echo " "
echo -e "\e[32m

██╗██████╗░░█████╗░░█████╗░███╗░░██╗██╗
██║██╔══██╗██╔══██╗██╔══██╗████╗░██║██║
██║██████╔╝██║░░██║██║░░██║██╔██╗██║██║
██║██╔══██╗██║░░██║██║░░██║██║╚████║██║
██║██║░░██║╚█████╔╝╚█████╔╝██║░╚███║██║
╚═╝╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚══╝╚═
\033[0m\n"

read -p "Enter the domain: " domainname
if [ "$domainname" = "" ]; then

echo -e "\n\033[91mPlease wait ...\033[0m\n"
sleep 3

echo -e "\e[36mNothing was registered for the domain.\033[0m\n"

echo -e "\n\033[0m Good Luck Baby\n"

else
# variables
DOMAIN_NAME="$domainname"
# WILDCARD_DOMAIN="*.$wildcarddomain"

# update cron
PATHS=$(cat /root/condoov1/dbrootwizwiz.txt | grep '$path' | cut -d"'" -f2)
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/davood-timebot/settings/messagewizwiz.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/davood-timebot/settings/rewardReport.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/davood-timebot/settings/warnusers.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/davood-timebot/settings/gift2all.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "*/3 * * * * curl https://${DOMAIN_NAME}/davood-timebot/settings/tronChecker.php >/dev/null 2>&1") | sort - | uniq - | crontab -
(crontab -l ; echo "* * * * * curl https://${DOMAIN_NAME}/${PATHS}/backupnutif.php >/dev/null 2>&1") | sort - | uniq - | crontab -

echo -e "\n\e[92m Setting Up Cron...\033[0m\n"

# Allow HTTP and HTTPS traffic
echo -e "\n\033[1;7;31mAllowing HTTP and HTTPS traffic...\033[0m\n"
sudo ufw allow 80
sudo ufw allow 443

# Let's Encrypt
echo -e "\n\033[1;7;32mInstalling Let's Encrypt...\033[0m\n"
sudo apt install letsencrypt -y

# automatic certificate renewal
echo -e "\n\033[1;7;33mEnabling automatic certificate renewal...\033[0m\n"
sudo systemctl enable certbot.timer

# SSL certificate using standalone mode
echo -e "\n\033[1;7;34mObtaining SSL certificate using standalone mode...\033[0m\n"
sudo certbot certonly --standalone --agree-tos --preferred-challenges http -d $DOMAIN_NAME

# Certbot Apache plugin
echo -e "\n\033[1;7;35mInstalling Certbot Apache plugin...\033[0m\n"
sudo apt install python3-certbot-apache -y

# SSL certificate using Apache plugin
echo -e "\n\033[1;7;36mObtaining SSL certificate using Apache plugin...\033[0m\n"
sudo certbot --apache --agree-tos --preferred-challenges http -d $DOMAIN_NAME

# echo -e "\n\033[1;7;33mObtaining SSL certificate using manual DNS mode (wildcard)...\033[0m\n"
# sudo certbot certonly --manual --agree-tos --preferred-challenges dns -d $DOMAIN_NAME -d $WILDCARD_DOMAIN


echo -e "\e[32m======================================"
echo -e "SSL certificate obtained successfully!"
echo -e "======================================\033[0m"


wait

echo " "

ROOT_PASSWORD="root"
ROOT_USER="root"
echo "SELECT 1" | mysql -u$ROOT_USER -p$ROOT_PASSWORD 2>/dev/null


if [ $? -eq 0 ]; then

wait

    randomdbpass="root"

    randomdbdb="root"

    if [[ $(mysql -u root -p$ROOT_PASSWORD -e "SHOW DATABASES LIKE 'davood'") ]]; then
        clear
        echo -e "\n\e[91mYou have already created the database\033[0m\n"
    else
        dbname=davood
        clear
        echo -e "\n\e[32mPlease enter the database username!\033[0m"
        printf "[+] Default user name is \e[91m${randomdbdb}\e[0m ( let it blank to use this user name ): "
        read dbuser
        if [ "$dbuser" = "" ]; then
        dbuser=$randomdbdb
        fi

        echo -e "\n\e[32mPlease enter the database password!\033[0m"
        printf "[+] Default user name is \e[91m${randomdbpass}\e[0m ( let it blank to use this user name ): "
        read dbpass
        if [ "$dbpass" = "" ]; then
        dbpass=$randomdbpass
        fi

        mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE $dbname;" -e "CREATE USER '$dbuser'@'%' IDENTIFIED WITH mysql_native_password BY '$dbpass';GRANT ALL PRIVILEGES ON * . * TO '$dbuser'@'%';FLUSH PRIVILEGES;" -e "CREATE USER '$dbuser'@'localhost' IDENTIFIED WITH mysql_native_password BY '$dbpass';GRANT ALL PRIVILEGES ON * . * TO '$dbuser'@'localhost';FLUSH PRIVILEGES;"
        
        echo -e "\n\e[95mDatabase Created.\033[0m"
        
        wait
        


        printf "\n\e[33m[+] \e[36mBot Token: \033[0m"
        read YOUR_BOT_TOKEN
        printf "\e[33m[+] \e[36mChat id: \033[0m"
        read YOUR_CHAT_ID
        printf "\e[33m[+] \e[36mDomain: \033[0m"
        read YOUR_DOMAIN
        echo " "
        if [ "$YOUR_BOT_TOKEN" = "" ] || [ "$YOUR_DOMAIN" = "" ] || [ "$YOUR_CHAT_ID" = "" ]; then
           exit
        fi

        ASAS="$"
	
        wait

        sleep 1
        
        file_path="/var/www/html/davood-timebot/baseInfo.php"
        
        if [ -f "$file_path" ]; then
          rm "$file_path"
          echo -e "File deleted successfully."
        else
          echo -e "File not found."
        fi
        
        sleep 2
        
        # print file
        echo -e "<?php" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "error_reporting(0);" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "${ASAS}botToken = '${YOUR_BOT_TOKEN}';" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "${ASAS}dbUserName = '${dbuser}';" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "${ASAS}dbPassword = '${dbpass}';" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "${ASAS}dbName = '${dbname}';" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "${ASAS}botUrl = 'https://${YOUR_DOMAIN}/davood-timebot/';" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "${ASAS}admin = ${YOUR_CHAT_ID};" >> /var/www/html/davood-timebot/baseInfo.php
        echo -e "?>" >> /var/www/html/davood-timebot/baseInfo.php

        sleep 1

        curl -F "url=https://${YOUR_DOMAIN}/davood-timebot/bot.php" "https://api.telegram.org/bot${YOUR_BOT_TOKEN}/setWebhook"
        MESSAGE="✅ The irooni bot has been successfully installed! "
        curl -s -X POST "https://api.telegram.org/bot${YOUR_BOT_TOKEN}/sendMessage" -d chat_id="${YOUR_CHAT_ID}" -d text="$MESSAGE"
        
        
        sleep 1
        
        url="https://${YOUR_DOMAIN}/davood-timebot/createDB.php"
        curl $url
        
        sleep 1
        
        sudo rm -r /var/www/html/davood-timebot/webpanel
        sudo rm -r /var/www/html/davood-timebot/install
        sudo rm /var/www/html/davood-timebot/createDB.php
	rm /var/www/html/davood-timebot/updateShareConfig.php
	rm /var/www/html/davood-timebot/README.md
	rm /var/www/html/davood-timebot/README-fa.md
	rm /var/www/html/davood-timebot/LICENSE
	rm /var/www/html/davood-timebot/update.sh
	rm /var/www/html/davood-timebot/wizwiz.sh
	rm /var/www/html/davood-timebot/tempCookie.txt
	rm /var/www/html/davood-timebot/settings/messagewizwiz.json
            
        clear
        
        echo " "
        
        echo -e "\e[100mDatabase information:\033[0m"
	echo -e "\e[33maddres: \e[36mhttps://${YOUR_DOMAIN}/phpmyadmin\033[0m"
        echo -e "\e[33mDatabase name: \e[36m${dbname}\033[0m"
        echo -e "\e[33mDatabase username: \e[36m${dbuser}\033[0m"
        echo -e "\e[33mDatabase password: \e[36m${dbpass}\033[0m"
        echo " "
        echo -e "\e[100mwizwiz panel:\033[0m"
        echo -e "\e[33maddres: \e[36mhttps://${YOUR_DOMAIN}/$RANDOM_CODE/login.php\033[0m"
        
        echo " "
        
        echo -e "Good Luck Baby! \e[94mThis project is for free. If you like it, be sure to donate me :) , so let's go \033[0m\n"

        fi


        elif [ "$ROOT_PASSWORD" = "" ] || [ "$ROOT_USER" = "" ]; then
        echo -e "\n\e[36mThe password is empty.\033[0m\n"
        else 
        
        echo -e "\n\e[36mThe password is not correct.\033[0m\n"

        fi

fi
