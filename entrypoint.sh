#!/bin/sh

RUN_DIR=/usr/local/frontui/

#ENV API_HOST "127.0.0.1"
#ENV API_PORT "9876"
#ENV RUN_PORT 9000

#update backend server 
sed 's/baseURL: \"http:\/\/localhost:9876\/api\"/baseURL: \"http:\/\/'$API_HOST':'$API_PORT'\/api\"/' $RUN_DIR/conf/application.conf

#update running port
#sed 's/http.port=80/http.port='$RUN_PORT'/' $RUN_DIR/bin/server
sed 's/http.port=80/http.port='$RUN_PORT'/' $RUN_DIR/runsui.sh

exec "$@" 
