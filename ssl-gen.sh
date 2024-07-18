#!/bin/bash

#make by mrTanTA
	echo -e "============SSL Maker - Oneclick=============="
	echo -e "============Github.com/mrtanta=============="
sleep 0.5

		

	sudo apt install socat
wait
		curl https://get.acme.sh | sh
wait
sleep 1
		read -p "Enter the domain: " domainname
			if [ "$domainname" = "" ]; then
			
				export DOMAIN=$domainname
				
				
	echo -e "\n\033[91mPlease wait ...\033[0m\n"
sleep 3
	mkdir -p /var/lib/marzban/certs
wait
		sudo ~/.acme.sh/acme.sh \--issue --force --standalone -d "$DOMAIN" \--fullchain-file "/var/lib/marzban/certs/$DOMAIN.cer" \--key-file "/var/lib/marzban/certs/$DOMAIN.cer.key"
wait


	echo -e "\e[32m======================================"
	echo -e "SSL certificate obtained successfully!"|
	echo -e "======================================\033[0m"
	echo ""
	echo ""
	echo -e "\e[33mYour Domin is : $DOMAIN\033[0m\n"
	echo -e "\e[34mKey: /var/lib/marzban/certs/$DOMAIN.cer.key\033[0m\n"
	echo -e "\e[34mCert: /var/lib/marzban/certs/$DOMAIN.cer\033[0m\n"
	echo ""
	echo -e "\e[36mSupport US: github.com/mrtanta\033[0m\n"


else
			  echo -e "\e[41mCancel the Project.\033[0m\n"
			fi