#!/bin/bash

date=$(date +"%Y-%m-%d_%H:%M:%S")

report_path="path"

services=("docker" "nginx" "cron")

top_process=$(ps aux --sort=-%cpu | awk 'NR <= 6 {print $0}')


#Disk info
disk_info=$(df -h)

#RAM Indo
ram_info=$(free -h)

#Getting disk percent
disk_usage=$(df -h | awk 'NR==2  {print $5}' || echo "Can get the percent of disk usage")

#Getting RAM usage
ram_usage=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')

#Getting CPU Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)


{
	echo "Health check report $date"
	echo "----------------------------"
	echo "Disk info:"
	echo "$disk_info"
	echo "----------------------------"
	echo "RAM info"
	echo "$ram_info"
	echo "----------------------------"
	echo "Top process"
	echo "$top_process"
	echo "----------------------------"
	echo "Disk usage"
	echo "$disk_usage"
	echo "----------------------------"
	echo "RAM usage"
	echo "$ram_usage"
	echo "----------------------------"
	echo "CPU usage"
	echo "$cpu_usage"
	echo "----------------------------"
	for service in "${services[@]}"; do
		if systemctl is-active --quiet "$service"; then
			echo "$service is running "
		else
			echo "$service is not running"
		fi
	done


} > "$report_path"

echo "Health Check completed. Results exported to $report_path"
