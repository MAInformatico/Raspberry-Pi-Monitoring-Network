import urllib.request, urllib.error, urllib.parse
import os

class system:
    __IP = ' '
    __Port = ' '

    def __init__(self,i,p):
        self.__IP = i
        self.__Port = p

    def getIP(self):
        return self.__IP
    def getPort(self):
        return self.__Port

    def checker(self,IP): #Check if your server is available or not
        check = os.system("ping -c 1 " + IP + "> /dev/null 2>&1")
        value = 0
        if check == 0 : 
            value = 0
        else:
            value = 1
        return value

