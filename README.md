# Dockerfiles

Please choose specific branch which fit for your need.

## postgres 分支

基于官方 PostgreSQL 镜像构建，预先安装常用扩展插件。

### 预装扩展

- **PostGIS**: 地理空间数据支持
- **pgvector**: 向量搜索
- **pg_cron**: 定时任务
- **pg_repack**: 在线重建表/索引
- **pgaudit**: 审计日志
- **wal2json**: WAL 日志解析
- **pg_partman**: 分区管理
- **pglogical**: 逻辑复制
- **hypopg**: 虚拟索引
- **orafce**: Oracle 兼容函数
- **pgrouting**: 路径规划
- **pg_stat_kcache**: 性能统计
- **pg_qualstats**: 查询统计
- **TimescaleDB**: 时序数据库（PG12+）

### 支持版本

9.6, 10, 11, 12, 13, 14, 15, 16, 17, 18

### 推送地址

- **Docker Hub**: `vistart/postgres`
- **阿里云**: `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres`

### 使用示例

```bash
# 从阿里云拉取
docker pull registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:16

# 从 Docker Hub 拉取
docker pull vistart/postgres:16
```