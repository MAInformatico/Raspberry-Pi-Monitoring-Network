sudo nmap -sP 192.168.1.0/24 > hosts.txt;
#sudo mpack -s "Current hosts" /root/hosts.txt <your email>;
sudo /opt/vc/bin/vcgencmd measure_temp > temperature.txt;
#sudo mpack -s "Server's temperature" /root/temperature.txt <your email>;
sudo ps -aux > process.txt;
#sudo mpack -s "Current process" /root/process.txt <your email>;
sudo netstat -natp > ports.txt;
#sudo mpack -s "Listening Ports" /root/ports.txt <your email>;
#rm *.txt
date >> HTTPsConnections.txt;
python3 -m http.server 1234 & #Please verify if your port is allowed in your firewall
sleep 9.0; #9 delay of secs
kill -9 `ps -ef |grep python3 |grep 1234 |awk '{print $2}'` #1234 is the port used by Python http server, it can be changed.

