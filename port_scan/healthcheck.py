#!/usr/bin/env python
#-*- coding: utf-8 -*-
#返回值1为完全开启
#返回值0为完全关闭
#返回值2为启动或关闭异常

import sys
import socket

#port_scan.py <module> <hostname>

gamePort = [7100, 8082]
gatePort = [7200]
loginPort = [7000, 8081]
openPort = []
closePort = []

module = sys.argv[1]
host = sys.argv[2]
#port = int(sys.argv[3])

#hostname-->ipaddres
target_ip = socket.gethostbyname(host)

#module-->port
if module == "game":
    checkPort = gamePort
elif module == "gate":
    checkPort = gatePort
elif module == "login":
    checkPort = loginPort

#check port status
for port in checkPort:
    sock = socket.socket()
    sock.settimeout(1)
    result = sock.connect_ex((target_ip, port))
    if result == 0:
        openPort.append(port)
    else:
        closePort.append(port)

#return result
if len(openPort) == len(checkPort):
    sys.exit(1)
elif len(closePort) == len(checkPort):
    sys.exit(0)
else:
    sys.exit(2)
