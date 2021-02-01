#!/bin/bash
echo "- Setting application title..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TARGET=/usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml

yq w -i $TARGET public.app.clientTitle "MyCompany BigBlueButton"
