sudo nmap -sP 192.168.1.0/24 > monitor.txt;
sudo mpack -s "Connected hosts" /root/monitor.txt email@email.com;
sudo /opt/vc/bin/vcgencmd measure_temp > temperature.txt;
sudo mpack -s "Temperature server" /root/temperature.txt email@email.com;
sudo ps -aux > process.txt;
sudo mpack -s "Active tasks" /root/process.txt email@email.com;
sudo netstat -natp > ports.txt
sudo mpack -s "Active ports" /root/ports.txt email@email.com;
rm *.txt
