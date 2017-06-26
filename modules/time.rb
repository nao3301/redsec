$show = ".display local time"

def main
  puts "#{Time.now.strftime("%H:%M:%S %d.%m.%Y")}"
end
