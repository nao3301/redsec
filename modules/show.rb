$show = ".shows you the modules"
def main
  def out
    i = 0
    loop do
      if ($List_sh[i].to_s[0] != '.')
        print "%-9s" % ["\t#{LIST[i]}"]
        puts "\t#{$List_sh[i]}"
      end
      i += 1
      break if (i >= $List_sh.length)
    end
  end
  puts "%-9s" % ["\tcommand".underline] + "\t\t" + "description".underline
  puts ""
  out
end
