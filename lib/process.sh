#!/bin/bash

get_top_processes() {
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
}