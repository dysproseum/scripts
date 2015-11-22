#!/bin/bash

# syncs data with a video symlink to data with a video dir

rsync -av --delete --copy-dirlinks --exclude=video --skip-compress=* /mnt/data/ david@192.168.1.67:/mnt/1
