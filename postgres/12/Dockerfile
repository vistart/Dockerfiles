# syntax=docker/dockerfile:1
FROM postgres:12.22-bookworm

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update || true

RUN apt-get install -y --no-install-recommends \
      postgresql-12-postgis-3 \
      postgresql-12-repack \
      postgresql-12-cron \
      postgresql-12-wal2json \
      postgresql-12-pglogical \
      timescaledb-2-postgresql-12 \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF