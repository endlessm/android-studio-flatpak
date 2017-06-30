#!/bin/bash
set -eu
#
# Replace jdk.table xml file
# For Android Studio to detect the correct JDK path
# we need to preset the path in the jdk.table.xml
#

OPTIONS_DIR="$HOME/.AndroidStudio2.3/config/options"

if [[ ! -f "${OPTIONS_DIR}/jdk.table.xml" ]]; then
  mkdir -p "${OPTIONS_DIR}"
  cp /app/AndroidStudioConfig/jdk.table.xml "${OPTIONS_DIR}/jdk.table.xml"
fi

exec /app/bin/studio.sh "$@"
