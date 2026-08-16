# syntax=docker/dockerfile:1
FROM postgres:19beta3

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL PGDG repository (PG19 beta packages live in the "19" component)
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt trixie-pgdg main 19" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install PGDG-only extensions (no external library dependencies)
# Note: wal2json and TimescaleDB are not yet packaged for PG19
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-19-repack \
        postgresql-19-cron \
        postgresql-19-pgaudit \
        postgresql-19-orafce \
        postgresql-19-pgtap \
        postgresql-19-hypopg \
        postgresql-19-pglogical \
        postgresql-19-pgvector \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-19-postgis-3 \
        postgresql-19-postgis-3-scripts \
        postgresql-19-pgrouting \
        postgresql-19-partman \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman)" \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample