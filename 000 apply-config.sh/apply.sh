#!/bin/bash
echo "- Setting apply-config.sh..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#echo " - Copying apply-config.sh to /etc/bigbluebutton/bbb-conf/apply-config.sh ..."
#cp $DIR/apply-config.sh /etc/bigbluebutton/bbb-conf/apply-config.sh

echo " - Linking $DIR/apply-config.sh to /etc/bigbluebutton/bbb-conf/apply-config.sh ..."
ln -s "$DIR/apply-config.sh" /etc/bigbluebutton/bbb-conf/apply-config.sh
