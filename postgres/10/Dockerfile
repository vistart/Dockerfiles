# syntax=docker/dockerfile:1
FROM postgres:10

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        postgresql-server-dev-10 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
      postgresql-10-postgis-2.5 \
      postgresql-10-postgis-2.5-scripts \
      postgresql-10-repack \
      postgresql-10-cron \
      postgresql-10-wal2json \
      postgresql-10-pgaudit \
      postgresql-10-orafce \
      postgresql-10-pgrouting \
      postgresql-10-hypopg \
      postgresql-10-partman \
      postgresql-10-pg-stat-kcache \
      postgresql-10-pg-qualstats \
      postgresql-10-decoder-raw \
      postgresql-10-pglogical \
    || echo "Some packages not available, skipping"

RUN apt-get purge -y build-essential postgresql-server-dev-10 \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain,pgaudit'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF