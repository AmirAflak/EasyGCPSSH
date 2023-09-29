bash
#!/bin/bash

# Set your instance name here
INSTANCE_NAME="mehrdad-gcp"

start_instance() {
  # Start the instance and capture the external_ip
  external_ip=$(gcloud compute instances start "$INSTANCE_NAME" --format="value(networkInterfaces[0].accessConfigs[0].natIP)")

  # Sleep for 10 seconds to allow time for the instance to start up
  sleep 10

  # Find the entry in .ssh/config corresponding to the instance name
  entry=$(awk -v instance="$INSTANCE_NAME" '$2 == instance { print NR + 1 }' ~/.ssh/config)
  # echo "Entry number is: ${entry}"

  # Replace the IP in the .ssh/config file
  # sed -i "${entry}s/Host .*$/Host $INSTANCE_NAME\n    HostName ${external_ip}/" ~/.ssh/config
  sed -i "${entry}s/.*/  HostName ${external_ip} /" ~/.ssh/config

  echo "External IP replaced with: ${external_ip}"
}

stop_instance() {
  # Stop the instance and capture the output
  stop_output=$(gcloud compute instances stop "$INSTANCE_NAME")

  # Print the stop output
  echo "$stop_output"
}

# Script entry point
case "$1" in
    start)
        start_instance
        ;;
    stop)
        stop_instance
        ;;
    *)
        echo "Usage: $0 [start|stop]"
        exit 1
        ;;
esac
