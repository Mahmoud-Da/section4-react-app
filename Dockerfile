FROM node:14.16.0-alpine3.13
# after spicify the base image we can run
# docker build -t react-app . # . for current dirctory


# docker image ls  # to check all the images in our machines
# REPOSITORY     TAG       IMAGE ID       CREATED        SIZE
# react-app      latest    81c56c8c021b   2 years ago    116MB


# docker run -it react-app
# Welcome to Node.js v14.16.0.
# Type ".help" for more information.
# > x = 1
# 1
# > console.log(x)
# 1

# docker run -it react-app bash  # to run command mode
# Error: Cannot find module '/bash' #=> alpine linux don`t come with bash that why it`s light-wieght {it`s only come with shell}

# docker run -it react-app sh # sh is shortcut for shell
# / # ls
# bin    etc    lib    mnt    proc   run    srv    tmp    var
# dev    home   media  opt    root   sbin   sys    usr
# / # node --version
# v14.16.0

WORKDIR /app
# using WORKDIR we can use relative path ex{before: COPY . /app/ after: COPY . .}

COPY . .
# to copy all in current dirctory

# COPY package*.json README.md /app/
# we can chose only the file inside the current dirctory coz {docker build -t react-app .} we chose it when we run the image

# COPY ["hello world.txt", "."]
# if a file name has a space


# ADD is same as COPY but has two features
# ADD http://../file.json .
# 1- copy from URL 

# ADD file.zip .
# 2- file will automatically compresd the file 

# best to practice to chose COPY coz don`t have a magical thing and origin {only used when 1 and 2}

# docker run -it react-app sh 
# /app # ls
# Dockerfile         node_modules       package.json       src
# README.md          package-lock.json  public             yarn.lock  #{coz we set the current dirctory}


RUN npm install
# after we used .dockerignore we had one problem we lost node_module file
# coz we ignored node_module
# /app # ls
# Dockerfile         package-lock.json  public             yarn.lock
# README.md          package.json       src
# here we use Run commnad

# docker run -it react-app sh
# /app # ls
# Dockerfile         node_modules       package.json       src
# README.md 


ENV API_URL=http://api.myapp.com/
# to set the enviroment varibles {we can wirte witout = API_URL http://api.myapp.com/
# but to make readable it`s better to use it }

# docker run -it react-app sh
# # printenv
# NODE_VERSION=14.16.0
# HOSTNAME=a3db73d270b3
# YARN_VERSION=1.22.5
# SHLVL=2
# HOME=/root
# TERM=xterm
# PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# PWD=/app
# API_URL=http://api.myapp.com/

# /app # printenv API_URL
# http://api.myapp.com/
# /app # echo $API_URL
# http://api.myapp.com/

