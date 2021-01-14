sudo touch today$(date +%d%m%y).pcap && sudo tshark -nni eth0 -a duration:86400  -w today$(date +%d%m%y).pcap && tar -cvf comprimed.tar today$(date +%d%m%y).pcap
