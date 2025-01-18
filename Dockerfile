# Utiliser l'image officielle PHP
FROM php:8.1-apache

# Installer les extensions nécessaires
RUN docker-php-ext-install pdo pdo_mysql

# Copier le projet dans le conteneur
COPY . /var/www/html

# Mettre le bon dossier comme document root
WORKDIR /var/www/html

# Assurer que Apache pointe vers le dossier public/
RUN ln -s /var/www/html/public /var/www/html/htdocs

# Exposer le port 80
EXPOSE 80

# Démarrer Apache
CMD ["apache2-foreground"]
