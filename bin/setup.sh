#!/bin/bash

# Loads .env
set -o allexport
source .env
set +o allexport

if $(docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp core is-installed"); then
	echo "WordPress config file found."

	echo -n "Do you want to reinstall? [y/n] "
	read REINSTALL

	if [ "y" = "$REINSTALL" ]
	then
		docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp db reset --yes"
	else
		echo "Installation aborted."
		exit 1
	fi
fi

docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp core install --url=$WP_URL --title=\"$WP_SITE_TITLE\" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL"
docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp rewrite structure "/%postname%/""  
docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp site empty --yes"
docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp theme delete twentyfifteen twentysixteen"
docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp widget delete search-2 recent-posts-2 recent-comments-2 archives-2 categories-2 meta-2"

echo -n "Do you want to install Memcached plugin? [y/n] "
read INSTALL_MEMCACHED
if [ "y" = "$INSTALL_MEMCACHED" ]
	then
		docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp plugin install memcached --activate"
fi

echo -n "Do you want to install Auth0? [y/n] "
read INSTALL_AUTH0
if [ "y" = "$INSTALL_AUTH0" ]
	then
		docker-compose exec phpfpm su -s /bin/bash www-data -c "cd web && wp plugin install auth0 --activate"
fi

echo "Installation done."
echo "------------------"