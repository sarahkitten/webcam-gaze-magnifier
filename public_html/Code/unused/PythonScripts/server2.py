#this server works for all iMotions tests.
#remember to set ALL server AND forwarding settings to port-IP = 127.0.0.1 and to port-ID = 8088
import socket

UDP_IP = "127.0.0.1"

UDP_PORT = 8088

s= socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

s.bind((UDP_IP, UDP_PORT))

BUFFER_SIZE = 2048

#f = open("data+UDP.txt", "w")

data = s.recv(BUFFER_SIZE)

while(data != None):

    data = s.recv(BUFFER_SIZE)

    print("received message: ", data)

    #f.write(str(data))

s.close()

#f.close()