# AWS-Monitoring-Tools
Simple tools for your ec2 infra on AWS

# Requirements:

  Ubuntu 14.04 LTS
  
  Log Rotation to be setup for the file /var/log/system-health.log
  
  Use a file shipper like filebeat to ship the logs to your ELK/Graylog stack and start monitoring your instance on fly!

# Description:
This script helps in monitoring your Ubuntu EC2 Instance on high-level for the following parameters every 10 Seconds:

CPU-LOAD

MEMORY-USED

DISK-USED

# Steps to Perform:
Ensure that it is a Ubuntu14.04 Instance and you run the script the following way:

$ sudo chmod +x system-monitor.sh

$ sudo setsid /path/to/your/location/system-monitor.sh  >/dev/null 2>&1 < /dev/null &
