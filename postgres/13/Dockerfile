# syntax=docker/dockerfile:1
FROM postgres:13

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL PGDG repository
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt trixie-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install PGDG-only extensions (no external library dependencies)
# Note: TimescaleDB no longer supports PG13 (minimum PG15)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-13-repack \
        postgresql-13-cron \
        postgresql-13-wal2json \
        postgresql-13-pglogical \
        postgresql-13-pgaudit \
        postgresql-13-orafce \
        postgresql-13-pgtap \
        postgresql-13-hypopg \
        postgresql-13-pgvector \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-13-postgis-3 \
        postgresql-13-postgis-3-scripts \
        postgresql-13-pgrouting \
        postgresql-13-partman \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman)" \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample
