# LAMP Docker
This repository provides a simple local environment for web development.

## Architecture
These are the configured containers :
+ `application` aka the application code container, based on debian
+ `web` aka the Apache/PHP-FPM (5.6) container, where the application volume is mounted
+ `mysql` aka the MySQL server container

```
            Name                         Command              State           Ports          
--------------------------------------------------------------------------------------------
virtualmachine_application_1   /bin/bash                      Up                             
virtualmachine_mysql_1         /docker-entrypoint.sh mysqld   Up      0.0.0.0:3306->3306/tcp 
virtualmachine_web_1           /apache.sh                     Up      0.0.0.0:80->80/tcp   
```

## Installation
These steps involve that [Docker toolbox](https://www.docker.com/products/docker-toolbox) (Docker Engine, Docker Machine and Docker Compose) is installed.
By default, the configuration is as below :
```
- ~/vbox/www >> contains your PHP code
- ~/vbox/conf/php.ini >> contains your PHP configuration
- ~/vbox/conf/sites >> contains your vhosts configuration
```