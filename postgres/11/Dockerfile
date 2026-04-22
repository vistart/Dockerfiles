# syntax=docker/dockerfile:1
FROM postgres:11

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update || true

RUN apt-get install -y --no-install-recommends \
      postgresql-11-postgis-3 \
      postgresql-11-repack \
      postgresql-11-cron \
      postgresql-11-wal2json \
      postgresql-11-pglogical \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF