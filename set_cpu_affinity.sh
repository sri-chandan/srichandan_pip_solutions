
#!/bin/bash

# Check for the required PID and CPU core arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <PID> <CPU_CORE>"
    exit 1
fi

PID="$1"
CPU_CORE="$2"

# Check if the provided PID exists
if ! ps -p $PID &> /dev/null; then
    echo "Process with PID $PID does not exist."
    exit 1
fi

# Set CPU affinity
taskset -cp $CPU_CORE $PID

# Check if the affinity was set successfully
if [ $? -eq 0 ]; then
    echo "CPU affinity for PID $PID set to CPU core $CPU_CORE."
else
    echo "Failed to set CPU affinity for PID $PID."
fi
