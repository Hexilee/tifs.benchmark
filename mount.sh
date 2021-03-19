#!/bin/sh

if [ ! -d "$1" ]; then
    echo "$1 is not a directory" >&2
    exit 1
fi

case $2 in
    4k,1m) blksize=$2;;
    *) blksize="64k";;
esac

echo "mount $1 with block size $blksize"
docker run --rm --device /dev/fuse --cap-add SYS_ADMIN --network host -v $1:/mnt:shared -d hexilee/tifs:0.1.0-bs$2 --mount-point /mnt
echo "mount $1 successfully!"
df -h -a | grep tifs
