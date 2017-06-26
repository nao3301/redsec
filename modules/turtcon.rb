$show = "connects to your Lan-Turtle (ssh)"
def main
  def up?(host)
      check = Net::Ping::External.new(host)
      check.ping?
  end

  chost = '172.16.84.1'
  if (up?(chost))
    system "ssh root@172.16.84.1"
  else
    puts "LanTurtle not found"
  end
end
