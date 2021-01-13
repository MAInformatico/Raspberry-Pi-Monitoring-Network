import urllib.request, urllib.error, urllib.parse

Files = ['temperature.txt','ports.txt','process.txt','hosts.txt']
Port = '1234'
IP = '192.168.1.39'

for i in range(len(Files)):
    url = 'http://'+ str(IP)+ ':' + str(Port) + '/' + str(Files[i])
    response = urllib.request.urlopen(url)
    content = response.read()
    theFile = open(str(Files[i]),'wb')
    theFile.write(content)
    theFile.close()
