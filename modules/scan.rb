$show = "scans other clients in your network"
def main
  system "nmap -sP #{$iprange}"
end
