# syntax=docker/dockerfile:1
FROM postgres:9.6.24-bullseye

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
      postgresql-9.6-postgis-2.5 \
      postgresql-9.6-postgis-2.5-scripts \
      postgresql-9.6-repack \
      postgresql-9.6-cron \
      postgresql-9.6-wal2json \
      postgresql-9.6-pgaudit \
      postgresql-9.6-orafce \
      postgresql-9.6-pgrouting \
      postgresql-9.6-hypopg \
      postgresql-9.6-partman \
      postgresql-9.6-pglogical \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/9.6/main/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain,pgaudit'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF