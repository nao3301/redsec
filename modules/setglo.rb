$show = ".set globals, which then will be used by the modules"
def main
  puts "Type your globals:"
  comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/)}
  gtarget = Readline.readline('/setglo/target ~ ', true)
  unless gtarget.empty?
    $gtarget = gtarget
  end
  gport = Readline.readline('/setglo/port ~ ', true)
  unless gport.empty?
    $gport = gport
  end
  ghash = Readline.readline('/setglo/hash ~ ', true)
  unless ghash.empty?
    $ghash = ghash
  end
  gwordlist = Readline.readline('/setglo/wordlist ~ ', true)
  unless gwordlist.empty?
    $gwordlist = gwordlist
  end
  guser = Readline.readline('/setglo/user ~ ', true)
  unless guser.empty?
    $guser = guser
  end
  gap = Readline.readline('/setglo/ap ~ ', true)
  unless gap.empty?
    $gap = gap
  end
  ginterface = Readline.readline('/setglo/interface ~ ', true)
  unless ginterface.empty?
    $ginterface = ginterface
  end
  ip = Readline.readline('/setglo/ip ~ ', true)
  unless ip.empty?
    $ip = ip
  end
  iprange = Readline.readline('/setglo/iprange ~ ', true)
  unless iprange.empty?
    $iprange = iprange
  end
end
