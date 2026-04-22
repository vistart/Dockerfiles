# syntax=docker/dockerfile:1
FROM postgres:9.6.6

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL APT repository
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    gnupg \
    lsb-release \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && apt-get update

# Install build dependencies for PostGIS
RUN apt-get install -y --no-install-recommends \
    build-essential \
    binutils \
    libgeos-dev \
    libproj-dev \
    libxml2-dev \
    libjson-c-dev \
    libprotobuf-c-dev \
    protobuf-c-compiler \
    libgdal-dev \
    postgresql-server-dev-9.6 \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev

# Download and build PostGIS 2.5.5 with extension support
RUN cd /tmp && \
    wget https://download.osgeo.org/postgis/source/postgis-2.5.5.tar.gz && \
    tar xzf postgis-2.5.5.tar.gz && \
    cd postgis-2.5.5 && \
    ./configure --without-raster --without-topology --without-gui && \
    make -j$(nproc) && \
    make install && \
    ldconfig && \
    cd / && rm -rf /tmp/postgis-2.5.5*

# Create proper extension files for PostgreSQL 9.6
RUN mkdir -p /usr/share/postgresql/9.6/extension && \
    cp -r /usr/share/postgresql/9.6/contrib/postgis-2.5/*.sql /usr/share/postgresql/9.6/extension/ 2>/dev/null || true && \
    cp -r /usr/share/postgresql/9.6/contrib/postgis-2.5/*.pl /usr/share/postgresql/9.6/extension/ 2>/dev/null || true && \
    cd /usr/share/postgresql/9.6/extension && \
    for f in postgis*.sql uninstall_postgis.sql; do \
        if [ -f "$f" ]; then \
            cp "$f" "${f%.sql}--2.5.5.sql"; \
        fi \
    done

# Create postgis.control file
RUN cat > /usr/share/postgresql/9.6/extension/postgis.control <<'EOF'
# postgis extension
default_version = '2.5.5'
comment = 'POSTGIS spatial type and functions'
module_pathname = '$libdir/postgis-2.5'
superuser = false
relocatable = false
EOF

# Create postgis_core extension
RUN cat > /usr/share/postgresql/9.6/extension/postgis_core.control <<'EOF'
# postgis_core extension
default_version = '2.5.5'
comment = 'Core PostGIS module'
module_pathname = '$libdir/postgis-2.5'
relocatable = false
EOF

# Create postgis_topology extension
RUN cat > /usr/share/postgresql/9.6/extension/postgis_topology.control <<'EOF'
# postgis_topology extension
default_version = '2.5.5'
comment = 'PostGIS Topology package'
module_pathname = '$libdir/postgis-2.5'
relocatable = false
requires = 'postgis'
EOF

# Install other extensions
RUN apt-get install -y --no-install-recommends \
    postgresql-9.6-repack \
    postgresql-9.6-cron \
    postgresql-9.6-wal2json \
    postgresql-9.6-pglogical

RUN rm -rf /var/lib/apt/lists/*

RUN cat >> /usr/share/postgresql/postgresql.conf.sample <<'EOF'

shared_preload_libraries = 'pg_stat_statements,pg_cron,auto_explain'
pg_stat_statements.track = all
pg_cron.database = 'postgres'
EOF