FROM alpine:3.9

RUN apk add --no-cache bash inotify-tools

COPY addTail /usr/local/bin/addTail
COPY logtrack.sh /usr/local/bin/logtrack.sh

VOLUME ["/logs"]

CMD ["logtrack.sh"]
