# syntax=docker/dockerfile:1
FROM postgres:12.22-bookworm

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    curl -fsSL https://packagecloud.io/timescale/timescaledb/gpgkey \
      | gpg --dearmor -o /usr/share/keyrings/timescaledb.gpg; \
    echo "deb [signed-by=/usr/share/keyrings/timescaledb.gpg] https://packagecloud.io/timescale/timescaledb/debian/ bookworm main" \
      > /etc/apt/sources.list.d/timescaledb.list

RUN apt-get update && apt-get install -y --no-install-recommends \
      postgresql-12-postgis-3 \
      postgresql-12-postgis-3-scripts \
      postgresql-12-repack \
      postgresql-12-cron \
      postgresql-12-wal2json \
      postgresql-12-pglogical \
      timescaledb-2-postgresql-12

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF