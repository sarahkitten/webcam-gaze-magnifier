#DO NOT USE THIS SERVER FOR TESTING, THE socket.accept() fucntion does not work with puTTy or iMotions

import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

local_hostname = "127.0.0.1"

local_fqdn = socket.getfqdn()

ip_address = socket.gethostbyname(local_hostname)

print ("working on %s (%s) with %s" % (local_hostname, local_fqdn, ip_address))

server_address = (ip_address, 8088)  
print ('starting up on %s port %s' % server_address)  
sock.bind(server_address)

sock.listen(1)

while True:  

    print ('waiting for a connection')
    connection, client_address = sock.accept()

    try:

        print ('connection from', client_address)


        while True:
            data = connection.recv(64)
            if data:

                print ("Data: %s" % data)
            else:

                print ("no more data.")
                break
    finally:

        connection.close()