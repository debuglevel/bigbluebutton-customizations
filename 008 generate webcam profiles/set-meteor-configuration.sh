#!/bin/bash
echo "Setting webcam settings"

# TODO: apply-lib.sh must be sourced ot something to get $HTML5_CONFIG

HTML5_CONFIG="test.yml"

# WebRTC allows minimum of 30kbit/s (says BBB docs)
BITRATE_MIN=30
BITRATE_MAX=200
BITRATE_STEP=30

FRAMERATE_MIN=1
FRAMERATE_MAX=15
FRAMERATE_STEP=2
for bitrate in $(seq $BITRATE_MIN $BITRATE_STEP $BITRATE_MAX); do
  #echo "Bitrate $bitrate"
  for framerate in `seq $FRAMERATE_MIN $FRAMERATE_STEP $FRAMERATE_MAX`; do
    #echo "Framerate $framerate"

    id="custom-r$framerate-b$bandwidth"
    name="Custom: $framerate fps, $bandwidth kbit/s"
    echo "$id: $bandwidth kbit/s, $framerate fps"
    yq w -i $HTML5_CONFIG "public.kurento.cameraProfiles.(id==$id).id" $id
    yq w -i $HTML5_CONFIG "public.kurento.cameraProfiles.(id==$id).name" $name
    yq w -i $HTML5_CONFIG "public.kurento.cameraProfiles.(id==$id).bitrate" $bitrate
    yq w -i $HTML5_CONFIG "public.kurento.cameraProfiles.(id==$id).default" false
    yq w -i $HTML5_CONFIG "public.kurento.cameraProfiles.(id==$id).hidden" false
    yq w -i $HTML5_CONFIG "public.kurento.cameraProfiles.(id==$id).constraints.frameRate" $framerate
  done
done

#chown meteor:meteor $HTML5_CONFIG
