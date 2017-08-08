#!/usr/bin/env ruby
puts "Welcome to AutoClam\n[INFO] Checking mashine with ClamAV"

targetList = Array.new

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
    targetList = File.foreach('/etc/autoclam.target').map { |line| line.split(' ') }
    puts "[INFO] Choosen targets: " + targetList.inspect
    return targetList
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
    exit
  end
end

# Start scan on targets
def runScan(targets)
  repeter = 0
  until repeter >= targets.length
    puts targets[repeter]
    repeter += 1
  end
end

# Programm core
checkRoot
runUpdate
runScan(getPositions)
puts "Ready."
