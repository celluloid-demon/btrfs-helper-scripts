#!/bin/bash

# Exit on error
set -e

child_snapshot_num="137"
output_file="out.diff"
parent_snapshot_num="132"
snapshot_dir="/home/.snapshots"
working_dir="/home/@buffer"

cd "$working_dir"

sudo btrfs send --verbose -p "${snapshot_dir}/${parent_snapshot_num}/snapshot" -f "./${output_file}" "${snapshot_dir}/${child_snapshot_num}/snapshot"
