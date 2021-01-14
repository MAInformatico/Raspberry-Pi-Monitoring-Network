sudo nmap -sP 192.168.1.0/24 > hosts.txt;
sudo /opt/vc/bin/vcgencmd measure_temp > temperature.txt;
sudo ps -aux > process.txt;
sudo netstat -natp > ports.txt;
date >> HTTPsConnections.txt;
python3 -m http.server 1234 & #Please verify if your port is allowed in your firewall
sleep 2m; #2 minutes delay
kill -9 `ps -ef |grep python3 |grep 1234 |awk '{print $2}'` #1234 is the port used by Python http server, it can be changed.

