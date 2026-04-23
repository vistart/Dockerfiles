# syntax=docker/dockerfile:1
FROM registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:11

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Use archived Debian repos for EOL Stretch base image
RUN rm -f /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources && \
    echo 'deb http://archive.debian.org/debian stretch main' > /etc/apt/sources.list && \
    echo 'deb http://archive.debian.org/debian-security stretch/updates main' >> /etc/apt/sources.list

# Add PostgreSQL PGDG repository
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-11-postgis-3 \
        postgresql-11-postgis-3-scripts \
        postgresql-11-repack \
        postgresql-11-cron \
        postgresql-11-wal2json \
        postgresql-11-pglogical \
        postgresql-11-pgaudit \
        postgresql-11-orafce \
        postgresql-11-pgrouting \
        postgresql-11-pgtap \
        postgresql-11-hypopg \
        postgresql-11-partman \
        postgresql-11-pgvector \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain,pgaudit'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF
