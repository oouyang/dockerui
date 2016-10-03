
## Docker UI for Synereo

This process is to setup Synereo UI docker image and is valid for first time image creation. Once docker image is created and working then use `docker start ...` command for subsequent image executions. This building process takes around 25-40 minutes.

## Prerequisites
 * Minimum 2GB RAM but 4 GB RAM is recommended for compling the source code.
 * Basic knowledge of Docker. Docker installed (https://www.docker.com/) and running Docker process. Using  [Kitematic](https://docs.docker.com/kitematic/) to start the docker process is very helpful and advisable if using Windows or Mac. On modern linux kernel based system use `wget -qO- https://get.docker.com/ | sh`. Make a note of assigned IP address that shows up when starting Docker and for example, in Windows and Mac, assigned IP address is 192.168.99.100. 
 * Running [Synereo Backend Node](https://github.com/synereo/dockernode). If running the backend using docker image, it is  likely that the URL for the backend would be http://192.168.99.100:8888/agentui/agentui.html?demo=false. Please verify that backend node is working. This IP address and port number are used in the steps below.
 
<!---- 
If want to use existing Docker image to run backend (preferred method) then use the image from Docker hub using `docker pull livelygig/ui` after that jump to 'Running' section below and change the docker image to `livelygig/backend` from `spliciousbkendimage` in docker run command. 
--->
## Source files
Download files in a directory of your choice or use command as below to build Docker image (make sure docker is running and available). Windows users, run "git config --global core.autocrlf false" command before running the git clone command otherwise container may fail to execute properly.

    1. git clone https://github.com/synereo/dockerui.git SynereoUI
  
## Building
Run the following commands to build docker image

    2a. cd SynereoUI
    2b. docker build -t synereoui . 

  Use "synereoui" as image name in subsequent steps where image id is required. You can use image name of your choice and  it must be all lowercase.
  
## Running
There are two ways to run UI 
#### Running docker image - manual process: 
```
3a. docker run -it -p 80:9000 -e RUN_PORT=9000 -e API_HOST=192.168.99.100 -e API_PORT=8888 synereoui /bin/bash
```
At the # prompt, run the follwoing commands
    
    3b. cd /usr/local/frontui
    3c. ./runsui.sh

If want to see the log file then run `tail -f logs/application.log` command at # prompt.  
  
#### Running docker image - automated process: 
Below is the command to run Synereo UI.

```
3a. docker run -it -p 80:9000 -e RUN_PORT=9000 -e API_HOST=192.168.99.100 -e API_PORT=8888 -d synereoui /usr/local/frontui/runsui.sh

```
where `API_HOST: Synereo backend node host IP address` and `API_PORT: Synereo backend node host IP Address port`

## Accessing UI
Visit http://Docker\_IP\_Address>/ and login using any backend node username and password combination i.e. default admin username/password for backend node is admin@localhost/a. For example, navigate to http://192.168.99.100/ (or other port mapping used earlier) and then log in using username and password combination used to log into the backend node.
