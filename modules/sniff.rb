$show = " wifi sniffer"

def main
    require 'set'
    require 'socket'
    Socket.const_set("ETH_P_ALL", 0x0300)
    r_sock = Socket.new(Socket::AF_PACKET, Socket::SOCK_RAW, Socket::ETH_P_ALL)
    ap_list = Set.new
    puts "\n %-19s %-6s %-5s %s\n\n" % ["BSSID", "PWR","CH", "ESSID"]
        while true
            pkt = r_sock.recvfrom(2048)[0]
            if pkt[26].eql? "\x80"
                unless ap_list.include?(pkt[36...42]) and pkt[63].ord > 0
                    ap_list.add(pkt[36...42])
                    essid = pkt[64...64 + pkt[63].ord]
                    bssid = pkt[36...42].unpack('H*')[0].scan(/.{2}/).join(':').upcase
                    signal = pkt.scan(/.{1}/)[22].unpack('c*')[0].to_s
                    offset = pkt.scan(/.{16}/)[5].scan(/.{1}/).index("\x03")
                    channel = pkt.scan(/.{16}/)[5].scan(/.{1}/)[offset+2].unpack("c*")[0].to_s rescue nil
                    puts " %-19s %-6s %-5s %s" % [bssid, signal, channel, essid]
                end
            end
        end
end
