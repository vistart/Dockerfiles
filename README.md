# Dockerfiles

Considering that Docker Hub is not accessible in mainland China, this branch transfers commonly used Docker images to the Aliyun Container Registry via GitHub Actions.

## Transfer Stages

Images are transferred in stages with sequential dependencies:

| Stage | Image | Tags |
|-------|-------|------|
| 1 | `alpine` | `latest` |
| 2 | `redis` | `latest`, `8.10`, `8.8`, `8.6`, `8.4`, `8.2`, `8.0`, `7.4`, `7.2`, `7.0` |
| 2 | `redis/redis-stack` | `latest` |
| 3 | `mysql` | `latest`, `innovation`, `lts`, `9.7`, `8.4`, `8.0` |
| 4 | `postgres` | `14`, `15`, `16`, `17`, `18`, `19rc1`, `latest`, `15-alpine` |
| 5 | `mariadb` | `12.2`, `12.1`, `12.0`, `10.0`, `10.1`, `10.2`, `10.3`, `10.4`, `10.5`, `10.6`, `10.11`, `11.4`, `11.7`, `11.8`, `latest`, `lts`, `12.3`, `13.0`, `13.1-rc` |
| 6 | `firebirdsql/firebird` | `3`, `4`, `5`, `6-snapshot`, `latest` |
| 7 | `gvenzl/oracle-xe` | `11-slim`, `18-slim`, `21-slim` |
| 7 | `gvenzl/oracle-free` | `23-slim` |
| 8 | `clickhouse` | `latest`, `lts`, `26.9`, `26.8`, `25.8` |
| 9 | `mongo` | `latest`, `7`, `8`, `9`, `4.4.18` |
| 10 | `php` | `8.1`, `8.2`, `8.3`, `8.4`, `8.5` |
| 11 | `python` | `3.8-slim`, `3.9-slim`, `3.10-slim`, `3.11-slim`, `3.12-slim`, `3.13-slim`, `3.14-slim`, `3.15-slim` |

Notes:
- `mysql` uses moving tags to avoid chasing the quarterly Innovation line: `latest` / `innovation` always point to the newest Innovation release (calendar versioning `YY.M`, e.g. `26.10`), `lts` to the newest LTS line (`9.7`), while `9.7` / `8.4` track their own LTS lines.
- `mongo` `4.4.18` is kept on purpose: it is the last version supporting the `armv8` architecture.
- `python` `3.8-slim` / `3.9-slim` are kept for legacy compatibility; upstream has stopped updating those tags.

## Destination Registry

```
registry.cn-shanghai.aliyuncs.com/vistart_public/<image>:<tag>
registry.us-west-1.aliyuncs.com/vistart_public/<image>:<tag>
```

## Trigger

- Push to `common-images-transition` branch
- Scheduled: 3:00 AM on the 15th of each month
- Manual: via `workflow_dispatch`

> Note: This branch only performs image transfer (pull from Docker Hub and push to Aliyun). For custom built images (e.g. PHP with extensions), see the `php` branch.