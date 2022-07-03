#!/bin/sh

set -a
set -o errexit
set -o nounset

ENV_LIST="$(cat "${ENV_LIST_FILE:-/tmp/.env.list}")"
for file in ${CHUNK_FOLDER};
do
  envsubst "${ENV_LIST}" < "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

unset CHUNK_FOLDER
unset ENV_LIST
rm "${ENV_LIST_FILE:-/tmp/.env.list}" || true
unset ENV_LIST_FILE
