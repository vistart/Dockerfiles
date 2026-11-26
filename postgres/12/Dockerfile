# syntax=docker/dockerfile:1
FROM postgres:12

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL PGDG repository
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Note: the TimescaleDB repository is intentionally omitted for PG12.
# The packagecloud bookworm dist currently breaks apt-get update in CI
# ("Cannot allocate memory" while reading InRelease), and upstream no
# longer provides a working timescaledb package chain for PG12.
# Same approach as PG13/PG14.

# Install PGDG-only extensions (no external library dependencies)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-12-repack \
        postgresql-12-cron \
        postgresql-12-wal2json \
        postgresql-12-pglogical \
        postgresql-12-pgaudit \
        postgresql-12-orafce \
        postgresql-12-pgtap \
        postgresql-12-hypopg \
        postgresql-12-pgvector \
        postgresql-12-pg-hint-plan \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-12-postgis-3 \
        postgresql-12-postgis-3-scripts \
        postgresql-12-pgrouting \
        postgresql-12-partman \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman)" \
    && rm -rf /var/lib/apt/lists/*

# Add Groonga repository for PGroonga full text search.
COPY groonga-archive-keyring.asc /usr/share/keyrings/groonga-archive-keyring.asc
RUN echo "deb [signed-by=/usr/share/keyrings/groonga-archive-keyring.asc] https://packages.groonga.org/debian bookworm main" \
      > /etc/apt/sources.list.d/groonga.list

# Install PGroonga. Kept isolated and best-effort: the Groonga repo
# ships pgdg packages only for amd64/arm64 and for released PG majors,
# so ppc64le and newly released majors must not break other groups.
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-12-pgdg-pgroonga \
    || echo "Warning: PGroonga skipped for this version/architecture" \
    && rm -rf /var/lib/apt/lists/*

# Optional Groonga tokenizer / token filter plugins (TokenMecab,
# TokenFilterStem). Their failure never costs the PGroonga install.
RUN apt-get update && apt-get install -y --no-install-recommends \
        groonga-tokenizer-mecab \
        groonga-token-filter-stem \
    || echo "Warning: Optional Groonga plugins skipped" \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nshared_preload_libraries = '\''pg_stat_statements,pg_cron,auto_explain,pgaudit'\''\npg_stat_statements.track = all\npg_cron.database = '\''postgres'\''\n' >> /usr/share/postgresql/postgresql.conf.sample
