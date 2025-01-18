# Étape 1 : Choisir une image de base avec PHP et Apache
FROM php:8.1-apache

# Étape 2 : Installer les extensions PHP nécessaires pour Laravel
RUN docker-php-ext-install pdo pdo_mysql mysqli && docker-php-ext-enable pdo_mysql mysqli

# Étape 3 : Activer le module mod_rewrite d'Apache pour Laravel
RUN a2enmod rewrite

# Étape 4 : Copier tous les fichiers du projet dans le répertoire du serveur web Apache
COPY . /var/www/html/

# Étape 5 : Donner les bonnes permissions aux fichiers du projet
RUN chown -R www-data:www-data /var/www/html/

# Étape 6 : Exposer le port 80 pour accéder à l'application
EXPOSE 80

# Étape 7 : Démarrer Apache en mode foreground (démarrage du serveur)
CMD ["apache2-foreground"]
