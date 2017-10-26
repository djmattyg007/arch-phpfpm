**Application**

[php-fpm](https://secure.php.net/)

**Description**

PHP is a server-side scripting language designed for web development, but which can also be used as a general-purpose programming language. PHP can be added to straight HTML or it can be used with a variety of templating engines and web frameworks. PHP code is usually processed by an interpreter, which is either implemented as a native module on the web-server or as a common gateway interface (CGI).

**Build notes**

Latest stable php-fpm release, using the following Arch Linux packages:

  - php
  - php-fpm
  - php-apcu
  - php-intl

**Usage**

```
docker run \
    --net="host" \
    --rm=true \
    --name=<container name> \
    -v <path for PHP files>:/srv/http \
    -v /etc/localtime:/etc/localtime:ro \
    -e TZ=<your timezone> \
    djmattyg007/arch-phpfpm
```

Please replace all user variables in the above command defined by <> with the correct values.
Specifying the TZ environment variable is optional. UTC will be used if it is not specified.

**Access application**

Connect to php-fpm using its TCP socket on `<host ip>:9000`

**Example**

```
docker run \
    --net="host" \
    --rm=true \
    --name=php-fpm \
    -v /srv/http:/srv/http \
    -v /etc/localtime:/etc/localtime:ro \
    -e TZ=Australia/Melbourne \
    djmattyg007/arch-phpfpm
```
