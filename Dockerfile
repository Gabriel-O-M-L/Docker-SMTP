FROM ubuntu:latest
LABEL authors="gabrieloliveira"

RUN apt-get update && \
    apt-get install -y postfix

COPY ./postfix/main.cf /etc/postfix/main.cf

EXPOSE 8001

ENTRYPOINT ["postfix", "start-fg"]