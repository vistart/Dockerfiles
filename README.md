[![vlmcsd - Build and Deploy to Aliyun Container Registry](https://github.com/vistart/Dockerfiles/actions/workflows/build_and_deploy.yml/badge.svg?branch=vlmcsd&event=push)](https://github.com/vistart/Dockerfiles/actions/workflows/build_and_deploy.yml)

# VLMCSD

The Dockerfile is taken from <https://github.com/Wind4/vlmcsd-docker> and is built
by GitHub Actions, then pushed to the Shanghai node of Aliyun Container Registry.

```
registry.cn-shanghai.aliyuncs.com/vistart_public/vlmcsd:1113
```

Platforms: `linux/amd64`, `linux/arm64`

## Usage

```bash
docker run -idt -p 1688:1688 registry.cn-shanghai.aliyuncs.com/vistart_public/vlmcsd:1113
```

Or with the bundled compose file:

```bash
docker compose -f vlmcsd/docker-compose.yml up -d
```

The container listens on `1688/tcp` and runs `vlmcsd -D -d`.

## Trigger

- Push to `vlmcsd` branch
- Manual: via `workflow_dispatch`

## Upstream

- Dockerfile: <https://github.com/Wind4/vlmcsd-docker>
- Source: <https://github.com/Wind4/vlmcsd>
