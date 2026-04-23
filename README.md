# Dockerfiles

Please choose specific branch which fit for your need.

## postgres 分支

基于官方 PostgreSQL 镜像构建，预先安装常用扩展插件。

### 版本与预装扩展

| 版本 | 基础镜像 | 支持架构 | 预装扩展 |
|------|----------|----------|----------|
| 9 | postgres:9 | amd64, arm64, arm, 386 | postgis-2.3, pgrouting, pgtap, orafce, pg_repack, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc |
| 10 | postgres:10 | amd64, arm64 | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements |
| 11 | postgres:11 | amd64, arm64 | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, amcheck, pageinspect |
| 12 | postgres:12 | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, pg_partman*, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements |
| 13 | postgres:13 | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3, pgrouting, pg_partman, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, address_standardizer |
| 14 | postgres:14 | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3, pgrouting, pg_partman, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, pg_surgery, address_standardizer |
| 15 | postgres:15 | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, pg_surgery, pg_walinspect |
| 16 | postgres:16 | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3, pgrouting, pg_partman, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, pg_surgery, pg_walinspect, address_standardizer |
| 17 | postgres:17 | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3, pgrouting, pg_partman, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, pg_surgery, pg_walinspect, address_standardizer |
| 18 | postgres:18 (latest) | amd64, arm64, ppc64le | pg_repack, pg_cron, pglogical, pgaudit, orafce, pgtap, hypopg, pgvector, postgis-3, pgrouting, pg_partman, pg_logicalinspect, hstore, intarray, ltree, pg_trgm, pgcrypto, uuid-ossp, tablefunc, bloom, btree_gin, btree_gist, citext, cube, fuzzystrmatch, pg_stat_statements, pg_surgery, pg_walinspect, address_standardizer |

### 扩展详细矩阵

| 扩展 | PG9 | PG10 | PG11 | PG12 | PG13 | PG14 | PG15 | PG16 | PG17 | PG18 |
|------|-----|------|------|------|------|------|------|------|------|------|
| **postgis** | 2.3.1 | ✗ | ✗ | ✗ | 3.6.3 | 3.6.3 | ✗ | 3.6.3 | 3.6.3 | 3.6.3 |
| **postgis_raster** | ✗ | ✗ | ✗ | ✗ | 3.6.3 | 3.6.3 | ✗ | 3.6.3 | 3.6.3 | 3.6.3 |
| **postgis_sfcgal** | 2.3.1 | ✗ | ✗ | ✗ | 3.6.3 | 3.6.3 | ✗ | 3.6.3 | 3.6.3 | 3.6.3 |
| **postgis_topology** | 2.3.1 | ✗ | ✗ | ✗ | 3.6.3 | 3.6.3 | ✗ | 3.6.3 | 3.6.3 | 3.6.3 |
| **postgis_tiger_geocoder** | 2.3.1 | ✗ | ✗ | ✗ | 3.6.3 | 3.6.3 | ✗ | 3.6.3 | 3.6.3 | 3.6.3 |
| **pgrouting** | 2.3.2 | ✗ | ✗ | ✗ | 4.0.1 | 4.0.1 | ✗ | 4.0.1 | 4.0.1 | 4.0.1 |
| **vector** | ✗ | ✗ | ✗ | 0.7.4 | ✗ | ✗ | 0.8.2 | ✗ | ✗ | ✗ |
| **pg_partman** | ✗ | ✗ | ✗ | ✗ | 4.7.4 | 5.4.3 | ✗ | 5.4.3 | 5.4.3 | 5.4.3 |
| **pg_cron** | ✗ | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 |
| **pg_repack** | 1.3.4 | 1.5.3 | 1.5.3 | 1.5.3 | 1.5.3 | 1.5.3 | 1.5.3 | 1.5.3 | 1.5.3 | 1.5.3 |
| **pglogical** | ✗ | 2.4.6 | 2.4.6 | 2.4.6 | 2.4.6 | 2.4.6 | 2.4.6 | 2.4.6 | 2.4.6 | 2.4.6 |
| **pgaudit** | ✗ | 1.2.4 | 1.3.4 | 1.4.3 | 1.5.3 | 1.6.3 | 1.7.1 | 16.1 | 17.1 | 18.0 |
| **orafce** | 3.3 | 3.25 | 4.16 | 4.16 | 4.16 | 4.16 | 4.16 | 4.16 | 4.16 | 4.16 |
| **pgtap** | 0.97.0 | 1.3.4 | 1.3.4 | 1.3.4 | 1.3.4 | 1.3.4 | 1.3.4 | 1.3.4 | 1.3.4 | 1.3.4 |
| **hypopg** | ✗ | 1.4.2 | 1.4.2 | 1.4.2 | 1.4.2 | 1.4.2 | 1.4.2 | 1.4.2 | 1.4.2 | 1.4.2 |
| **address_standardizer** | 2.3.1 | ✗ | ✗ | ✗ | 3.6.3 | 3.6.3 | ✗ | 3.6.3 | 3.6.3 | 3.6.3 |
| **pg_surgery** | ✗ | ✗ | ✗ | ✗ | ✗ | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 |
| **pg_walinspect** | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | 1.0 | 1.1 | 1.1 | 1.1 |
| **pg_logicalinspect** | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | 1.0 |
| **hstore** | 1.4 | 1.4 | 1.5 | 1.6 | 1.7 | 1.8 | 1.8 | 1.8 | 1.8 | 1.8 |
| **intarray** | 1.2 | 1.2 | 1.2 | 1.2 | 1.3 | 1.5 | 1.5 | 1.5 | 1.5 | 1.5 |
| **ltree** | 1.1 | 1.1 | 1.1 | 1.1 | 1.2 | 1.2 | 1.2 | 1.2 | 1.3 | 1.3 |
| **pg_trgm** | 1.3 | 1.3 | 1.4 | 1.4 | 1.5 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 |
| **pgcrypto** | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.4 |
| **uuid-ossp** | 1.1 | 1.1 | 1.1 | 1.1 | ✗ | ✗ | 1.1 | ✗ | ✗ | ✗ |
| **tablefunc** | 1.0 | 1.0 | 1.0 | 1.0 | ✗ | ✗ | 1.0 | ✗ | ✗ | ✗ |
| **bloom** | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 |
| **btree_gin** | 1.0 | 1.2 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 | 1.3 |
| **btree_gist** | 1.2 | 1.5 | 1.5 | 1.5 | 1.5 | 1.6 | 1.7 | 1.7 | 1.7 | 1.8 |
| **citext** | 1.3 | 1.4 | 1.5 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 | 1.8 |
| **cube** | 1.2 | 1.2 | 1.4 | 1.4 | 1.4 | 1.5 | 1.5 | 1.5 | 1.5 | 1.5 |
| **fuzzystrmatch** | 1.1 | 1.1 | 1.1 | 1.1 | 1.1 | 1.1 | 1.1 | 1.2 | 1.2 | 1.2 |
| **pg_stat_statements** | 1.4 | 1.6 | 1.6 | 1.7 | 1.8 | 1.9 | 1.10 | 1.10 | 1.11 | 1.12 |
| **amcheck** | ✗ | 1.0 | 1.1 | 1.2 | 1.2 | 1.3 | 1.3 | 1.3 | 1.4 | 1.5 |
| **pageinspect** | 1.5 | 1.6 | 1.7 | 1.7 | 1.8 | 1.9 | 1.11 | 1.12 | 1.12 | 1.13 |

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
- **pglogical**: 逻辑复制（PG10+）
- **pgaudit**: 审计日志（PG10+）
- **orafce**: Oracle 兼容函数
- **pgtap**: 数据库测试框架
- **hypopg**: 虚拟索引（PG10+）
- **pgrouting**: 路径规划（PG9, PG12+）
- **pg_partman**: 分区管理（PG12+）
- **address_standardizer**: 地址标准化（PG12+）
- **pg_surgery**: 损坏数据修复（PG14+）
- **pg_walinspect**: WAL 日志检查（PG15+）
- **pg_logicalinspect**: 逻辑复制检查（PG18+）
- **hstore**: 键值存储
- **intarray**: 整数数组操作
- **ltree**: 层次结构数据
- **pg_trgm**: 模糊文本匹配
- **pgcrypto**: 加密函数
- **uuid-ossp**: UUID 生成
- **tablefunc**: 表函数（crosstab 等）
- **bloom**: 布隆过滤器索引
- **btree_gin / btree_gist**: 复合索引支持
- **citext**: 大小写不敏感文本
- **cube**: 多维立方体数据
- **fuzzystrmatch**: 模糊字符串匹配
- **pg_stat_statements**: SQL 执行统计
- **amcheck**: 索引完整性检查
- **pageinspect**: 页面级检查

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
