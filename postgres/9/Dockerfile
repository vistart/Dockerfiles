# syntax=docker/dockerfile:1
FROM registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:9

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Use archived Debian repos for EOL Stretch
# Note: security and updates repos no longer available on archive.debian.org
RUN rm -f /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources && \
    echo 'deb http://archive.debian.org/debian stretch main contrib' > /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install extensions from archived Debian repos
# Note: pg_cron, pgvector require PostgreSQL 10+ and are not available
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-9.6-postgis-2.3 \
    postgresql-9.6-postgis-2.3-scripts \
    postgresql-9.6-repack \
    postgresql-9.6-pgrouting \
    postgresql-9.6-pgtap \
    postgresql-9.6-orafce

RUN rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,auto_explain'\''\npg_stat_statements.track = all\n' >> /usr/share/postgresql/postgresql.conf.sample
