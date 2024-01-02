#!/bin/bash

# Exit on error
set -e

snapshot_dir="/mnt/@ds0/backups/lenovo-legion/jonathan/@home/snapshots/1/snapshot"
subvol_file="out.dat"
working_dir="/mnt/@ds0/@buffer"

cd "$working_dir"

sudo cat "./${subvol_file}" | sudo btrfs receive "$snapshot_dir"
