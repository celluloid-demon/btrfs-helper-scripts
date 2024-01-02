#!/bin/bash

# Exit on error
set -e

# input_file="out.dat.gz"
input_file="out.diff"
part_size="256M"
working_dir="/home/@buffer"

prefix="${input_file}."

cd "$working_dir"

sudo split --bytes="$part_size" --numeric-suffixes --suffix-length=4 --additional-suffix=.part "./${input_file}" "$prefix"

# sudo rm "./${input_file}"
