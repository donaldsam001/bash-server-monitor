#!/bin/bash

set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$BASE_DIR/config/monitor.conf"
source "$BASE_DIR/lib/cpu.sh"
source "$BASE_DIR/lib/memory.sh"
source "$BASE_DIR/lib/disk.sh"
source "$BASE_DIR/lib/process.sh"
source "$BASE_DIR/lib/logger.sh"

CPU=$(get_cpu_usage)
MEMORY=$(get_memory_usage)
DISK=$(get_disk_usage)

echo "===================================="
echo "       Linux Server Monitor"
echo "===================================="

echo
echo "Hostname : $(hostname)"
echo "Uptime   : $(uptime -p)"

echo
echo "CPU      : $CPU%"
echo "Memory   : $MEMORY%"
echo "Disk     : $DISK%"

echo
echo "Top Processes:"
echo "------------------------------------"

get_top_processes

echo
echo "System Status:"
echo "------------------------------------"

STATUS="HEALTHY"

if (( ${CPU%.*} > CPU_THRESHOLD )); then
    log_warning "CPU usage: $CPU%"
    STATUS="WARNING"
fi

if (( MEMORY > MEMORY_THRESHOLD )); then
    log_warning "Memory usage: $MEMORY%"
    STATUS="WARNING"
fi

if (( DISK > DISK_THRESHOLD )); then
    log_warning "Disk usage: $DISK%"
    STATUS="WARNING"
fi

echo
echo "Status: $STATUS"
echo "===================================="