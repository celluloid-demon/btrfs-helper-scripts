#!/bin/bash

# Exit on error
set -e

backup_dir="/mnt/@ds0/@buffer"
host="raspberry-pi"
source_dir="/home/@buffer"
user="jonathan"

# (source_dir trailing slash IS significant)
rsync -av "${source_dir}/" "${user}@${host}:${backup_dir}/"