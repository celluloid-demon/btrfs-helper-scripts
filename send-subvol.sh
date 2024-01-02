#!/bin/bash

output_file="out.dat"
snapshot_dir="/home/.snapshots"
snapshot_num="132"
working_dir="/home/@buffer"

cd "$working_dir"

sudo btrfs send "${snapshot_dir}/${snapshot_num}/snapshot" -f "./${output_file}"
