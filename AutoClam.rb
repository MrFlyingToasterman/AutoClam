#!/usr/bin/env ruby
puts "Welcome to AutoClam\n[INFO] Checking mashine with ClamAV"

# Check Root
def checkRoot
 if Process.euid != 0
   # Not running as user root
   puts "Please run this script as root!"
   exit
 end
end

# Update ClamAv
def runUpdate
  puts "[INFO] Updating ClamDB"
  system( "freshclam" )
end

# Lookup /etc/autoclam.target
def getPositions
  # Check if File exists
  if File.exists?('/etc/autoclam.target')
    # File exists
    puts "[INFO] File exists\n[INFO] Loading targets"
  else
    # File does not exist
    puts "[FAIL] File does not exist"
    # Stuff to write
    data = "/bin\n/boot\n/opt\n/lib"
    # Create File
    File.open("/etc/autoclam.target", "w") do |f|
      f.write(data)
    end
    puts "[INFO] Wrote default configuration to /etc/autoclam.target"
  end
end

# Start scan on targets
def scan

end

# Programm core
checkRoot
runUpdate
getPositions
puts "Ready."
