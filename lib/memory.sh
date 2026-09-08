#!/bin/bash

get_memory_usage() {
    free | awk '/Mem:/ {
        printf "%.0f", $3/$2 * 100
    }'
}