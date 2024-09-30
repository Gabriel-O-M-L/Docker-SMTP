FROM ubuntu:latest
LABEL authors="gabrieloliveira"

RUN apt-get update && \
    apt-get install -y postfix

COPY ./postfix/main.cf /etc/postfix/main.cf
COPY ./postfix/master.cf /etc/postfix/master.cf
COPY ./message.txt /usr/local/bin/message.txt

RUN echo '#!/bin/bash\nsendmail -t < /usr/local/bin/message.txt' > /usr/local/bin/send_email.sh && \
    chmod +x /usr/local/bin/send_email.sh


# Permissões corretas para arquivos de configuração
RUN chmod 644 /etc/postfix/main.cf && \
    chmod 644 /etc/postfix/master.cf && \
    chmod 644 /usr/local/bin/message.txt


RUN mkdir -p /var/spool/postfix/public
RUN chown postfix:postfix /var/spool/postfix/public
RUN chmod 755 /var/spool/postfix/public


RUN echo '#!/bin/bash\nsendmail -t < /usr/local/bin/message.txt' > /usr/local/bin/send_email.sh && \
    chmod +x /usr/local/bin/send_email.sh

EXPOSE 8009

ENTRYPOINT ["postfix", "start-fg"]
