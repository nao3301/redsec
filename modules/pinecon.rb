$show = "connects to your WIFI-Pineapple (ssh + firefox)"
def main
  def up?(host)
      check = Net::Ping::External.new(host)
      check.ping?
  end

  chost = '172.16.42.1'
  if (up?(chost))
    system 'wifipineapple/wp6.sh'
    puts "Do you want to open the Web interface?"
    puts "[1] firefox\n[2] kein plan\n[0] dont open"
    browser=gets.to_i
    case browser
    when 1
      browser_s = 'firefox'
    when 2
      browser_s = 'keinplan'
    else
      puts "not granted"
      exit 0
    end
    system "#{browser_s}" + ' 172.16.42.1:1471'
  else
    puts "wifipineapple not found"
  end
end
