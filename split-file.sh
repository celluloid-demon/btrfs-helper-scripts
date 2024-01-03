#!/bin/bash

# Exit on error
set -e

# input_file="out.dat.gz"
input_file="out.diff"
part_size="256M"
working_dir="/home/@buffer"

prefix="${input_file}."

cd "$working_dir"

byte_count=$(wc -c < ./${input_file})

# sudo split --bytes="$part_size" --numeric-suffixes --suffix-length=4 --additional-suffix=.part "./${input_file}" "$prefix"

# Force super user authentication before command-proper
sudo echo

pv --size $byte_count "./${input_file}" | sudo split --bytes="$part_size" --numeric-suffixes --suffix-length=4 --additional-suffix=.part - "$prefix"

# sudo rm "./${input_file}"
