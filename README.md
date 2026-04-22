# Dockerfiles

Please choose specific branch which fit for your need.

## postgres 分支

基于官方 PostgreSQL 镜像构建，预先安装常用扩展插件。

### 版本与预装扩展

| 版本 | 基础镜像 | 支持架构 | 预装扩展 |
|------|----------|----------|----------|
| 12 | postgres:12 | amd64, arm64, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, timescaledb |
| 13 | postgres:13 | amd64, arm64, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 14 | postgres:14 | amd64, arm32v5, arm32v6, arm32v7, arm64v8, i386, mips64le, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, timescaledb |
| 15 | postgres:15 | amd64, arm32v5, arm32v6, arm32v7, arm64v8, i386, mips64le, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 16 | postgres:16 | amd64, arm32v5, arm32v6, arm32v7, arm64v8, i386, mips64le, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 17 | postgres:17 | amd64, arm32v5, arm32v6, arm32v7, arm64v8, i386, mips64le, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |
| 18 | postgres:18 (latest) | amd64, arm32v5, arm32v6, arm32v7, arm64v8, i386, mips64le, ppc64le, s390x | postgis-3, repack, cron, wal2json, pglogical, pgvector, timescaledb |

### 扩展说明

- **PostGIS**: 地理空间数据支持
- **pgvector**: 向量搜索 (PG13+)
- **pg_cron**: 定时任务
- **pg_repack**: 在线重建表/索引
- **wal2json**: WAL 日志解析
- **pglogical**: 逻辑复制
- **TimescaleDB**: 时序数据库 (PG12+)

### 推送地址

- **Docker Hub**: `vistart/postgres-exts`
- **阿里云**: `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts`

### 使用示例

```bash
# 从阿里云拉取 latest
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts:latest

# 从阿里云拉取指定版本
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts:16

# 从 Docker Hub 拉取
docker pull vistart/postgres-exts:16
```