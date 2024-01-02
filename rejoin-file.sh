#!/bin/bash

# Exit on error
set -e

input_basename="out.dat.gz"
working_dir="/mnt/@ds0/@buffer"

cd "$working_dir"

sudo cat ${input_basename}* > ./${input_basename}
