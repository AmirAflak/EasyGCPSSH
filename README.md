# GCP Instance Management Script

This Bash script allows you to manage your Google Cloud instances by starting or stopping them.

## Prerequisites

- Make sure you have the [Google Cloud SDK](https://cloud.google.com/sdk) installed and configured on your system.
- This script assumes you have already set up SSH configuration for your instances.

## Usage

1. Set your instance name by modifying the `INSTANCE_NAME` variable in the script.

   ```bash
   INSTANCE_NAME="mehrdad-gcp"

2. Set your instance name by modifying the `INSTANCE_NAME` variable in the script.

   ```bash
   bash gcp-instance-management.sh [start|stop]"
* `start`: Starts the specified GCP instance and updates the SSH configuration with the external IP address.
* `stop`: Stops the specified GCP instance.

## Script Details
The script performs the following tasks:

1. When starting an instance:
   1. Starts the GCP instance.
   2. Waits for 10 seconds to allow time for the instance to start up.
   3. Finds the entry in the SSH configuration file (~/.ssh/config) corresponding to the instance name.
   4. Updates the SSH configuration with the new external IP address.
2. When stopping an instance:
   * Stops the GCP instance.
     
## License
This script is licensed under the MIT License. See `LICENSE.txt` for more information.



  
