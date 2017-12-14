#!/usr/bin/env bash

# Find which script to call
CALLER_DIR="$(cd "`dirname "$0"`"; pwd)"
if [ "$CALLER_DIR" == "/usr/bin" ] || [ "$CALLER_DIR" == "/bin" ] || [ "$CALLER_DIR" == "{{ resource_manager_dir }}" ]; then
  # The wrapper (or master alternative) is the caller, so we can now call the original script.
  script=`basename "$0"`
  EXECUTABLE="$(update-alternatives --display "$script" | egrep -v '^/bin' | egrep -v '^/usr/bin' | egrep -o ^/.*"${script}" | head -n 1)"
  if [ "X$EXECUTABLE" == "X" ]; then
    echo "There is no alternative for $script"
    exit
  fi
else
  EXECUTABLE="/usr/bin/$(basename "$0")"
fi

# Set the queue in the argument list
. {{ resource_manager_dir }}/spark-policy.sh

# Call the script with all the arguments.
echo "Executing: $EXECUTABLE $@"
exec "${EXECUTABLE}" "$@"
