#!/bin/bash

set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$BASE_DIR/lib/cpu.sh"
source "$BASE_DIR/lib/memory.sh"
source "$BASE_DIR/lib/disk.sh"

echo "Running tests..."

CPU=$(get_cpu_usage)
MEMORY=$(get_memory_usage)
DISK=$(get_disk_usage)

if [[ -z "$CPU" ]]; then
    echo "FAIL: CPU value is empty"
    exit 1
fi

if [[ -z "$MEMORY" ]]; then
    echo "FAIL: Memory value is empty"
    exit 1
fi

if [[ -z "$DISK" ]]; then
    echo "FAIL: Disk value is empty"
    exit 1
fi

echo "PASS: CPU check"
echo "PASS: Memory check"
echo "PASS: Disk check"

echo "All tests passed."