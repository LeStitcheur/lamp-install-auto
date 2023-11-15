#!/bin/bash

echo -e " ###########################################
Bienvenue dans le script d'installation de PHP By MyWebSoluce
#########################################"

echo -e "\n\n Mise à jour des paquets APT \n"
sudo apt update -y && sudo apt upgrade -y &&
echo -e "\n\n Mise à jour terminée \n" &&
sleep 1s &&

echo  -e "\n\n Installation du serveur Apache / PHP / MySQL \n"
sudo apt install apache2 php libapache2-mod-php mysql-server php-mysql -y &&
echo -e "\n\n Installation réussie \n" &&
sleep 1s &&

echo -e "\n\n Installation des modules PHP"
sudo apt install php-curl php-gd php-intl php-json php-mbstring php-xml php-zip -y &&
echo -e "\n\n Installation des modules réussie \n" &&
sleep 1s &&


echo -e "\n\n Installation de PHPMyAdmin \n"
sudo apt install phpmyadmin -y &&
echo -e "\n\n Installation de PHPMyAdmin réussie \n" &&
sleep 1s &&

echo -e "\n\n Mise à jour de la configuration de PHPMyadmin \n"
config_file="/etc/phpmyadmin/config.inc.php"
search="// $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;"
replace="$cfg['Servers'][$i]['AllowNoPassword'] = TRUE;"
sed -i "s#$search#$replace" $config_file &&
sudo ln -s /usr/share/phpmyadmin /var/www/html
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
read -p "Appuyez sur une touche pour quitter"