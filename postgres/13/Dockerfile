# syntax=docker/dockerfile:1
FROM postgres:13

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update || true

RUN apt-get install -y --no-install-recommends \
      postgresql-13-postgis-3 \
      postgresql-13-repack \
      postgresql-13-cron \
      postgresql-13-wal2json \
      postgresql-13-pglogical \
      postgresql-13-pgvector \
      timescaledb-2-postgresql-13 \
    || echo "Some packages not available, skipping"

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF