#!/bin/bash
echo "- Setting friendly german welcome presentation..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp "$DIR/default.pdf" /var/www/bigbluebutton-default/default.pdf
