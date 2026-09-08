#!/bin/bash

LOG_FILE="${LOG_FILE:-./logs/monitor.log}"

write_log() {
    local LEVEL="$1"
    local MESSAGE="$2"

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$LEVEL] $MESSAGE" >> "$LOG_FILE"
}

log_info() {
    echo "[INFO] $1"
    write_log "INFO" "$1"
}

log_warning() {
    echo "[WARNING] $1"
    write_log "WARNING" "$1"
}

log_error() {
    echo "[ERROR] $1"
    write_log "ERROR" "$1"
}