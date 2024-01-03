#!/bin/bash

# Exit on error
set -e

output_file="out.dat"
snapshot_dir="/home/.snapshots"
# 132
snapshot_num="$1"
working_dir="/home/@buffer"

if [ -z "$1" ]; then

    echo "...snapshot number not specified, terminating!"
    exit 1

fi

cd "$working_dir"

sudo btrfs send --verbose -f "./${output_file}" "${snapshot_dir}/${snapshot_num}/snapshot"
