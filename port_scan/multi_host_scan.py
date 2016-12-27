#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket
import threading
import sys

lock = threading.RLock()

def tcp_test(port):
    sk = socket.socket()
    sk.settimeout(1)
    result = sk.connect_ex((target_ip, port))
    if result == 0:
        lock.acquire()   #for print
        print "opened ports:", port
        lock.release()

if __name__=='__main__':
    #multi_host_scan.py <host> <start_port>-<end_port>
    #host = sys.argv[1]
    #ports = sys.argv[2].split('-')

    #s_port = int(ports[0])
    #e_port = int(ports[1])

    hosts = []
    ports = []

    with open("allhost.md") as f:
        hosts.append(f.readline())

    with open("allports.md") as f:
        ports.append(f.readline())

    for host in hosts:
        target_ip = socket.gethostbyname(host)

        for port in range(s_port, e_port):
            t = threading.Thread(target=tcp_test, args=(port,))    #first func name, second is params, only a tuple
            t.start()
