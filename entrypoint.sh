#!/bin/bash

[[ -z "$LISTEN_PORT" ]] && LISTEN_PORT=3000
[[ -z "$MERGE_FOLDER" ]] && MERGE_FOLDER=/config


function mergeJson() {
    files=$(find ./ -name *.json)
    merged=$(jq -s 'reduce .[] as $item ({}; . * $item)' $files)
    echo -e "HTTP/1.1 200\r\n\r\n${merged}"
}

if [ ! -d "$MERGE_FOLDER" ]; then
    echo "Merge folder does not exist: ${MERGE_FOLDER}"
    exit 0;
fi

echo "Listening on ${LISTEN_PORT}"
while true; do
    mergeJson | nc -lvN ${LISTEN_PORT} 
done
