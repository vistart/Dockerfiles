# Dockerfiles for PHP & Apache2

These images are all based on the official [php](https://hub.docker.com/_/php) images and the following extensions are enabled:
- bcmath
- intl
- mcrypt (removed from PHP 8.1 and later)
- mbstring
- mysqli
- redis
- soap
- pcntl
- pdo
- pdo_mysql
- gd
- zip
- [amqp](https://pecl.php.net/package/amqp)
- [igbinary](https://pecl.php.net/package/igbinary)
- [imagick](https://pecl.php.net/package/imagick)
- [libsodium](https://pecl.php.net/package/libsodium)
- [mongdb](https://pecl.php.net/package/mongodb)
- [timezonedb](https://pecl.php.net/package/timezonedb)
- [xdebug](https://pecl.php.net/package/xdebug)

The following software is installed:
- git
- imagemagick
- libfreetype6-dev
- libjpeg62-turbo-dev
- libicu-dev
- libmcrypt-dev (removed from PHP 8.1 and later)
- libmagickwand-dev
- libpng-dev
- librabbitmq-dev (amqp extension required)
- libssl-dev (mongodb extension required)
- libzip-dev (zip extension required)
- openssl (mongodb extension required)
- wget
- unzip (zip extension required)
- zip (zip extension required)
- zlib1g-dev

The following apache2 module(s) are enabled:
- rewrite
- ssl

Also installed is [composer](https://getcomposer.org).

# Supported tags and respective `Dockerfile` links
- 8.1.1 ([`8.1-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile-8.1)) \  ([`apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile))
- 8.0.14 ([`8.0-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile))
- 7.4.27 ([`7.4-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile))
- 7.3.33 ([`7.3-apache`](https://github.com/vistart/Dockerfiles/blob/php/php/apache/Dockerfile)) (no longer updated)
- 8.1.1 ([`8.1-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile-8.1)) \  ([`cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile))
- 8.0.14 ([`8.0-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile))
- 7.4.27 ([`7.4-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile))
- 7.3.33 ([`7.3-cli`](https://github.com/vistart/Dockerfiles/blob/php/php/cli/Dockerfile)) (no longer updated)

# Supported CPU Archs:
- linux/386
- linux/amd64
- linux/arm64
- linux/ppc64le

# Supported Container Registry:
- [Docker Hub](https://hub.docker.com/r/vistart/php)
- Aliyun Container Registry:
  - Hongkong, China: `registry.cn-hongkong.aliyuncs.com/vistart_public/php`
  - Shanghai, China: `registry.cn-shanghai.aliyuncs.com/vistart_public/php`
  - Tokyo, Japan: `registry.ap-northeast-1.aliyuncs.com/vistart_public/php`
  - London, UK: `registry.eu-west-1.aliyuncs.com/vistart_public/php`
  - Silicon Valley, US: `registry.us-west-1.aliyuncs.com/vistart_public/php`
  - Frankfurt, Germany: `registry.eu-central-1.aliyuncs.com/vistart_public/php`
  - Sydney, Australia: `registry.ap-southeast-2.aliyuncs.com/vistart_public/php`
  - Dubai, UAE: `registry.me-east-1.aliyuncs.com/vistart_public/php`
  - Singapore: `registry.ap-southeast-1.aliyuncs.com/vistart_public/php`

We will release the corresponding images within one week of the official release of the new version of PHP.

> If the above nodes do not meet your requirements, you can commit your requirements in `issues`. If the demand does not significantly increase the cost, we can consider adding new nodes.

# How to Use
Please refer to [official php image](https://hub.docker.com/_/php/).

# How to build
Use git to download the dockerfile locally:
`git clone --branch=php https://github.com/vistart/Dockerfiles`

Switch the current directory to the directory where the dockerfile is saved and build it:

`docker build . --build-arg TAG=apache`

or

`docker build . --build-arg TAG=8.1-apache`

# Troubleshooting

## `composer-setup.sh` NOT FOUND

This problem is caused by the end of the `composer-setup.sh` file not conforming to the unix format.

Solution: Use `dos2unix` to convert the `composer-setup.sh` file:

```
$ dos2unix composer-setup.sh
```
