#!/bin/bash

# Function to display CPU usage
cpu_usage() {
    echo "CPU Usage:"
    mpstat | grep "all" | awk '{printf "  User: %.2f%%  System: %.2f%%  Idle: %.2f%%\n", 100-$12, $5, $12}'
    echo ""
}

# Function to display memory usage
memory_usage() {
    echo "Memory Usage:"
    free -h | awk 'NR==2{printf "  Total: %s  Used: %s  Free: %s  Usage: %.2f%%\n", $2, $3, $4, ($3/$2)*100}'
    echo ""
}

# Function to display disk usage
disk_usage() {
    echo "Disk Usage:"
    df -h | grep '^/dev/' | awk '{printf "  %s  Total: %s  Used: %s  Available: %s  Usage: %s\n", $1, $2, $3, $4, $5}'
    echo ""
}

# Function to display top 5 processes by CPU usage
top_processes_cpu() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo ""
}

# Function to display top 5 processes by memory usage
top_processes_memory() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo ""
}
