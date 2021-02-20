sudo nmap -sP 192.168.1.0/24 > hosts.txt;
#sudo mpack -s "Current hosts" /root/hosts.txt magutierrezsistemas@gmail.com;
sudo /opt/vc/bin/vcgencmd measure_temp > temperature.txt;
#sudo mpack -s "Server's temperature" /root/temperature.txt magutierrezsistemas@gmail.com;
sudo ps -aux > process.txt;
#sudo mpack -s "Current process" /root/process.txt magutierrezsistemas@gmail.com;
sudo netstat -natp > ports.txt;
#sudo mpack -s "Listening Ports" /root/ports.txt magutierrezsistemas@gmail.com;
#rm *.txt
date >> HTTPsConnections.txt;
if ping -c 1 192.168.1.255 &> /dev/null #put here the IP of your client
then
python3 -m http.server 1234 & #Please verify if your port is allowed in your firewall
sleep 2m; #9 delay of secs
kill -9 `ps -ef |grep python3 |grep 1234 |awk '{print $2}'`
else
	echo "Client unreacheable"
fi

