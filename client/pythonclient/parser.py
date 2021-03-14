import re

class checker:

    def getIPs(self,thefile): #read all the IP from thefile parameter. Return a list containing the IPs
        logfile = list(open(str(thefile), 'r').read().split('\n'))
        newip = []
        for entry in logfile:
            ips = re.findall(r'[0-9]+(?:\.[0-9]+){3}', entry)
            for ip in ips:
                newip.append(ip)
        return newip

    def readFile(self,thefile): #Return a dictionary after read IP and hostname form a file and store them in the mentioned dictionary with key: IP and value: hostname.
        with open(str(thefile),'r') as f: #format file: "IP<space>hostname"
            auxlist = []
            ip_not_found = True
            for line in f:
                ip_not_found = False
                auxlist.append(line.rstrip())

        dictionary = {}
        for i in range(len(auxlist)):
            auxlist[i] = auxlist[i].split(" ")
        dictionary = dict(auxlist)

        return dictionary

    def getHostname(self, IP,thefile): #given a IP, return the hostname
        data = self.readFile(thefile)
        return data.get(IP)


    def getTemperature(self):
        with open("temperature.txt", "r") as f: #verify path
            value = f.read()

        return value

    def cleanFile(self,stream):
       pass 


    def getHosts(self):
        hostsList = []
        keylist = self.getIPs("hosts.txt") #get IPs from hosts.txt (more details about it on: https://github.com/MAInformatico/Raspberry-Pi-Monitoring-Network/tree/master/RaspberryPiFiles )
        for i in range(len(keylist)):
            hostsList.append(self.getHostname(keylist[i],"dictionary.txt")) #where dictionary.txt is the file that contains my "DNS file" Please, create your own file dictionary.txt

        if "None" in hostsList:
            print("Unknown device")
            return "There is an unknown devices!!"
        #print(hostsList)
        else:
            return hostsList

    def exportHosts(self):
        theHosts = self.getHosts()
        with open("../../FlaskMonitorNetwork/app/currentHosts.txt", "w") as f: #Check the file of FlaskMonitorNetwork plugin https://github.com/MAInformatico/FlaskMonitorNetwork
            for item in theHosts:
                f.write("%s\n" % item)

obj = checker()
obj.exportHosts()
