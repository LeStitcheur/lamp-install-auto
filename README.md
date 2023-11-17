# Script d'Installation LAMP et phpMyAdmin

Ce script Bash automatise l'installation de LAMP (Linux, Apache, MySQL, PHP) et phpMyAdmin sur un système Linux basé sur Debian/Ubuntu.

## Utilisation

### Etape 1:

Télécharger le script `install.sh`.

### Etape 2:

Donner au script les permissions d'exécution :

```bash
chmod +x install.sh
```

### Etape 3:

Rentrer le mot de passe utilisateur

### Etape 4:

Le script va vérifier et mettre à jour les paquets

### Etape 5:

Installation d'Apache, PHP, et MySQL. A cette étape le script va proposer Apache2 ou lighttpd, choisir apache2.

### Etape 6:

Installation des modules PHP

### Etape 7:

Installation de PhpMyAdmin. A cette étape

### Etape 8:

Choisir `Yes` pour `Configure database for phpmyadmin with dbconfig-common`

### Etape 9:

A cette étape vous devez choisir un mot de passe. Vous pouvez laisser le champs vide

### Etape 10:

La page de PhpMyAdmin se lance

### <span style="color:red;"> ⚠ ATTENTION : ⚠</span>

Les identifiants d'accès à PhpMyAdmin par défaut sont :
`username = root`
`password = `

Les identifiants peuvent être modifié du côté de l'utilisateur

### Script développé par MyWebSoluce
