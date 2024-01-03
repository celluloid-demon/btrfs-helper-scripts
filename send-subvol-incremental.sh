#!/bin/bash

# Exit on error
set -e

# 150
child_snapshot_num="$2"
output_file="out.diff"
# 143
parent_snapshot_num="$1"
snapshot_dir="/home/.snapshots"
working_dir="/home/@buffer"

if [ -z "$1" ]; then

    echo "...parent snapshot number not specified, terminating!"
    exit 1

fi

if [ -z "$2" ]; then

    echo "...child snapshot number not specified, terminating!"
    exit 1

fi

cd "$working_dir"

# Exit if previous output_file already exists
if [ -f ./${output_file} ]; then

	echo "$output_file already exists (did you forget to clean a previous job?), terminating."
	exit 1

fi

# sudo btrfs send -p "${snapshot_dir}/${parent_snapshot_num}/snapshot" -f "./${output_file}" "${snapshot_dir}/${child_snapshot_num}/snapshot"

child_byte_count=$(	 sudo btrfs filesystem du --summarize --raw "${snapshot_dir}/${child_snapshot_num}/snapshot"	| awk 'NR==2 {print $1}' )
parent_byte_count=$( sudo btrfs filesystem du --summarize --raw "${snapshot_dir}/${parent_snapshot_num}/snapshot"	| awk 'NR==2 {print $1}' )

(( byte_count_diff = child_byte_count - parent_byte_count ))

# Force super user authentication before command-proper
sudo echo

sudo	btrfs send -p "${snapshot_dir}/${parent_snapshot_num}/snapshot" "${snapshot_dir}/${child_snapshot_num}/snapshot" | \
		pv --size $byte_count_diff \
		> "./${output_file}"
