$:.unshift File.join(__dir__, "lib")
require 'debug'

#r2 = Ractor.new do
  #Ractor.yield nil
  #i = 0
  #loop do
    #if i % 100000 == 0
      #$stderr.puts i
    #end
    #i += 1
  #end
#end

#r2.take
def hi
  $stderr.puts "hi"
end

CONSTANT = Object.new
CONSTANT2 = 10
$global = 10

b = 1
r = Ractor.new do
  CONSTANT3 = 20
  $stderr.puts "in ractor 1"
  class MyClass
    def initialize(a)
      @a = a
    end

    def wow
      debugger
    end
  end
  my_obj = MyClass.new(10)
  my_obj.wow
  debugger
  a = 3
  c = 4
  d = 5
  hi
  e = 6
end

r3 = Ractor.new do
  $stderr.puts "in ractor 3"
  a = 16
  debugger
  nil
end

r.take
k = 9
debugger

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

#r2.take

