# syntax=docker/dockerfile:1
FROM postgres:10.23-bullseye

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update || true

RUN apt-get install -y --no-install-recommends \
      postgresql-10-postgis-2.5 \
      postgresql-10-repack \
      postgresql-10-cron \
      postgresql-10-wal2json \
      postgresql-10-pglogical \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF