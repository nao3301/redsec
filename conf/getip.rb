require 'socket'
count = 0
$ginterface = 'NILL'
$ip = 'NILL'
addr_infos = Socket.getifaddrs
addr_infos.each do |addr_info|
    if addr_info.addr
      if (addr_info.name != 'lo')
        if addr_info.addr.ipv4?
          count += 1
          print "[#{count}] "
          puts "#{addr_info.name} has address #{addr_info.addr.ip_address}"
          $ginterface = addr_info.name.to_s
          $ip = addr_info.addr.ip_address.to_s
        end
      end
    end
end

if (count < 0)
  count -= 2
end

if (count == 0)
  puts "you have no connection"
elsif (count == 1)

elsif (count > 1)
  puts "you are using more than one interface.\nwhitch one do you want to use?"
  print "[1-#{count}] "
  no = gets.to_i

  count = 0
  addr_infos.each do |addr_info|
      if addr_info.addr
        if (addr_info.name != 'lo')
          if addr_info.addr.ipv4?
              count += 1
              if (count == no)
              print "[#{count}] "
              puts "#{addr_info.name} has address #{addr_info.addr.ip_address}"
              $ginterface = addr_info.name.to_s
              $ip = addr_info.addr.ip_address.to_s
                break
              end
          end
        end
      end
  end
end



# require 'socket'
# addr_infos = Socket.getifaddrs
# addr_infos.each do |addr_info|
#     if addr_info.addr
#       puts "#{addr_info.name} has address #{addr_info.addr.ip_address}" if addr_info.addr.ipv4?
#     end
# end

#
# $ip = IPSocket.getaddress(Socket.gethostname)
# puts ip
#
# host = Socket.gethostname
# puts host
