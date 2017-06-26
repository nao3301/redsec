require 'socket'
$show = "detect wifi netwoks around"

def erst
  sock = Socket.new(Socket::PF_PACKET, Socket::SOCK_RAW, 0x03_00)
  while true
    packet = sock.recvfrom(2048)[0].unpack('C*').pack('U*')
    next if packet.size < 60 || packet[40].ord != 80
    mac = packet[28..33].chars.map{|e|e.ord.to_s(16)}.join(':')
    name = packet[56..55+packet[55].ord]
    puts "#{Time.now}\t#{mac}\t#{name}"
  end
end

def main
  require 'socket'

  sock = Socket.new(Socket::PF_PACKET, Socket::SOCK_RAW, 0x03_00)
  while true
    packet = sock.recvfrom(2048)[0].unpack('C*').pack('U*')
    next if packet.size < 60 || packet[40].ord != 80
    mac = packet[28..33].chars.map{|e|e.ord.to_s(16)}.join(':')
    name = packet[56..55+packet[55].ord]
    puts "#{Time.now}\t#{mac}\t#{name}"
  end
end
