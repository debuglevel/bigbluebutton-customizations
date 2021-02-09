#!/bin/bash

# Pull in the helper functions for configuring BigBlueButton
source /etc/bigbluebutton/bbb-conf/apply-lib.sh

echo "- Increase BreakOut Room limit..."
yq w -i $HTML5_CONFIG public.app.breakoutRoomLimit 12
