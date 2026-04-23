# syntax=docker/dockerfile:1
FROM postgres:12

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL PGDG repository
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Add TimescaleDB repository
COPY timescaledb.gpg /usr/share/keyrings/timescaledb.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/timescaledb.gpg] https://packagecloud.io/timescale/timescaledb/debian/ bookworm main" \
      > /etc/apt/sources.list.d/timescaledb.list

# Install PGDG-only extensions (no external library dependencies)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-12-repack \
        postgresql-12-cron \
        postgresql-12-wal2json \
        postgresql-12-pglogical \
        postgresql-12-pgaudit \
        postgresql-12-orafce \
        postgresql-12-pgtap \
        postgresql-12-hypopg \
        postgresql-12-pgvector \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-12-postgis-3 \
        postgresql-12-postgis-3-scripts \
        postgresql-12-pgrouting \
        postgresql-12-partman \
        timescaledb-2-postgresql-12 \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman, timescaledb)" \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample
