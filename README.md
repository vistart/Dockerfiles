# Dockerfiles

Please choose specific branch which fit for your need.

## postgres 分支

基于官方 PostgreSQL 镜像构建，预先安装常用扩展插件。

### 版本与预装扩展

| 版本 | 基础镜像 | 支持架构 | 预装扩展 |
|------|----------|----------|----------|
| 9 | postgres:9 | amd64, arm64, arm, 386 | postgis-2.3, repack, pgrouting, pgtap, orafce |
| 10 | postgres:10 | amd64, arm64 | repack, cron, wal2json, pglogical, pgaudit, orafce, pgtap, hypopg |
| 11 | postgres:11 | amd64, arm64 | repack, cron, wal2json, pglogical, pgaudit, orafce, pgtap, hypopg |
| 12 | postgres:12 | amd64, arm64, ppc64le | repack, cron, wal2json, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3*, pgrouting*, partman*, timescaledb* |
| 13 | postgres:13 | amd64, arm64, ppc64le | repack, cron, wal2json, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3*, pgrouting*, partman* |
| 14 | postgres:14 | amd64, arm64, ppc64le | repack, cron, wal2json, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3*, pgrouting*, partman* |
| 15 | postgres:15 | amd64, arm64, ppc64le | repack, cron, wal2json, pgaudit, orafce, pgtap, hypopg, pglogical, pgvector, postgis-3*, pgrouting*, partman*, timescaledb* |
| 16 | postgres:16 | amd64, arm64, ppc64le | repack, cron, wal2json, pgaudit, orafce, pgtap, hypopg, pglogical, pgvector, postgis-3*, pgrouting*, partman*, timescaledb* |
| 17 | postgres:17 | amd64, arm64, ppc64le | repack, cron, wal2json, pgaudit, orafce, pgtap, hypopg, pglogical, pgvector, postgis-3*, pgrouting*, partman*, timescaledb* |
| 18 | postgres:18 (latest) | amd64, arm64, ppc64le | repack, cron, wal2json, pgaudit, orafce, pgtap, hypopg, pglogical, pgvector, postgis-3*, pgrouting*, partman*, timescaledb* |

> \* 标记的扩展依赖 Debian 系统库（如 libgdal、libgeos 等），在受限网络环境下可能跳过安装。

### 架构说明

PGDG (PostgreSQL Global Development Group) APT 仓库仅提供以下架构的扩展包：

- **amd64** / **arm64** / **ppc64le**

因此不支持以下架构：

- **s390x**: PGDG 无此架构的扩展包，已从 PG12/13 中移除
- **i386 (386)**: PGDG 于 2024 年 7 月移除 i386 支持，已从 PG14-18 中移除
- **arm (armv7)**: 仅 PG9 基础镜像支持且无 PGDG 扩展包，仅安装 Debian 官方仓库中可用的扩展

### 扩展说明

- **PostGIS**: 地理空间数据支持（PG9 为 postgis-2.3，PG12+ 为 postgis-3）
- **pgvector**: 向量搜索（PG12+）
- **pg_cron**: 定时任务（PG10+）
- **pg_repack**: 在线重建表/索引
- **wal2json**: WAL 日志解析（PG10+）
- **pglogical**: 逻辑复制（PG10+）
- **pgaudit**: 审计日志（PG10+）
- **orafce**: Oracle 兼容函数
- **pgtap**: 数据库测试框架
- **hypopg**: 虚拟索引（PG10+）
- **pgrouting**: 路径规划（PG9, PG12+）
- **pg_partman**: 分区管理（PG12+）
- **TimescaleDB**: 时序数据库（PG12, PG15+；PG13/14 不再受 TimescaleDB 支持）

### 推送地址

- **Docker Hub**: `vistart/postgres-exts`
- **阿里云（上海）**: `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts`
- **阿里云（美西）**: `registry.us-west-1.aliyuncs.com/vistart_public/postgres-exts`

### 使用示例

```bash
# 从阿里云拉取 latest
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts:latest

# 从阿里云拉取指定版本
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts:16

# 从 Docker Hub 拉取
docker pull vistart/postgres-exts:16
```
