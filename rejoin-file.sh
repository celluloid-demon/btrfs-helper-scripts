#!/bin/bash

# Exit on error
set -e

# input_basename="out.dat.gz"
input_basename="out.diff"
working_dir="/mnt/@ds0/@buffer"

cd "$working_dir"

sudo cat ${input_basename}.* > ./${input_basename}

# sudo rm ${input_basename}.*
