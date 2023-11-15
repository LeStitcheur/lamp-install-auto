#!/bin/bash

echo -e " ###########################################
Bienvenue dans le script d'installation de PHP By MyWebSoluce
#########################################"

echo -e "\n\n Mise à jour des paquets APT \n"
sudo apt update -y && sudo apt upgrade -y &&
echo -e "\n\n Mise à jour terminée \n" &&
sleep 1s &&

echo  -e "\n\n Installation du serveur Apache \n"
sudo apt install apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert -y &&
echo -e "\n\n Installation réussie \n" &&
sleep 1s &&

echo -e "\n\n Installation de PHP et de ses dépendences"
sudo apt install libapache2-mod-php8.1.10 php8.1.10 php8.1.10-common php8.1.10-curl php8.1.10-dev php8.1.10-gd php8.1.10-intl php-json php-mbstring php-xml php-zip php-pear php8.1.10-mcrypt php8.1.10-mysql -y &&
echo -e "\n\n Installation de PHP réussie \n" &&
sleep 1s &&

echo -e "\n\n Installation de MySQL \n"
sudo apt install  mysql-server mysql-client -y &&
echo -e "\n\n Installation de MySQL réussie \n" &&
sleep 1s &&

echo -e "\n\n Installation de PHPMyAdmin \n"
sudo apt install phpmyadmin -y &&
echo -e "\n\n Installation de PHPMyAdmin réussie \n" &&
sleep 1s &&

echo -e "\n\n Mise à jour de la configuration de PHPMyadmin \n"
config_file="/etc/phpmyadmin/config.inc.php"
search="// $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;"
replace="$cfg['Servers'][$i]['AllowNoPassword'] = TRUE;"
sed -i "/$search/$replace" $config_file &&
mysql -h "localhost" -u "root" -p "" mysql <<EOF
UPDATE user SET plugin="mysql_native_password" WHERE user="root";
flush privileges;
EOF

echo -e "\n\n Mise à jour de la configuration finie \n" &&
sleep 1s &&

echo -e "\n\n Ajustement des permissions pour /var/www \n"
sudo chown -R www-data:www-data /var/www &&
echo -e "\n\n Les permissions ont été ajustées \n" &&
sleep 1s

echo -e "\n\n Activation des modules \n"
sudo a2enmod rewrite
sudo phpenmod mcrypt

echo -e "\n\n Remérrage des services Apache \n"
sudo service apache2 restart

echo -e "\n\n Installation terminée. \n"
