$show = "sets ssh-connection to a client"
def main
  comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/)}
  if ($guser == 0)
   $guser = Readline.readline('/ssh/username ~ ', true)
  end
  if ($gtarget == 0)
   $gtarget = Readline.readline('/ssh/target ~ ', true)
  end

  sshconnection = 'ssh ' + $guser + '@' + $gtarget

  system (sshconnection)
end
