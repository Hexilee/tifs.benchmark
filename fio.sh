#!/bin/sh

if [ ! -d "$1" ]; then
    echo "$1 is not a directory" >&2
    exit 1
fi

case $2 in
    4k,1m) blksize=$2;;
    *) blksize="64k";;
esac

fio -filename $1/test-file fio/bs$2.fio
