# syntax=docker/dockerfile:1
ARG PG_MAJOR=16
FROM postgres:${PG_MAJOR}
ARG PG_MAJOR

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg lsb-release \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql.gpg \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        postgresql-server-dev-${PG_MAJOR} \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    PG_MAJOR_NUM=$(awk -F. '{print $1*100+($2?$2:0)}' <<< "${PG_MAJOR}"); \
    if [ "$PG_MAJOR_NUM" -ge 1200 ]; then \
        curl -fsSL https://packagecloud.io/timescale/timescaledb/gpgkey \
          | gpg --dearmor -o /usr/share/keyrings/timescaledb.gpg; \
        echo "deb [signed-by=/usr/share/keyrings/timescaledb.gpg] \
          https://packagecloud.io/timescale/timescaledb/debian/ \
          $(lsb_release -cs) main" \
          > /etc/apt/sources.list.d/timescaledb.list; \
    fi

RUN set -ex; \
    PG_MAJOR_NUM=$(awk -F. '{print $1*100+($2?$2:0)}' <<< "${PG_MAJOR}"); \
    \
    PKGS="\
      postgresql-${PG_MAJOR}-postgis-3 \
      postgresql-${PG_MAJOR}-postgis-3-scripts \
      postgresql-${PG_MAJOR}-repack \
      postgresql-${PG_MAJOR}-cron \
      postgresql-${PG_MAJOR}-wal2json \
      postgresql-${PG_MAJOR}-pgaudit \
      postgresql-${PG_MAJOR}-orafce \
      postgresql-${PG_MAJOR}-pgrouting \
      postgresql-${PG_MAJOR}-hypopg \
      postgresql-${PG_MAJOR}-partman \
      postgresql-${PG_MAJOR}-pg-stat-kcache \
      postgresql-${PG_MAJOR}-pg-qualstats \
      postgresql-${PG_MAJOR}-decoder-raw \
    "; \
    \
    if [ "$PG_MAJOR_NUM" -ge 1000 ]; then \
        PKGS="$PKGS postgresql-${PG_MAJOR}-pglogical"; \
    fi; \
    \
    if [ "$PG_MAJOR_NUM" -ge 1300 ]; then \
        PKGS="$PKGS postgresql-${PG_MAJOR}-pgvector"; \
    fi; \
    \
    if [ "$PG_MAJOR_NUM" -ge 1200 ]; then \
        PKGS="$PKGS timescaledb-2-postgresql-${PG_MAJOR}"; \
    fi; \
    \
    apt-get update; \
    for pkg in $PKGS; do \
        apt-get install -y --no-install-recommends "$pkg" \
        || echo "WARNING: $pkg not available, skipping"; \
    done; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    PG_MAJOR_NUM=$(awk -F. '{print $1*100+($2?$2:0)}' <<< "${PG_MAJOR}"); \
    if [ "$PG_MAJOR_NUM" -ge 1100 ] && [ "$PG_MAJOR_NUM" -lt 1300 ]; then \
        PGVECTOR_VER=0.7.4; \
        curl -fsSL "https://github.com/pgvector/pgvector/archive/refs/tags/v${PGVECTOR_VER}.tar.gz" \
          | tar -xz -C /tmp; \
        cd /tmp/pgvector-${PGVECTOR_VER}; \
        make PG_CONFIG=/usr/bin/pg_config; \
        make install PG_CONFIG=/usr/bin/pg_config; \
        cd /; rm -rf /tmp/pgvector-*; \
    fi

RUN apt-get purge -y build-essential postgresql-server-dev-${PG_MAJOR} \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain,pgaudit'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF