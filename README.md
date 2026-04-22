# Dockerfiles

Please choose specific branch which fit for your need.

## postgres 分支

基于官方 PostgreSQL 镜像构建，预先安装常用扩展插件。

### 版本与预装扩展

| 版本 | 基础镜像 | 预装扩展 |
|------|----------|----------|
| 9.6 | 9.6.24-bullseye | postgis-2.5, repack, cron, wal2json, pglogical |
| 10 | 10.23-bullseye | postgis-2.5, repack, cron, wal2json, pglogical |
| 11 | 11.22-bookworm | postgis-3, repack, cron, wal2json, pglogical |
| 12 | 12.22-bookworm | postgis-3, repack, cron, wal2json, pglogical, timescaledb |
| 13 | 13.15-bookworm | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 14 | 14.22-bookworm | postgis-3, repack, cron, wal2json, pglogical, timescaledb |
| 15 | 15.17-bookworm | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 16 | 16.13-trixie | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 17 | 17.9-trixie | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 18 | 18.3-trixie (latest) | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |

### 扩展说明

- **PostGIS**: 地理空间数据支持
- **pgvector**: 向量搜索 (PG13+)
- **pg_cron**: 定时任务
- **pg_repack**: 在线重建表/索引
- **wal2json**: WAL 日志解析
- **pglogical**: 逻辑复制
- **TimescaleDB**: 时序数据库 (PG12+)

### 推送地址

- **Docker Hub**: `vistart/postgres`
- **阿里云**: `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres`

### 使用示例

```bash
# 从阿里云拉取 latest
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:latest

# 从阿里云拉取指定版本
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:16

# 从 Docker Hub 拉取
docker pull vistart/postgres:16
```