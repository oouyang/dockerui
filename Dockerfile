# Set the base image
FROM alpine:3.3

LABEL description="Synereo Front End Docker Image Beta" version="0.1.0"
MAINTAINER N<ns68751+dockerfile@gmail.com>

ENV API_HOST "127.0.0.1"
ENV API_PORT "9876"
ENV RUN_PORT "9000"

ENV W_DIR /usr/local
WORKDIR $W_DIR
#ADD ivy2.tar.gz /root/
#ADD sbt.tar.gz /root/

RUN \
    echo http://dl-4.alpinelinux.org/alpine/v3.3/main >> /etc/apk/repositories && \
    echo http://dl-4.alpinelinux.org/alpine/v3.3/community>> /etc/apk/repositories && \
    apk --update add bash git openjdk8 openssh-client && \
    rm -rf /var/cache/apk/* && \
    wget https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.tgz -O \
         /usr/lib/sbt-0.13.11.tgz && \
    cd /usr/lib/ && \
    tar -xzvf sbt-0.13.11.tgz && \
    rm -rf sbt-0.13.11.tgz && \
    cd /usr/bin && \
    ln -s ../lib/sbt/bin/sbt sbt && \
    \
    mkdir -p $W_DIR/frontuic $W_DIR/frontui && \
    cd $W_DIR/frontuic && \
    git clone -b synereo https://github.com/LivelyGig/ProductWebUI.git . && \
    sbt -verbose -Dconfig.trace=loads stage && \
    mv $W_DIR/frontuic/server/target/universal/stage/* $W_DIR/frontui/ && \
    cd $W_DIR/frontui && \
#    mv bin/server bin/server.bak && \
#    awk 'NR==6{print "export JAVA_OPT=-Dhttp.port=80"}7' bin/server.bak | tee -a bin/server && \
    \
    chmod 755 bin/server && \
    touch runsui.sh ; chmod 755 runsui.sh && \
    echo "bin/server -verbose -Dhttp.port=80 -Dplay.crypto.secret=\"s3cr3t\" >&- 2>&- <&- &" |tee -a $W_DIR/frontui/runsui.sh

COPY entrypoint.sh $W_DIR/
WORKDIR $W_DIR/frontui/
     
EXPOSE 9876
ENTRYPOINT ["$W_DIR/entrypoint.sh"]
CMD [ "$W_DIR/frontui/runsui.sh" ]
