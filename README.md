# Dockerfiles for PHP & Apache2

These images are all based on the official [php](https://hub.docker.com/_/php) images and the following extensions are enabled:
- bcmath
- intl
- mbstring
- mysqli
- pcntl
- pdo
- pdo_mysql
- gd
- zip
- iconv
- [xdebug](https://pecl.php.net/package/xdebug)
- [mongdb](https://pecl.php.net/package/mongodb)
- [timezonedb](https://pecl.php.net/package/timezonedb)
- [imagick](https://pecl.php.net/package/imagick)
- [igbinary](https://pecl.php.net/package/igbinary)
- [amqp](https://pecl.php.net/package/amqp)
- [libsodium](https://pecl.php.net/package/libsodium)

The following software is installed:
- wget
- git
- libzip-dev (zip extension required)
- zlib1g-dev
- zip (zip extension required)
- unzip (zip extension required)
- libicu-dev
- libpng-dev
- imagemagick
- libfreetype6-dev
- libjpeg62-turbo-dev
- libmagickwand-dev
- openssl (mongodb extension required)
- libssl-dev (mongodb extension required)
- librabbitmq-dev (amqp extension required)

The following apache2 module(s) are enabled:
- rewrite
- ssl

Also installed is [composer](https://getcomposer.org).

# Supported tags and respective `Dockerfile` links
- 7.4.9 ([`7.4-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile)) \  ([`apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile))
- 7.3.21 ([`7.3-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile-7.2))
- 7.2.33 ([`7.2-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile-7.2))
- 7.4.9 ([`7.4-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile)) \  ([`cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile))
- 7.3.21 ([`7.3-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile-7.2))
- 7.2.33 ([`7.2-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile-7.2))

# Supported CPU Archs:
- linux/386
- linux/amd64
- linux/arm/v6
- linux/arm/v7
- linux/arm64
- linux/s390x
- linux/ppc64le (only PHP 7.4 with APACHE2 & CLI work)

# How to Use
Please refer to [official php image](https://hub.docker.com/_/php/).

# How to build
Use git to download the dockerfile locally:
`git clone --branch=php https://github.com/vistart/Dockerfiles`

Switch the current directory to the directory where the dockerfile is saved and build it:

`docker build . --build-arg TAG=apache`

or

`docker build . --build-arg TAG=7.4-apache`

# Troubleshooting

## `composer-setup.sh` NOT FOUND

This problem is caused by the end of the `composer-setup.sh` file not conforming to the unix format.

Solution: Use `dos2unix` to convert the `composer-setup.sh` file:

```
$ dos2unix composer-setup.sh
```
