# Roots Bedrock WordPress Docker Development Environment

This is a Docker based local development environment for Roots Bedrock WordPress.
# WordPress Docker Development Environment

This is a Docker based local development environment for [Roots Bedrock](https://roots.io/bedrock/) WordPress. It is based on the wp-local-docker project by 10up that can be found [here](https://github.com/10up/wp-local-docker).

For internal use only, please do not distribute

## Requirements

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [Composer](https://getcomposer.org/)

## Setup

1. Clone repository
    ```bash
    $ git clone git@github.com:wizeline/bedrock-local-docker.git <my-project-name>
    ```
2. Change directory to project folder
    ```bash
    cd <my-project-name>
    ```
3. Update the ENV vars at the `.env` file and set the right values for your project
4. Download Roots Bedrock
    ```bash
    $ sh bin/bedrock.sh
    ```
5. Start up the docker containers

   Including phpMyAdmin and phpmemcachedadmin:
    ```bash
    $ docker-compose -f docker-compose.yml -f admin-compose.yml up -d
    ```

   Not including admin tools
    ```bash
    $ docker-compose up -d
    ```

4. Run setup to install WordPress.
    ```bash
    $ sh bin/setup.sh
    ```


## Plugins

- Memcache: https://github.com/Automattic/wp-memcached
- Elasticsearch: https://wordpress.org/plugins/elasticpress/
- WP SMTP: https://wordpress.org/plugins/wp-smtp/ 
- wpsnapshots: https://github.com/10up/wpsnapshots
---
