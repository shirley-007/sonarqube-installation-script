#!/bin/bash

# Define log file path
logfile="/var/log/sonar-install.log"

# Function to log to both file and terminal with timestamp
log() {
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$timestamp $1" | sudo tee -a "$logfile"
}

# Function to log and exit on error
log_and_exit() {
    log "$1"
    exit 1
}

# Function to run command and log errors
run_command() {
    "$@" || log_and_exit "Error: Failed to execute command: $*"
}

# Changing the Hostname of server to sonar 
run_command log "Setting the hostname to sonar..." && sudo hostnamectl set-hostname sonar

# Update and Upgrade the Ubuntu EC2
run_command log "Updating packages..." && sudo apt update -y
run_command log "Upgrading packages..." && sudo apt upgrade -y

# Configure ElasticSearch
log "Configuring ElasticSearch..."
run_command sudo sh -c 'echo "vm.max_map_count=262144" >> /etc/sysctl.conf'
run_command sudo sh -c 'echo "fs.file-max=65536" >> /etc/sysctl.conf'
run_command sudo sh -c 'echo "ulimit -n 65536" >> /etc/sysctl.conf'
run_command sudo sh -c 'echo "ulimit -u 4096" >> /etc/sysctl.conf'

log "First part of SonarQube installation done."