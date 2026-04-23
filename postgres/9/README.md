# PostgreSQL 9.6

基于 `postgres:9` 官方镜像构建，包含常用扩展。

## 已安装的扩展

| 扩展 | 版本 | 说明 |
| --- | --- | --- |
| PostGIS | 2.3.1 | 地理空间数据支持 |
| pg_repack | 1.3.4 | 在线重建索引和表 |
| pgRouting | 2.3.2 | 路径规划功能 |
| pgTAP | 0.97.0 | 单元测试框架 |
| orafce | 3.3 | Oracle 兼容函数 |

## 不可用的扩展

由于 PostgreSQL 9.6 版本限制，以下扩展**不可用**：

- `pg_cron` - PostgreSQL 10+ 才支持此扩展
- `wal2json` - 需要较新版本的 PostgreSQL
- `pglogical` - 需要较新版本的 PostgreSQL
- `pgvector` - 需要较新版本的 PostgreSQL
- `pgaudit` - 需要较新版本的 PostgreSQL
- `hypopg` - 需要较新版本的 PostgreSQL
- `partman` - 需要较新版本的 PostgreSQL

## 支持的架构

- `amd64`
- `arm64` (armv8)

## 环境变量

启动容器时必须指定以下环境变量：

- `POSTGRES_DB` - 数据库名称，例如 `test_db`
- `POSTGRES_PASSWORD` - 超级用户密码，例如 `password`
- `POSTGRES_USER` - 超级用户名，例如 `root`
- `TZ` - 时区，例如 `Asia/Shanghai`

## 配置

已在 `postgresql.conf.sample` 中预配置：

```
shared_preload_libraries = 'pg_stat_statements,auto_explain'
pg_stat_statements.track = all
```

## 使用示例

```bash
# 运行容器
docker run -d --name postgres96 \
    -e POSTGRES_DB=test_db \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_USER=root \
    -e TZ=Asia/Shanghai \
    vistart/postgres-exts:9.6

# 启用扩展
docker exec -it postgres96 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS postgis;"
docker exec -it postgres96 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS pg_repack;"
docker exec -it postgres96 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS pgrouting;"
docker exec -it postgres96 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS pgtap;"
docker exec -it postgres96 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS orafce;"
```
