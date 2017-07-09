require 'readline'
require 'pathname'
require 'net/ping'
require_relative 'logo/color.rb'

$gtarget = 0
$gport = 0
$ghash = 0
$gwordlist = 0
$guser = 0
$gap = 0
$ginterface = 0
$ip
$iprange = ''
$modules = 0
$show = ''

def set_ip()
  i = 0
  count = 0
  if ($ip != 'NILL')
    loop do
      $iprange += $ip[i]
      i += 1
      if ($ip[i] == '.')
        count += 1
      end
      break if (count == 3)
    end
    $iprange += '.0/24'
    $ap = $iprange + '.1'
  end
end

LIST = [ 'exit' ].sort
$List_sh = ['.closes the programm']

Dir["modules/*.rb"].each do |f|
  load "#{f}"
  $List_sh << "#{$show}"
  LIST << "#{f}"[8..-4]
  $modules += 1
end

comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/)}

Readline.completion_append_character = ""
Readline.completion_proc = comp

load "logo/logo.rb"

if (Time.now.hour.to_i >= 6) && (Time.now.hour.to_i <= 12)
  puts "  good morning!"
elsif (Time.now.hour.to_i > 12) && (Time.now.hour.to_i <= 17)
  puts "  good afternoon!"
elsif (Time.now.hour.to_i > 17) && (Time.now.hour.to_i <= 22)
  puts "  good evening!"
else
  puts "  good night!"
end

print "\n"
load "conf/getip.rb"
print "\n"

set_ip
#ninjamode

while line = Readline.readline('~ ', true)
  case line
  when 'exit'
    puts " hope you made a big loot!".red
    exit 0
  when '' , ' '
    puts "nothing to do"
  else
    if (File.exist?("modules/#{line}.rb"))
      load "modules/#{line}.rb"
      main
    else
      puts "command not known. please use help."
    end
  end
end
