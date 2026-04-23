#!/bin/bash
# verify_extensions.sh - 验证 PostgreSQL 扩展安装状态
# 用法: DOCKER_HOST=tcp://host:2376 CONTAINER=postgres96 ./verify_extensions.sh

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

echo "=== 验证 PostgreSQL 9.6 扩展 ==="
echo "容器: $CONTAINER"
echo "用户: $POSTGRES_USER"
echo "数据库: $POSTGRES_DB"
echo

# 检查容器是否运行
echo "检查容器状态..."
if ! $DOCKER_CMD inspect "$CONTAINER" > /dev/null 2>&1; then
    echo "错误: 容器 $CONTAINER 未运行或不存在"
    exit 1
fi
echo "容器状态: 运行中"
echo

# 验证扩展安装
echo "=== 检查已安装的扩展 ==="

check_extension() {
    local ext_name="$1"
    local expected_version="$2"

    echo "- 检查 $ext_name..."

    # 检查扩展文件是否存在
    local file_exists
    file_exists=$($DOCKER_CMD exec "$CONTAINER" sh -c "test -f /usr/share/postgresql/9.6/extension/${ext_name}.control && echo 'yes' || echo 'no'" 2>/dev/null || echo "no")

    if [[ "$file_exists" == "yes" ]]; then
        echo "  文件: /usr/share/postgresql/9.6/extension/${ext_name}.control ✓"
    else
        echo "  文件: /usr/share/postgresql/9.6/extension/${ext_name}.control ✗"
        return 1
    fi

    # 检查扩展是否已启用
    local ext_version
    ext_version=$($DOCKER_CMD exec "$CONTAINER" psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -t -c "SELECT extversion FROM pg_extension WHERE extname = '$ext_name';" 2>/dev/null | tr -d ' ' || echo "")

    if [[ -n "$ext_version" ]]; then
        echo "  版本: $ext_version ✓"
        echo "  状态: 已启用 ✓"
    else
        echo "  状态: 未启用 (需要在数据库中执行 CREATE EXTENSION)"
    fi

    echo
}

# 验证 PostGIS
echo "--- PostGIS ---"
check_extension "postgis" "2.3.1"

# 验证 Repack
echo "--- pg_repack ---"
check_extension "pg_repack" "1.3.4"

# 验证共享库配置
echo "=== 检查 postgresql.conf 配置 ==="
echo "- shared_preload_libraries..."

local preload_libs
preload_libs=$($DOCKER_CMD exec "$CONTAINER" grep "^shared_preload_libraries" /var/lib/postgresql/data/postgresql.conf 2>/dev/null || echo "")

if [[ -n "$preload_libs" ]]; then
    echo "  $preload_libs ✓"
else
    # 检查 sample 配置
    preload_libs=$($DOCKER_CMD exec "$CONTAINER" grep "^shared_preload_libraries" /usr/share/postgresql/postgresql.conf.sample 2>/dev/null || echo "")
    if [[ -n "$preload_libs" ]]; then
        echo "  (sample) $preload_libs ✓"
    else
        echo "  未找到配置 ✗"
    fi
fi

echo
echo "=== 验证完成 ==="
