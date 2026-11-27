# syntax=docker/dockerfile:1
# amd64-only TimescaleDB derivative of the multi-arch postgres-exts:18 image.
# The base already provides the full extension set; this layer only adds
# TimescaleDB and enables its preload library.
FROM vistart/postgres-exts:18

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# TimescaleDB is published on packagecloud as PGDG-linked Debian packages.
COPY timescaledb.gpg /usr/share/keyrings/timescaledb.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/timescaledb.gpg] https://packagecloud.io/timescale/timescaledb/debian/ trixie main" \
      > /etc/apt/sources.list.d/timescaledb.list

# Keep the installation isolated and best-effort: a missing/incompatible
# upstream package must only warn and leave the plain postgres-exts behavior.
RUN set +e; \
    apt-get update && apt-get install -y --no-install-recommends \
        timescaledb-2-postgresql-18; \
    install_status=$?; \
    rm -rf /var/lib/apt/lists/*; \
    if [ "$install_status" -ne 0 ]; then \
      echo "Warning: TimescaleDB skipped for PG18 amd64"; \
    fi

# Append timescaledb to the libraries already configured by postgres-exts.
COPY configure-timescaledb.sh /usr/local/bin/configure-timescaledb.sh
RUN chmod 0755 /usr/local/bin/configure-timescaledb.sh \
    && /usr/local/bin/configure-timescaledb.sh
