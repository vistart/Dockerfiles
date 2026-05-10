# Dockerfiles for PHP & Apache2

These images are built from the official [php](https://hub.docker.com/_/php) images with multi-stage build.

## Enabled Extensions

| Extension | 8.1 | 8.2 | 8.3 | 8.4 | 8.5 |
|-----------|-----|-----|-----|-----|-----|
| bcmath | ✓ | ✓ | ✓ | ✓ | ✓ |
| intl | ✓ | ✓ | ✓ | ✓ | ✓ |
| mbstring | ✓ | ✓ | ✓ | ✓ | ✓ |
| mysqli | ✓ | ✓ | ✓ | ✓ | ✓ |
| pcntl | ✓ | ✓ | ✓ | ✓ | ✓ |
| pdo | ✓ | ✓ | ✓ | ✓ | ✓ |
| pdo_mysql | ✓ | ✓ | ✓ | ✓ | ✓ |
| pdo_pgsql | ✓ | ✓ | ✓ | ✓ | ✓ |
| gd | ✓ | ✓ | ✓ | ✓ | ✓ |
| zip | ✓ | ✓ | ✓ | ✓ | ✓ |
| iconv | ✓ | ✓ | ✓ | ✓ | ✓ |
| soap | ✓ | ✓ | ✓ | ✓ | ✓ |
| redis | ✓ | ✓ | ✓ | ✓ | ✓ |
| xdebug | ✓ | ✓ | ✓ | ✓ | ✓ |
| mongodb | ✓ | ✓ | ✓ | ✓ | ✓ |
| timezonedb | ✓ | ✓ | ✓ | ✓ | ✓ |
| igbinary | ✓ | ✓ | ✓ | ✓ | ✓ |
| sodium | ✓ | ✓ | ✓ | ✓ | ✓ |
| amqp | ✓ | ✓ | ✓ | ✓ | ✗ |
| imagick | ✓ | ✓ | ✗ | ✗ | ✓ |
| mcrypt | ✓ | ✗ | ✗ | ✗ | ✓ |
| phpy | ✓ | ✓ | ✓ | ✗ | ✓ |

## Installed Software

- git
- axel
- wget
- python3-dev
- imagemagick
- libfreetype6-dev
- libjpeg62-turbo-dev
- libicu-dev
- libmcrypt-dev
- libmagickwand-dev
- libpng-dev
- libonig-dev
- librabbitmq-dev
- libssl-dev
- libzip-dev
- openssl
- zlib1g-dev
- zip / unzip

## Apache2 Modules

- rewrite
- ssl

## Other

- [composer](https://getcomposer.org)

## Supported Tags

| Tags | Variants |
|------|----------|
| `8.5-cli`, `8.5-apache`, `cli`, `apache` | PHP 8.5 |
| `8.4-cli`, `8.4-apache` | PHP 8.4 |
| `8.3-cli`, `8.3-apache` | PHP 8.3 |
| `8.2-cli`, `8.2-apache` | PHP 8.2 |
| `8.1-cli`, `8.1-apache` | PHP 8.1 |

`cli` / `apache` tags point to the latest PHP 8.5.

## Supported CPU Architectures

- linux/386
- linux/amd64
- linux/arm/v6
- linux/arm/v7
- linux/arm64
- linux/ppc64le
- linux/s390x

## Supported Container Registry

- `registry.cn-shanghai.aliyuncs.com/vistart_public/php`

## How to Use

Please refer to [official php image](https://hub.docker.com/_/php/).

## How to Build

```bash
git clone --branch=php https://github.com/vistart/Dockerfiles
cd Dockerfiles/php
docker build . --build-arg TAG=8.5-cli --build-arg PHP_VERSION=8.5
docker build . --build-arg TAG=8.4-apache --build-arg PHP_VERSION=8.4
```