$show = "timeattack a port"
def main
  if ($gtarget == 0)
   $gtarget = Readline.readline('/timeatt/target ~ ', true)
  end
  if ($gport == 0)
   $gport = Readline.readline('/timeatt/port ~ ', true)
  end
  system "python2 timeattack.py #{$gtarget} #{$gport}"
end
