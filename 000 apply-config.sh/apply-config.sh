#!/bin/bash

#TODO: configure and call other mods

# Pull in the helper functions for configuring BigBlueButton
source /etc/bigbluebutton/bbb-conf/apply-lib.sh

SCRIPT_PATH=${BASH_SOURCE[0]}
echo "Script was called as $SCRIPT_PATH"
REAL_PATH=$(readlink "$SCRIPT_PATH")
echo "Real path is $REAL_PATH"
DIR=$(dirname "$REAL_PATH")
echo "Directory is $DIR"
BASEDIR=$(dirname "$DIR")
echo "Base directory is $BASEDIR"

source $BASEDIR/config.sh

cd $BASEDIR

if [ "$RUN_001" = true ] ; then
  $BASEDIR/001*/apply.sh
fi
if [ "$RUN_002" = true ] ; then
  $BASEDIR/002*/apply.sh
fi
if [ "$RUN_003" = true ] ; then
  $BASEDIR/003*/apply.sh
fi
if [ "$RUN_004" = true ] ; then
  $BASEDIR/004*/apply.sh
fi
if [ "$RUN_005" = true ] ; then
  $BASEDIR/005*/apply.sh
fi
if [ "$RUN_006" = true ] ; then
  $BASEDIR/006*/apply.sh
fi
if [ "$RUN_007" = true ] ; then
  $BASEDIR/007*/apply.sh
fi
if [ "$RUN_008" = true ] ; then
  $BASEDIR/008*/apply.sh
fi
if [ "$RUN_009" = true ] ; then
  $BASEDIR/009*/apply.sh
fi
if [ "$RUN_010" = true ] ; then
  $BASEDIR/010*/apply.sh
fi
if [ "$RUN_011" = true ] ; then
  $BASEDIR/011*/apply.sh
fi
if [ "$RUN_012" = true ] ; then
  $BASEDIR/012*/apply.sh
fi


