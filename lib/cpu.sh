#!/bin/bash

get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print $2}'
}