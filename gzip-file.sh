#!/bin/bash

# Exit on error
set -e

input_file="out.dat"
working_dir="/home/@buffer"

cd "$working_dir"

gzip --verbose "$input_file"
