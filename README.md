btrfs-helper-scripts
------

## Setup:

1. Make /home/@buffer subvol, **writable by all** (for writing stream buffer files to) (optionally symlink to subvol from $HOME)
	- Make /mnt/@ds0/@buffer subvol on remote host, **writable by all** (for writing stream buffer files to)
2. Make $HOME/@tmp subvol, writable by $USER (for storing target data to be temporarily "ignored" in bootstrap phase)

## Multi-stage Bootstrap Phase:

```bash

# Example settings.

# CHUNK_SIZE example:

# @home is 300gb in size. Buffer files should not exceed 10gb. The initial full backup will take approximately 30 cycles.

# SPLIT_SIZE exmaple:

# rsync can resume interrupted transfers. A single transfer shouldn't have to backtrack more than 256mb if it was interrupted.

CHUNK_SIZE="10G"
SPLIT_SIZE="256M"

```

1. Reduce target data (**@home**) to chunk size (store all other data in @tmp)
2. Take first full snapshot (**snapper**)
3. Send snapshot to local file on @buffer (-f option): `send-subvol.sh`
4. Gzip buffer file: `gzip-file.sh`
5. Split gzip archive: `split-file.sh`
6. Rsync or physical media transfer of snapshot file to remote site: `rsync-snapshot-files`
7. Remote rejoin gzip part-files
8. Decompress buffer file
9. Remote receive of first snapshot
10. Cleaning logic (remove snapshot files)
11. Repatriate chunk from @tmp to target, another snapshot, repeat (until all chunk data processed)

## Incremental Phase

1. New local snapshot
2. Local generation and send to file of diff between current and last snapshot
3. Rsync to remote site
4. Remote import of transferred snapshot file
5. Cleaning logic (think about retention, remove old snapshots...)
