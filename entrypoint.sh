#!/bin/bash

set -e

if [ "$1" = 'check_kube' ]; then
   echo "Copying kubernetes local checks"
   cp /scripts/* /usr/lib/check_mk_agent/local
fi

/usr/sbin/xinetd -f /etc/xinetd.conf -dontfork -stayalive
