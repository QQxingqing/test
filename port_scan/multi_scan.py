#!/usr/bin/env python
# -*- coding: utf-8 -*-

from socket import *
import threading
import sys

lock = threading.RLock()

def tcp_test(port):
    sk = socket()
    sk.settimeout(1)
    result = sk.connect_ex((target_ip, port))
    if result == 0:
        lock.acquire()    #for print
        print "opened ports:", port
        lock.release()

if __name__=='__main__':
    #multi_scan.py <host> <start_port>-<end_port>
    host = sys.argv[1]
    ports = sys.argv[2].split('-')

    s_port = int(ports[0])
    e_port = int(ports[1])

    target_ip = gethostbyname(host)

    for port in range(s_port, e_port + 1):
        t = threading.Thread(target=tcp_test, args=(port,)) #first func name, second is params, only a tuple 第一个函数名称,第二个参数,只有一个元组
        t.start()
