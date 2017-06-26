#!/usr/bin/python2

# -*- coding: utf-8 -*-

import sys
from pythonwifi.iwlibs import Wireless

frequency_channel_map = {
    2412000000: "1",
    2417000000: "2",
    2422000000: "3",
    2427000000: "4",
    2432000000: "5",
    2437000000: "6",
    2442000000: "7",
    2447000000: "8",
    2452000000: "9",
    2457000000: "10",
    2462000000: "11",
    2467000000: "12",
    2472000000: "13",
    2484000000: "14",
    5180000000: "36",
    5200000000: "40",
    5220000000: "44",
    5240000000: "48",
    5260000000: "52",
    5280000000: "56",
    5300000000: "60",
    5320000000: "64",
    5500000000: "100",
    5520000000: "104",
    5540000000: "108",
    5560000000: "112",
    5580000000: "116",
    5600000000: "120",
    5620000000: "124",
    5640000000: "128",
    5660000000: "132",
    5680000000: "136",
    5700000000: "140",
    5735000000: "147",
    5755000000: "151",
    5775000000: "155",
    5795000000: "159",
    5815000000: "163",
    5835000000: "167",
    5785000000: "171"
}

# wifi = Wireless("wlp2s0")
#wifi = Wireless(raw_input("interface: "))
if sys.argv[1] != "0":
    wifi = Wireless(sys.argv[1])
else :
    wifi = Wireless(raw_input("interface: "))

for ap in wifi.scan():
    print "SSID: " + ap.essid
    print "AP: " + ap.bssid
    print "Signal: " + str(ap.quality.getSignallevel())
    print "Frequency: " + str(ap.frequency.getFrequency())
    print "Channel: " + str(frequency_channel_map.get(ap.frequency.getFrequency()))
    print ""