#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp $DIR/apply-config.sh /etc/bigbluebutton/bbb-conf/apply-config.sh
chmod +x /etc/bigbluebutton/bbb-conf/apply-config.sh