FROM ubuntu:latest
LABEL authors="gabrieloliveira"

RUN apt-get update && \
    apt-get install -y postfix

COPY ./postfix/main.cf /etc/postfix/main.cf
COPY ./postfix/master.cf /etc/postfix/master.cf
COPY ./message.txt /usr/local/bin/message.txt

RUN echo '#!/bin/bash\nsendmail -t < /usr/local/bin/message.txt' > /usr/local/bin/send_email.sh && \
    chmod +x /usr/local/bin/send_email.sh

EXPOSE 8009

ENTRYPOINT ["postfix", "start-fg"]