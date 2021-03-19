#!/bin/sh

if [ ! -f "$1" ]; then
    echo "$1 is not a file" >&2
    exit 1
fi

kv=1

re='^[0-9]+$'
if [[ $2 =~ $re ]] ; then
   kv=$2
fi

tiup playground --db 0 --kv $kv --kv.config $1
