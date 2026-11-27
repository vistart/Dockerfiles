# postgres-exts-ts — TimescaleDB derivatives (linux/amd64 only)

These images are thin, amd64-only derivatives of the existing multi-arch
`vistart/postgres-exts:<N>` images. They add TimescaleDB on top of the full
extension set of the base image; the original `postgres-exts-N` definitions and
tags are untouched.

## Version matrix

| PostgreSQL | Package | Architecture | Tags |
|------------|---------|--------------|------|
| 15 | `timescaledb-2-postgresql-15` | linux/amd64 | `vistart/postgres-exts-ts:15`, `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts-ts:15` |
| 16 | `timescaledb-2-postgresql-16` | linux/amd64 | `vistart/postgres-exts-ts:16`, `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts-ts:16` |
| 17 | `timescaledb-2-postgresql-17` | linux/amd64 | `vistart/postgres-exts-ts:17`, `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts-ts:17` |
| 18 | `timescaledb-2-postgresql-18` | linux/amd64 | `vistart/postgres-exts-ts:18`, `registry.cn-shanghai.aliyuncs.com/vistart_public/postgres-exts-ts:18` |

PG19 is not packaged by TimescaleDB yet, and PG14 and earlier are no longer
supported, so those versions are intentionally not built. Upstream also ships
arm64 packages, but this image family is deliberately limited to `linux/amd64`.

## Build layout

The Docker build context is this directory (not the per-version subdirectory),
so all versions share `timescaledb.gpg` and `configure-timescaledb.sh`:

```bash
docker build --platform linux/amd64 -f 18/Dockerfile -t vistart/postgres-exts-ts:18 .
```

`configure-timescaledb.sh` appends `timescaledb` to the value of
`shared_preload_libraries` read from the config file inherited from the base
image (typically `pg_stat_statements,pg_cron,auto_explain,pgaudit`). It never
hard-codes or discards the existing libraries, and it skips the change when the
TimescaleDB library is absent (e.g. when the best-effort install failed).

## Verify

```bash
docker run --rm vistart/postgres-exts-ts:18 \
  sh -c 'grep shared_preload_libraries /usr/share/postgresql/postgresql.conf.sample'
docker run --rm vistart/postgres-exts-ts:18 \
  sh -c 'ls /usr/lib/postgresql/*/lib/timescaledb*.so'

docker run -d --name postgres18-ts -e POSTGRES_PASSWORD=secret vistart/postgres-exts-ts:18
docker exec postgres18-ts psql -U postgres -d postgres -c "CREATE EXTENSION IF NOT EXISTS timescaledb;"
```

CI jobs `build-ts-15` … `build-ts-18` in `.github/workflows/postgres.yml` build
and push these images on every push to `postgres`; they use the separate
reusable workflow `.github/workflows/.postgres-timescaledb-build.yml`.
