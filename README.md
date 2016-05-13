## dockerui
Docker UI for Synereo

## Building Synereo UI Docker Image
This is to setup Synereo UI. These instructions are valid for first time use and once docker images are created and working then use `docker start ...` command. 

## Prerequisites
 * Minimum 2GB RAM but 4 GB RAM is recommended for compling the source code.
 * Basic knowledge of Docker. Docker installed (https://www.docker.com/) and running Docker process. Using  [Kitematic](https://docs.docker.com/kitematic/) to start the docker process is very helpful and advisable if using Windows or Mac. On modern linux kernel based system, such as Arch Linux, you can just use plain [Docker](https://wiki.archlinux.org/index.php/Docker). Make a note of assigned IP address when starting up Docker and for example, in Windows and Mac, assigned IP address is 192.168.99.100. <!--- If want to use existing Docker image to run backend (preferred method) then use the image from Docker hub using `docker pull livelygig/ui` after that jump to 'Running' section below and change the docker image to `livelygig/backend` from `spliciousbkendimage` in docker run command. --->
 * 
 
