#!/bin/bash

trap cleanup INT

function cleanup() {
  while read pid; do kill $pid; echo killed $pid; done < /tmp/pids
}

: > /tmp/pids

for log in $(find /logs -type f); do
  addTail n logs $log
done

inotifywait -q -r -m "/logs" -e create -e moved_to |
    while read dir action file; do
        filepath=$(readlink -fn $dir$file)
        #echo "The file '$file' appeared in directory '$dir' via '$action'"
        if [[ -f "$filepath" ]]
        then
            addTail n logs $filepath
        fi
    done

inotifyd addTail /logs:n