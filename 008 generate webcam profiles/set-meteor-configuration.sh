#!/bin/bash
echo "Setting webcam settings..."

# TODO: apply-lib.sh must be sourced or something to get $HTML5_CONFIG
source /etc/bigbluebutton/bbb-conf/apply-lib.sh

#HTML5_CONFIG="test.yml"
echo "Using meteor config file: $HTML5_CONFIG"

# BBB 2.2 ships yq in version 3, as "yq" in PATH. I suggest just adding a yq4 binary to the PATH.
# Install it via: wget https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64 -O /usr/bin/yq4 && chmod +x /usr/bin/yq4
YQ4="yq4"

# WebRTC allows a minimum of 30kbit/s (says BBB docs)
BITRATE_MIN=30
BITRATE_MAX=200
BITRATE_STEP=30

FRAMERATE_MIN=1
FRAMERATE_MAX=15
FRAMERATE_STEP=2

for bitrate in $(seq $BITRATE_MIN $BITRATE_STEP $BITRATE_MAX); do
  for framerate in `seq $FRAMERATE_MIN $FRAMERATE_STEP $FRAMERATE_MAX`; do
    id="custom-r$framerate-b$bitrate"
    name="Custom: $framerate fps, $bitrate kbit/s"
    echo "Processing profile id=$id: $bitrate kbit/s, $framerate fps"

    time=$(date)
    dict="{\"id\": \"$id\", \"name\": \"$name\", \"bitrate\": \"$bitrate\", \"default\": false, \"hidden\": false, \"constraints\": { \"frameRate\": $framerate }, \"updated-on\": \"$time\" }"

    # check if exists
    echo "Checking if profile id=$id exists..."
    OUTPUT=$(yq4 eval "(.public.kurento.cameraProfiles.[] | select(.id == \"$id\")) | not" test.yml)
    #echo Output- $OUTPUT -x
    # if exists -> false
    # if not exists -> no output
    if [[ "$OUTPUT" == "false" ]]; then
      echo "Profile id=$id exists, updating..."
      $YQ4 -i eval "(.public.kurento.cameraProfiles.[] | select(.id == \"$id\")) = $dict" $HTML5_CONFIG
    else
      echo "Profile id=$id does not exist, adding..."
      $YQ4 -i eval ".public.kurento.cameraProfiles += $dict" $HTML5_CONFIG
    fi
  done
done

#chown meteor:meteor $HTML5_CONFIG
