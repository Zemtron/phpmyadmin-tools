#!/bin/bash


scriptversion="1.2"
updates="1"
if [ $updates -eq 1 ]; then
curl $timeout --head https://raw.githubusercontent.com/xElten/phpmyadmin-tools/master/version.php | head -n 1 | grep "HTTP/1.[01] [2].." > /dev/$
  	if [ $? = 1 ];
	then  printf "-"
	else
			sversion=$(wget https://raw.githubusercontent.com/xElten/phpmyadmin-tools/master/version.php -q -O -)
		if [ $sversion \> $scriptversion ];
			then printf "Neue Version verfügbar"
			sleep 2
			wget https://raw.githubusercontent.com/xElten/phpmyadmin-tools/master/pma-tools-$sversion.sh
			chmod +x pma-tools-$sversion.sh
			rm pma-tools-$scriptversion.sh
			./pma-tools-$sversion.sh $1
			sleep 1
			printf "taste"
			read -n 1
			clear
			$0
			exit 0
			else printf "Skript auf neustem Stand"
		fi
	fi
fi



if ! lolcat -v COMMAND &> /dev/null 
then
wget https://github.com/busyloop/lolcat/archive/master.zip
apt-get install unzip
 unzip master.zip
 cd lolcat-master/bin
 apt-get install rubygems -y
 gem install lolcat
fi
if ! figlet -v COMMAND &> /dev/null 
then
 apt-get install -y figlet
fi
function Message() {
	echo -e "${@}" | lolcat -a -d 10
}
clear
sleep 1.0
    figlet phpMyAdmin Tools | lolcat
    Message "#################################################################"
    
    Message "Options 1.0.2"


    echo ""
    Message "1.  phpMyAdmin | install"
    Message "2.  phpMyAdmin | export mysql data"
    Message "3.  phpMyAdmin | uninstall"
   

    echo ""
    Message "#################################################################"
    echo ""
    read -p  "Please enter a number: " pmatools

    if [ "$pmatools" = "1" ]; then



        clear
        Message "(10%) #"
        sleep 1
        clear
        Message "(20%) ##"
        sleep 1
        clear
        Message "(30%) ###"
        sleep 1
        clear
        Message "(40%) ####"
        sleep 1
        clear
        Message "(50%) #####"
        sleep 1
        clear
        Message "(60%) ######"
        sleep 1
        clear
        Message "(70%) #######"
        sleep 1
        clear
        Message "(80%) ########"
        sleep 1
        clear
        Message "(90%) #########"
        sleep 1
        clear
        Message "(100%) ##########"
        sleep 1
        clear


        apt-get install sudo -y
        apt update -y
        sudo apt install mariadb-server mariadb-client -y
        sudo systemctl start mariadb
        sudo apt -y install wget php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql
        sudo apt install php-mbstring php-zip php-gd -y
        wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
        tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
        sudo mv phpMyAdmin-4.9.0.1-all-languages/ /usr/share/phpmyadmin
        sudo mkdir -p /var/lib/phpmyadmin/tmp
        sudo mv phpMyAdmin-*/ /usr/share/phpmyadmin
        sudo chown -R www-data:www-data /var/lib/phpmyadmin
        sudo mkdir /etc/phpmyadmin/
        sudo cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php
        sudo a2enconf phpmyadmin.conf
        password=`openssl rand -base64 32`;
        pass="${password}";
        mysqladmin -u root password "${pass}";
        ip=`hostname -I | awk '{print $1}'`;
        cd /etc/apache2/conf-enabled/
        rm phpmyadmin.conf
        wget https://raw.githubusercontent.com/xElten/shell/master/phpmyadmin.conf

        sudo systemctl reload apache2
        clear
        figlet phpMyAdmin Tools | lolcat
       
    Message "#################################################################"
    
    Message "phpMyAdmin has been installed"


    echo ""
    Message "Username: root"
    Message "Password mariadb: ${pass}"
    Message "ip: "${ip}/phpmyadmin""
    
   

    echo ""
    Message "#################################################################"
    echo ""

    fi
    
   
    if [ "$pmatools" = "2" ]; then
    timestamp=$(date +"%F")
    mysqldump -u root -p -x -A > /home/db-$timestamp.sql
    Message "#################################################################"

    echo ""
    Message "a backup was created in /home/db-$timestamp.sql"
    
    echo ""
    Message "#################################################################"
    echo ""
    fi
    if [ "$pmatools" = "3" ]; then
    apt-get purge phpmyadmin
    sudo apt-get purge mariadb-server 
    sudo dpkg -l | grep mariadb 
    Message "phpMyadmin has now been uninstalled"
    fi
  