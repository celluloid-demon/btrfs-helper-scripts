#!/bin/bash

output_file="out.dat"
working_dir="/home/@buffer"

cd "$working_dir"

gzip --verbose "$output_file"
