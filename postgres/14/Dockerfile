# syntax=docker/dockerfile:1
FROM postgres:14

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Add PostgreSQL PGDG repository
COPY postgresql.gpg /usr/share/keyrings/postgresql.gpg
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https ca-certificates curl gnupg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt trixie-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install PGDG-only extensions (no external library dependencies)
# Note: TimescaleDB no longer supports PG14 (minimum PG15)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-14-repack \
        postgresql-14-cron \
        postgresql-14-wal2json \
        postgresql-14-pgaudit \
        postgresql-14-orafce \
        postgresql-14-pgtap \
        postgresql-14-hypopg \
        postgresql-14-pglogical \
        postgresql-14-pgvector \
        postgresql-14-pg-hint-plan \
    && rm -rf /var/lib/apt/lists/*

# Install extensions with Debian library dependencies (may fail in restricted networks)
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-14-postgis-3 \
        postgresql-14-postgis-3-scripts \
        postgresql-14-pgrouting \
        postgresql-14-partman \
    || echo "Warning: Some Debian-dependent packages skipped (PostGIS, pgrouting, partman)" \
    && rm -rf /var/lib/apt/lists/*

# Add Groonga repository for PGroonga full text search.
COPY groonga-archive-keyring.asc /usr/share/keyrings/groonga-archive-keyring.asc
RUN echo "deb [signed-by=/usr/share/keyrings/groonga-archive-keyring.asc] https://packages.groonga.org/debian trixie main" \
      > /etc/apt/sources.list.d/groonga.list

# Install PGroonga. Kept isolated and best-effort: the Groonga repo
# ships pgdg packages only for amd64/arm64 and for released PG majors,
# so ppc64le and newly released majors must not break other groups.
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-14-pgdg-pgroonga \
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
