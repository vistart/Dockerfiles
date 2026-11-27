#!/usr/bin/env bash
# Append timescaledb to every shared_preload_libraries setting inherited from
# the base image. The value is read from the config file itself, never
# hard-coded, so the libraries installed by postgres-exts are preserved.
set -euo pipefail

conf="${POSTGRES_CONF_SAMPLE:-/usr/share/postgresql/postgresql.conf.sample}"

shopt -s nullglob
libraries=(/usr/lib/postgresql/*/lib/timescaledb*.so)
if [ "${#libraries[@]}" -eq 0 ]; then
  echo "Warning: TimescaleDB library not found; shared_preload_libraries left unchanged"
  exit 0
fi

patch_conf() {
  local conf="$1"
  [ -f "$conf" ] || return 0

  local current updated
  current="$(sed -nE "s/^[[:space:]]*shared_preload_libraries[[:space:]]*=[[:space:]]*'([^']*)'.*/\1/p" "$conf" | tail -n 1)"

  case ",${current// /}," in
    *,timescaledb,*)
      echo "timescaledb already configured in $conf: $current"
      return 0
      ;;
  esac

  if [ -n "$current" ]; then
    updated="${current},timescaledb"
  else
    updated="timescaledb"
  fi

  awk -v value="$updated" '
    /^[[:space:]]*shared_preload_libraries[[:space:]]*=/ {
      if (!seen) {
        print "shared_preload_libraries = '\''" value "'\''"
        seen = 1
      }
      next
    }
    { print }
    END {
      if (!seen) print "shared_preload_libraries = '\''" value "'\''"
    }
  ' "$conf" > "${conf}.timescaledb.tmp"
  mv "${conf}.timescaledb.tmp" "$conf"
  echo "Updated shared_preload_libraries in $conf: $updated"
}

patch_conf "$conf"
for conf in /usr/share/postgresql/*/postgresql.conf.sample /etc/postgresql/*/main/postgresql.conf; do
  patch_conf "$conf"
done
