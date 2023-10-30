
#!/bin/bash

# Output file to log CPU usage
log_file="cpu_usage.log"

# Function to get current CPU usage
get_cpu_usage() {
  top -b -n 1 | grep '%Cpu' | awk '{print $2}'
}

# Main loop to log CPU usage every 10 seconds
while true; do
  cpu_usage=$(get_cpu_usage)
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$timestamp CPU Usage: $cpu_usage%" >> "$log_file"
  sleep 10
done
