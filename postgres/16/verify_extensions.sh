#!/bin/bash
# verify_extensions.sh - 验证 PostgreSQL 扩展安装状态
# 用法: DOCKER_HOST=tcp://host:2376 CONTAINER=postgres16 ./verify_extensions.sh

set -euo pipefail

CONTAINER="${CONTAINER:?请设置 CONTAINER 环境变量}"
POSTGRES_USER="${POSTGRES_USER:-root}"
POSTGRES_DB="${POSTGRES_DB:-postgres}"

# Docker 连接参数
DOCKER_HOST="${DOCKER_HOST:-}"
DOCKER_TLS_VERIFY="${DOCKER_TLS_VERIFY:-}"
DOCKER_CERT_PATH="${DOCKER_CERT_PATH:-}"

# 构建 docker 命令
DOCKER_CMD="docker"
if [[ -n "$DOCKER_HOST" ]]; then
    DOCKER_CMD="$DOCKER_CMD -H $DOCKER_HOST"
fi
if [[ -n "$DOCKER_TLS_VERIFY" ]]; then
    DOCKER_CMD="$DOCKER_CMD --tlsverify"
fi
if [[ -n "$DOCKER_CERT_PATH" ]]; then
    DOCKER_CMD="$DOCKER_CMD --tlscacert=$DOCKER_CERT_PATH/ca.pem --tlscert=$DOCKER_CERT_PATH/cert.pem --tlskey=$DOCKER_CERT_PATH/key.pem"
fi

echo "=== 验证 PostgreSQL 16 扩展 ==="
echo "容器: $CONTAINER"
echo

# 检查容器是否运行
echo "检查容器状态..."
if ! $DOCKER_CMD inspect "$CONTAINER" > /dev/null 2>&1; then
    echo "错误: 容器 $CONTAINER 未运行或不存在"
    exit 1
fi
echo "容器状态: 运行中"
echo

# 验证扩展文件存在
echo "=== 检查扩展文件 ==="

verify_extension() {
    local ext_name="$1"

    echo "- $ext_name..."
    if $DOCKER_CMD exec "$CONTAINER" test -f "/usr/share/postgresql/16/extension/${ext_name}.control" 2>/dev/null; then
        echo "  ✓ $ext_name 已安装"
        if $DOCKER_CMD exec "$CONTAINER" psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE EXTENSION IF NOT EXISTS ${ext_name};" > /dev/null 2>&1; then
            echo "  ✓ 可通过 CREATE EXTENSION 启用"
        else
            echo "  ! 无法创建扩展 (数据库未就绪)"
        fi
    else
        echo "  ✗ $ext_name 未安装"
    fi
    echo
}

# 检查所有扩展
verify_extension "postgis"
verify_extension "postgis_tiger_geocoder"
verify_extension "postgis_topology"
verify_extension "pg_repack"
verify_extension "pg_cron"
verify_extension "wal2json"
verify_extension "pgaudit"
verify_extension "orafce"
verify_extension "pgrouting"
verify_extension "pgtap"
verify_extension "hypopg"
verify_extension "pg_partman"
verify_extension "pglogical"
verify_extension "vector"
verify_extension "hint_plan"
verify_extension "timescaledb"

echo "=== 验证完成 ==="
