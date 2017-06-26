$show = "cracks password hash with wordlist (dictionary attack)"
def main
  puts "passwd hash cracker"
  puts "please mind your characters must not be capital letters"
  puts "supports: md5, sha1, sha224, sha256, sha384, sha512"

  puts "hash-algorithim:"
  algo = Readline.readline('/dedpscr/algo ~ ', true)


  if ($ghash == 0)
    puts "hash: "
   hash = Readline.readline('/dedpscr/hash ~ ', true)
   unless hash.empty?
     $ghash = hash
   end
  end

  if ($gwordlist == 0)
    puts "wordlist: "
   wordlist = Readline.readline('/dedpscr/wordlist ~ ', true)
   unless wordlist.empty?
     $gwordlist = wordlist
   end
  end

  system "python2 'sha_python.py' #{algo} #{$ghash} #{$gwordlist}"
end
