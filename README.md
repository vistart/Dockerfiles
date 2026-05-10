# Dockerfiles

Considering that Docker Hub is not accessible in mainland China, this branch transfers commonly used Docker images to the Aliyun Container Registry via GitHub Actions.

## Transfer Stages

Images are transferred in stages with sequential dependencies:

| Stage | Image | Tags |
|-------|-------|------|
| 1 | `alpine` | `latest` |
| 2 | `redis` | `latest`, `8.4`, `8.2`, `8.0`, `7.4`, `7.2`, `7.0`, `6.2` |
| 2 | `redis/redis-stack` | `latest` |
| 3 | `clickhouse` | `latest`, `lts`, `26.1`, `25.12`, `25.10`, `25.9`, `25.7`, `25.3` |
| 4 | `php` | `8.1`, `8.2`, `8.3`, `8.4`, `8.5` |
| 5 | `mysql` | `latest`, `9.4`, `9.2`, `8.4`, `8.0`, `5.7`, `5.6` |
| 6 | `mongo` | `latest`, `7`, `4.4.18` |
| 7 | `postgres` | `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `latest`, `15-alpine` |
| 7 | `nginx` | `latest` |
| 8 | `mariadb` | `latest`, `12.0`, `10.0`, `10.1`, `10.2`, `10.3`, `10.4`, `10.5`, `10.6`, `10.11`, `11.4`, `11.7`, `11.8` |
| 9 | `gvenzl/oracle-xe` | `11-slim`, `18-slim`, `21-slim` |
| 9 | `gvenzl/oracle-free` | `23-slim` |

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