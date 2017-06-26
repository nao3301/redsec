$show = "kicks one target out of the network"
def main
  nickp= "python2 'nick_arp.py' "
  comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/)}
  if ($ginterface == 0)
   $ginterface = Readline.readline('/kicknick/interface ~ ', true)
  end
  if ($gtarget == 0)
    $gtarget = Readline.readline('/kicknick/target ~ ', true)
  end
  if ($gap == 0)
   $gap = Readline.readline('/kicknick/ap_ip ~ ', true)
  end

  nickp = nickp + ' ' + $ginterface + ' ' + $gtarget + ' ' + $gap + ' 0'
  system (nickp)
end
