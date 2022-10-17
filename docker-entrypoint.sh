#!/bin/bash

export TERM=xterm

clear

echo 
echo "################################################################################"
echo "#                                                                              #"
echo "#                       web-dev-docker-container-php-8-0                       #"
echo "#                                                                              #"
echo "#                                                                              #" 
echo "#  Company:  CTH24                                                             #"
echo "#  Author:   Daniel Hoffmann                                                   #"
echo "#  Github:   https://github.com/CTH24/web-dev-docker-image-php-8-0             #"
echo "#  Website:  https://cth24.com                                                 #"
echo "#                                                                              #"
echo "################################################################################"
echo
echo  
echo "################################################################################"
echo "#  Start NGIX Server                                                           #"
echo "################################################################################"
echo
service nginx start
service php8.0-fpm start
echo
echo 
echo "################################################################################"
echo "#  Set File Permission                                                         #"
echo "################################################################################"
echo
echo
chown www-data:www-data /var/www/html -R
find /var/www -type d -exec chmod 2775 {} +
find /var/www -type f -exec chmod 664 {} +
ls -lda /var/www/html/
echo 
echo
echo 
echo "################################################################################"
echo "#  NGINX Error Log                                                             #"
echo "################################################################################"
echo
echo
tail -f /var/log/nginx/error.log
exec "$@"
