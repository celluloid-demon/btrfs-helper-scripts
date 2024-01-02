#!/bin/bash

# Exit on error
set -e

output_file="out.dat"
snapshot_dir="/home/.snapshots"
snapshot_num="132"
working_dir="/home/@buffer"

cd "$working_dir"

sudo btrfs send --verbose -f "./${output_file}" "${snapshot_dir}/${snapshot_num}/snapshot"
