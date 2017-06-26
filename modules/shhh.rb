$show = "starts a listener (for example for the reverse shell )"
def main
  $gport = Readline.readline('/shhh/port ~ ', true)
  system "nc -nvl -p " + $gport
end
