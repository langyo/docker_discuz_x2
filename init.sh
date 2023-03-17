
if test -e /var/www/html/config/config_global.php; then
  rm /var/www/html/install/index.php
  echo "" > /var/www/html/data/install.lock
fi

apache2-foreground
