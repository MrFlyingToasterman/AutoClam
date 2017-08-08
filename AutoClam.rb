#!/usr/bin/env ruby
puts "Welcome to AutoClam\n[INFO] Checking mashine with ClamAV"

# Update ClamAv
def runUpdate
  puts "[INFO] Updating ClamDB"
  exec( "sudo freshclam" )
end

# Programm core
runUpdate
