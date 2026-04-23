# syntax=docker/dockerfile:1
FROM registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:14

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL PGDG repository
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt trixie-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install PGDG-only extensions (no external library dependencies)
# Note: TimescaleDB no longer supports PG14 (minimum PG15)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-14-repack \
        postgresql-14-cron \
        postgresql-14-wal2json \
        postgresql-14-pgaudit \
        postgresql-14-orafce \
        postgresql-14-pgtap \
        postgresql-14-hypopg \
        postgresql-14-pglogical \
        postgresql-14-pgvector \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-14-postgis-3 \
        postgresql-14-postgis-3-scripts \
        postgresql-14-pgrouting \
        postgresql-14-partman \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman)" \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample
