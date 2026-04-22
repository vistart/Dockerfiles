# syntax=docker/dockerfile:1
FROM postgres:15

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        postgresql-server-dev-15 \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    curl -fsSL https://packagecloud.io/timescale/timescaledb/gpgkey \
      | gpg --dearmor -o /usr/share/keyrings/timescaledb.gpg; \
    echo "deb [signed-by=/usr/share/keyrings/timescaledb.gpg] \
      https://packagecloud.io/timescale/timescaledb/debian/ \
      bookworm main" \
      > /etc/apt/sources.list.d/timescaledb.list

RUN apt-get update && apt-get install -y --no-install-recommends \
      postgresql-15-postgis-3 \
      postgresql-15-postgis-3-scripts \
      postgresql-15-repack \
      postgresql-15-cron \
      postgresql-15-wal2json \
      postgresql-15-pgaudit \
      postgresql-15-orafce \
      postgresql-15-pgrouting \
      postgresql-15-hypopg \
      postgresql-15-partman \
      postgresql-15-pg-stat-kcache \
      postgresql-15-pg-qualstats \
      postgresql-15-decoder-raw \
      postgresql-15-pglogical \
      postgresql-15-pgvector \
      timescaledb-2-postgresql-15 \
    || echo "Some packages not available, skipping"

RUN apt-get purge -y build-essential postgresql-server-dev-15 \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain,pgaudit'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF