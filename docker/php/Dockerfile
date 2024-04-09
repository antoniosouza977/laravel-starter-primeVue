FROM php:8.2-fpm

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql

RUN pecl install xdebug && docker-php-ext-enable xdebug

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Defina o diretório de trabalho para a aplicação Laravel
WORKDIR /var/www

# Copie o código fonte da aplicação Laravel para o contêiner
COPY . /var/www
COPY ./docker/php/start.sh /usr/local/bin/start
COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/php-custom.ini
COPY ./docker/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN chmod u+x /usr/local/bin/start
RUN chmod u+x /var/www/storage/


# Defina as permissões adequadas para os diretórios de armazenamento
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
RUN chmod 777 -R /var/www/storage

# Exponha a porta 9000 para o servidor PHP-FPM
EXPOSE 9000

# Inicie o servidor PHP-FPM
CMD ["/usr/local/bin/start"]
