#!/bin/bash

# Exit on error
set -e

backup_dir="/mnt/@ds0/@buffer"
host="raspberry-pi"
source_dir="/home/@buffer"
user="jonathan"

# (source_dir trailing slash IS significant)
# rsync -av "${source_dir}/" "${user}@${host}:${backup_dir}/"
# rsync --archive --info=progress2 "${source_dir}/" "${user}@${host}:${backup_dir}/"

# You can't use rsync's snazzy delta differences algorithm unless there's an
# rsync server available on the remote host, but you can tell rsync to assume
# the source file hasn't changed and to continue after a break from the byte
# offset it had reached.

rsync --archive --info=progress2 --partial --append "${source_dir}/" "${user}@${host}:${backup_dir}/"

# todo rsync is throwing an error (terminating script early) and preventing this
# cleanup step from running
# sudo rm "${source_dir}/"*
