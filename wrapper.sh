#!/bin/bash

for i in 1 2 3 4; do
TMPF=$(mktemp -p /var/lib/node_exporter/)
chmod a+r $TMPF
trap "rm -f $TMPF" exit
go run blaster.go -appid 107410 > "$TMPF" || exit
mv "$TMPF" /var/lib/node_exporter/armads.prom
sleep 13
done
