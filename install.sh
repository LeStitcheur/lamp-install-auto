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
search="// \$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\] = TRUE;"
replace="\$cfg['Servers'][\$i]['AllowNoPassword'] = TRUE;"
sudo sed -i "s#$search#$replace#" $config_file &&
echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';"

echo -e "\n\n Mise à jour de la configuration finie \n" &&
sleep 1s &&

echo -e "\n\n Ajustement des permissions pour /var/www \n"
sudo chown -R www-data:www-data /var/www &&
echo -e "\n\n Les permissions ont été ajustées \n" &&
sleep 1s


echo -e "\n\n Remérrage des services Apache \n"
sudo service apache2 restart

echo -e "\n\n Ouverture de phpmyadmin dans votre navigateur ... \n"
sleep 2s
xdg-open http://localhost/phpmyadmin
echo -e "\n\n La page phpmyadmin a été ouverte \n"
echo -e "\n\n ================================= \n"
echo -e "\n\n Les identifiants sont :"
echo -e "\n\n username :  root"
echo -e "\n\n password : "
echo -e "\n\n ================================= \n"

echo -e "\n\n Ouerture de la page d'accueil apache dans votre navigateur ... \n"
sleep 2s
xdg-open http://localhost
echo -e "\n\n La page d'accueil a été ouverte \n"


sleep 3s
echo -e "\n\n Installation terminée. \n"
echo -e "\n\n Script By LeStitcheurFou pour MyWebSoluce \n"
read -p "Appuyez sur une touche pour quitter"
