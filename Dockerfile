FROM djmattyg007/arch-runit-base:2017.01.14-7
MAINTAINER djmattyg007

ENV PHPFPMIMAGE_VERSION=2017.01.16-1

# Add install bash script
COPY setup/root/*.sh /root/
COPY setup/init.sh /etc/service/php-fpm/run

# Run bash script to install php-fpm
RUN /root/install.sh && \
    rm /root/install.sh /root/phpfpm.sh

ENTRYPOINT ["/usr/bin/init"]
