FROM alpine

RUN apk --update add openssh
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN rm -rf /var/cache/apk/* /tmp/*

EXPOSE 22

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
