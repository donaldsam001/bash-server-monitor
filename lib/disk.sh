#!/bin/bash

get_disk_usage() {
    df / | awk 'NR==2 {
        gsub("%", "", $5)
        print $5
    }'
}