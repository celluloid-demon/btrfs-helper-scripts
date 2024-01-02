#!/bin/bash

# Exit on error
set -e

input_file="out.dat.gz"
working_dir="/mnt/@ds0/@buffer"

cd "$working_dir"

gunzip --verbose "$input_file"
