# syntax=docker/dockerfile:1
FROM postgres:15

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
        postgresql-15-repack \
        postgresql-15-cron \
        postgresql-15-wal2json \
        postgresql-15-pgaudit \
        postgresql-15-orafce \
        postgresql-15-pgtap \
        postgresql-15-hypopg \
        postgresql-15-pglogical \
        postgresql-15-pgvector \
        postgresql-15-hintplan \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-15-postgis-3 \
        postgresql-15-postgis-3-scripts \
        postgresql-15-pgrouting \
        postgresql-15-partman \
        timescaledb-2-postgresql-15 \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman, timescaledb)" \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample
