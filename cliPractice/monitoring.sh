#!/bin/bash

# Variables
RG="ResourceGroup1"
VM="QAVM1"

echo "Starting Azure VM monitoring for $VM in $RG..."
echo "Press Ctrl+C to stop."

while true; do
    az monitor metrics list \
      --resource $(az vm show -g $RG -n $VM --query id -o tsv) \
      --metric "Percentage CPU" "Network In" "Network Out" "Disk Read Bytes" "Disk Write Bytes" \
      --interval PT1M --aggregation Average -o table
    
    echo "---- Refreshed at $(date) ----"
    sleep 60
done

