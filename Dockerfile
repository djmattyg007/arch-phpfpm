FROM djmattyg007/arch-runit-base:2017.01.14-3
MAINTAINER djmattyg007

ENV PHPFPMIMAGE_VERSION=2017.01.14-2

# Add install bash script
COPY setup/root/*.sh /root/
COPY setup/init.sh /etc/service/php-fpm/run

# Run bash script to install teamspeak server
RUN /root/install.sh && \
    rm /root/*.sh

ENTRYPOINT ["/usr/bin/init"]
