
#!/bin/bash

echo "🔧 Server Performance Stats"
echo "-----------------------------"

# CPU Usage
echo ""
echo "🧠 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 "%, Idle: " $8 "%"}'

# Memory Usage
echo ""
echo "🗄️ Memory Usage:"
free -h | awk '/^Mem:/ {print "Used: "$3", Free: "$4", Total: "$2}'

# Disk Usage
echo ""
echo "💽 Disk Usage:"
df -h / | awk 'NR==2 {print "Used: "$3", Free: "$4", Total: "$2", Usage: "$5}'

# Top 5 CPU-consuming processes
echo ""
echo "🔥 Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 Memory-consuming processes
echo ""
echo "💾 Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

echo ""
echo "✅ Script execution completed."

