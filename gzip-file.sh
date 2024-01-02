#!/bin/bash

# Exit on error
set -e

# input_file="out.dat"
input_file="out.diff"
working_dir="/home/@buffer"

cd "$working_dir"

sudo gzip --verbose "$input_file"

# (gzip removes source file by default)
