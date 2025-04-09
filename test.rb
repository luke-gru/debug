$:.unshift File.join(__dir__, "lib")
require 'debug'

b = 1
r = Ractor.new do
  $stderr.puts "in ractor"
  a = 3
  debugger
  c = 4
  d = 5
end

# This ractor needs to stop when it hits the 'debugger' in the other ractor
#r2 = Ractor.new do
  #loop do
    #$stderr.puts "looping!"
  #end
  
#end

#r2 = Ractor.new do
  #$stderr.puts "in ractor 2"
  #debugger
  #e = 5
#end

r.take
k = 9
debugger
#r2.take

