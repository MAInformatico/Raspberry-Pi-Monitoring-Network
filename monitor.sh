sudo rm monitor.txt;
sudo nmap -sP LAN_IP/24 > monitor.txt;
sudo mpack -s "Equipos conectados" /root/monitor.txt your_email@email.com
