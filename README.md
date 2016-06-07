# LAMP Docker
This repository provides a simple local environment for web development.

## Architecture
These are the configured containers :
+ `application` aka the application code container, based on ubuntu
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
[Virtualbox](https://www.virtualbox.org) has to be installed too.
By default, the configuration is as below :
```
- ~/vbox/www >> contains your PHP code
- ~/vbox/conf/php.ini >> contains your PHP configuration
- ~/vbox/conf/sites >> contains your vhosts configuration
```

### Clone the repository
```
$ git clone git@github.com:mcoemakinafr/docker-lamp.git
```
If you prefer http clone :
```
$ git clone https://github.com/mcoemakinafr/docker-lamp.git
```
Or you can download the ZIP archive [here](https://github.com/mcoemakinafr/docker-lamp/archive/master.zip)

### Get your own compose file
```
$ cp docker-compose.yml.dist docker-compose.yml
$ nano docker-compose.yml
```
_You can have the match between your virtual hosts `~/vbox/conf/sites` and your hosts file._

### Define your variables environment
```
$ cp docker-env.dist docker-env
$ nano docker-env
```
_The only mandatory environment variable is: **MYSQL_ROOT_PASSWORD**._


### Define your aliases preferences
```
$ cp bash_aliases.dist bash_aliases
$ nano bash_aliases
```

The default preferences are :
+ aliases for `symfony2`
+ friendlier prompt
+ easier connection to mysql


### Create the virtual machine
```
$ docker-machine create --driver=virtualbox virtualmachine
$ eval "$(docker-machine env virtualmachine)"
```

### Build the environment
```
$ cd ~/folder-to-docker-configuration
$ docker-compose build
$ docker-compose up -d
```

### Here is some tips :
+ You can add virtual hosts as much as you want by placing your configuration in `~/vbox/conf/sites`. You just must run these commands :
    - `$ docker-compose build --no-cache`
    - `$ docker-compose up -d`
+ `docker.sh` is bash script to make start/restart easier. You'll just have to extract it from this folder and update the path to your docker configuration folder. It works as following :
    - `$ ./docker.sh start (or restart) virtualmachine`
+ `bash_aliases` also contains an alias to make the connection to a docker container easier : `$ godocker`. For example, to connect to the PHP-FPM container : just run
`$ godocker virtualmachine_web_1`







