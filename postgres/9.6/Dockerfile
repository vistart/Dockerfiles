# syntax=docker/dockerfile:1
FROM postgres:9.6.24-bullseye

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update || true

RUN apt-get install -y --no-install-recommends \
      postgresql-9.6-postgis-2.5 \
      postgresql-9.6-repack \
      postgresql-9.6-cron \
      postgresql-9.6-wal2json \
      postgresql-9.6-pglogical \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/9.6/main/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF