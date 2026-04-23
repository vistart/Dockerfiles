FROM registry.cn-shanghai.aliyuncs.com/vistart_public/postgres:9

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Use archived Debian repos for EOL Stretch
RUN rm -f /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources && \
    echo 'deb http://archive.debian.org/debian stretch main' > /etc/apt/sources.list && \
    echo 'deb http://archive.debian.org/debian-security stretch/updates main' >> /etc/apt/sources.list

# Install PostGIS and repack extension
# Note: postgresql-9.6-cron is not available for Debian Stretch (pg_cron requires PostgreSQL 10+)
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-9.6-postgis-2.3 \
    postgresql-9.6-postgis-2.3-scripts \
    postgresql-9.6-repack

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,auto_explain'
pg_stat_statements.track = all
EOF
