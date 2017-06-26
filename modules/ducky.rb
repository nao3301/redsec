$show = "opens the DuckToolkit to encode ducky scrips"
def main
  comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/)}
  system "python2 DuckToolkit/ducktools.py -h"
  lan = Readline.readline('keybord language [us,gb,de,fr,]~ ', true)
  puts "[d]ecrypt or  [e]ncrypt"
  crypt = Readline.readline('ducky/crypt [d e]~ ', true)
  inputfile = Readline.readline('ducky/inputfile ~ ', true)
  outputpath = Readline.readline('ducky/outputpath ~ ', true)

  system "python2 DuckToolkit/ducktools.py -l " + lan + " -" + crypt + " " + inputfile + " " + outputpath
end
