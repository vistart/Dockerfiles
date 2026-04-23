# syntax=docker/dockerfile:1
FROM postgres:11

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Use archived Debian repos for EOL Stretch base image
# Note: security and updates repos no longer available on archive.debian.org
RUN rm -f /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources && \
    echo 'deb http://archive.debian.org/debian stretch main contrib' > /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Add PostgreSQL PGDG repository
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install extensions from PGDG bullseye repo
# Note: PostGIS, pgrouting, partman, pgvector unavailable due to library incompatibility with Stretch
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-11-repack \
        postgresql-11-cron \
        postgresql-11-wal2json \
        postgresql-11-pglogical \
        postgresql-11-pgaudit \
        postgresql-11-orafce \
        postgresql-11-pgtap \
        postgresql-11-hypopg \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample
