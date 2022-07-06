#!/bin/sh

set -a
set -o errexit
set -o nounset

NGINX_STATIC_PATH=${NGINX_STATIC_PATH:-/usr/share/nginx/html/static}
for OLD_CHUNK in $(find "${NGINX_STATIC_PATH}"/* -type f |cut -d'.' -f2|sort|uniq)
do
CHUNK="$(cut -d"-" -f1 < /proc/sys/kernel/random/uuid)"
# shellcheck disable=SC2039
while IFS= read -r -d '' f
do
	mv "$f" "$(echo "$f" | sed "s/${OLD_CHUNK}/${CHUNK}/")"
done < <(find "${NGINX_STATIC_PATH}" -type f -name "*${OLD_CHUNK}*" -print0)
grep -rl "${OLD_CHUNK}" . | xargs sed -i "s/${OLD_CHUNK}/${CHUNK}/g"
done

unset CHUNK
unset OLD_CHUNK
