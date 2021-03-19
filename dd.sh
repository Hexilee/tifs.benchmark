#!/bin/sh

if [ ! -d "$1" ]; then
    echo "$1 is not a directory" >&2
    exit 1
fi

case $2 in
    "4k","1M","4M") blksize=$2;;
    *) blksize="64k";;
esac

case $blksize in
    "4k") count=1024;;
    "64k") count=512;;
    "1M") count=256;;
    "4M") count=128;;
esac

echo "writing..."
dd if=/dev/zero of=$1/test-file bs=$blksize count=$count oflag=direct
echo "reading..."
dd if=/dev/zero of=$1/test-file bs=$blksize count=$count oflag=direct
