# PostgreSQL 15

基于 `postgres:15` 官方镜像构建，包含多个常用扩展。

## 已安装的扩展

- **PostGIS** 3 - 地理空间数据支持
- **Repack** - 在线重建索引和表
- **pg_cron** - 定时任务调度
- **wal2json** - WAL JSON 输出
- **pgaudit** - 审计日志
- **orafce** - Oracle 兼容函数
- **pgrouting** - 路径规划
- **pgtap** - 单元测试框架
- **hypopg** - 假设索引
- **partman** - 分区管理
- **pglogical** - 逻辑复制
- **pgvector** - 向量数据库
- **TimescaleDB** 2 - 时序数据库

## 支持的架构

- `amd64`
- `arm64`
- `ppc64el`

## 环境变量

启动容器时必须指定以下环境变量：

- `POSTGRES_DB` - 数据库名称，例如 `test_db`
- `POSTGRES_PASSWORD` - 超级用户密码，例如 `password`
- `POSTGRES_USER` - 超级用户名，例如 `root`
- `TZ` - 时区，例如 `Asia/Shanghai`

## 配置

已在 `postgresql.conf.sample` 中预配置：

```
shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain,pgaudit'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
```

## 使用示例

```bash
# 运行容器
docker run -d --name postgres15 \
    -e POSTGRES_DB=test_db \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_USER=root \
    -e TZ=Asia/Shanghai \
    postgres:15

# 启用扩展
docker exec postgres15 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS postgis;"
docker exec postgres15 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS pgvector;"
docker exec postgres15 psql -U root -d test_db -c "CREATE EXTENSION IF NOT EXISTS timescaledb;"
```
