#!/usr/bin/env bash

INDEX_URL='http://10.5.5.9:8080/videos/DCIM/'
# Try 2 attempts with a 2 second timeout before giving up
if ! wget -t 2 -T 2 -q $INDEX_URL -O /dev/null; then
  echo 'Unable to reach the GoPro index page expected at '$INDEX_URL
  echo 'Ensure that this computer is connected to the GoPros wifi network'
  exit 1
fi

DIR="./"$(date -I)
if [[ ! -d $DIR ]]; then
  mkdir "$DIR"
fi
wget -p "$DIR" -r -A.MP4,.JPG -nc -c $INDEX_URL
