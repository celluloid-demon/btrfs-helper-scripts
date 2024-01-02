#!/bin/bash

# Exit on error
set -e

snapshot_dir="/mnt/@ds0/snapshots/lenovo-legion/@home/snapshots"
snapshot_num="1"
subvol_file="out.dat"
working_dir="/mnt/@ds0/@buffer"

cd "$working_dir"

sudo cat "./${subvol_file}" | sudo btrfs receive "${snapshot_dir}/${snapshot_num}"
