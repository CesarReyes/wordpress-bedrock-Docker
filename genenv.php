<?php

$db_name = getenv('MYSQL_DATABASE');
$db_user = getenv('MYSQL_USER');
$db_pd = getenv('MYSQL_PASSWORD');
$db_host = 'mysql';
$db_prefix = getenv('WP_DB_PREFIX');

$wp_home = getenv('WP_URL');
$project_name = getenv('PROJECT_NAME');

$options = ['cost' => 12];

$data = "DB_NAME=$db_name
DB_USER=$db_user
DB_PASSWORD=$db_pd

# Optional variables
DB_HOST=$db_host
DB_PREFIX=$db_prefix

WP_ENV=development
WP_HOME=$wp_home
WP_SITEURL=\${WP_HOME}/wp

# Generate your keys here: https://roots.io/salts.html
AUTH_KEY='".password_hash("AUTH_KEY", PASSWORD_BCRYPT, $options)."'
SECURE_AUTH_KEY='".password_hash("SECURE_AUTH_KEY", PASSWORD_BCRYPT, $options)."'
LOGGED_IN_KEY='".password_hash("LOGGED_IN_KEY", PASSWORD_BCRYPT, $options)."'
NONCE_KEY='".password_hash("NONCE_KEY", PASSWORD_BCRYPT, $options)."'
AUTH_SALT='".password_hash("AUTH_SALT", PASSWORD_BCRYPT, $options)."'
SECURE_AUTH_SALT='".password_hash("SECURE_AUTH_SALT", PASSWORD_BCRYPT, $options)."'
LOGGED_IN_SALT='".password_hash("LOGGED_IN_SALT", PASSWORD_BCRYPT, $options)."'
NONCE_SALT='".password_hash("NONCE_SALT", PASSWORD_BCRYPT, $options)."'";

$file = fopen("./$project_name/.env", 'w');
fwrite($file, $data);
fclose($file);