#!/bin/bash

# Exit on error
set -e

snapshot_dir="/mnt/@ds0/snapshots/lenovo-legion/@home/snapshots"
# snapshot_num="1"
snapshot_num="$1"
# subvol_file="out.dat"
subvol_file="out.diff"
working_dir="/mnt/@ds0/@buffer"

if [ -z "$1" ]; then

    echo "...snapshot number not specified, terminating!"
    exit 1

fi

cd "$working_dir"

byte_count=$(wc -c < ./${subvol_file})

sudo mkdir -p "${snapshot_dir}/${snapshot_num}"

# sudo cat "./${subvol_file}" | sudo btrfs receive "${snapshot_dir}/${snapshot_num}"

# Force super user authentication before command-proper
sudo echo

pv --size $byte_count "./${subvol_file}" | cat - | sudo btrfs receive "${snapshot_dir}/${snapshot_num}"
