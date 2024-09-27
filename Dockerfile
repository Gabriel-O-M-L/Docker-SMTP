FROM ubuntu:latest
LABEL authors="gabrieloliveira"

RUN apt-get update && \
    apt-get install -y postfix

COPY ./postfix/main.cf /etc/postfix/main.cf
COPY ./postfix/master.cf /etc/postfix/master.cf
COPY ./message.txt /usr/local/bin/message.txt

EXPOSE 8009

ENTRYPOINT ["postfix", "start-fg"]