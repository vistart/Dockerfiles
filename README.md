[![php-official - Build and Deploy to Aliyun Container Registry](https://github.com/vistart/Dockerfiles/actions/workflows/build_and_deploy.yml/badge.svg?branch=php-official&event=push)](https://github.com/vistart/Dockerfiles/actions/workflows/build_and_deploy.yml)

# PHP Officials

These images are transferred to the following node of Aliyun Container Registry.

```
registry.cn-hongkong.aliyuncs.com/vistart_public/php_official:<tag>
registry.cn-shanghai.aliyuncs.com/vistart_public/php_official:<tag>
registry.cn-guangzhou.aliyuncs.com/vistart_public/php_official:<tag>
registry.cn-chengdu.aliyuncs.com/vistart_public/php_official:<tag>
registry.us-west-1.aliyuncs.com/vistart_public/php_official:<tag>
registry.eu-central-1.aliyuncs.com/vistart_public/php_official:<tag>
registry.ap-southeast-2.aliyuncs.com/vistart_public/php_official:<tag>
registry.me-east-1.aliyuncs.com/vistart_public/php_official:<tag>
registry.ap-southeast-1.aliyuncs.com/vistart_public/php_official:<tag>
```

The supported tags are as follows:
- `8.2-cli` \ `cli`
- `8.2-apache` \ `apache`
- `8.1-cli`
- `8.1-apache`
- `8.0-cli`
- `8.0-apache`
- `7.4-cli` (no longer updated)
- `7.4-apache` (no longer updated)

This image has installed all the necessary software, as follows:

- `axel`
- `wget`
- `git`
- `zlib1g-dev`
- `libzip-dev`
- `zip`
- `unzip`
- `libmcrypt-dev` (removed from PHP 8.1 and later)
- `libicu-dev`
- `libpng-dev`
- `libonig-dev`
- `imagemagick`
- `libfreetype6-dev`
- `libjpeg62-turbo-dev`
- `libwebp-dev`
- `libmagickwand-dev`
- `openssl`
- `libssl-dev`
- `librabbitmq-dev`

This image has downloaded the following PECL extensions:

- https://pecl.php.net/get/xdebug
- https://pecl.php.net/get/mongodb
- https://pecl.php.net/get/timezonedb
- https://pecl.php.net/get/imagick
- https://pecl.php.net/get/igbinary
- https://pecl.php.net/get/amqp
- https://pecl.php.net/get/libsodium
- https://pecl.php.net/get/mcrypt

and libsodium.