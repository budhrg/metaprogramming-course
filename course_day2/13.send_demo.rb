# send: Call method dynamically
puts '==========> 1. Static Approach'
class Behavior
  def eat
    puts "I am eating"
  end

  def sing
    puts "I am singing"
  end
end

class Person1
  def initialize(behavior)
    @behavior = behavior
  end

  def do(action)
    if action == 'eat'
      @behavior.eat
    elsif action == 'sing'
      @behavior.sing
    else
      raise NoMethodError.new(action)
    end
  end
end

person = Person1.new(Behavior.new)
person.do("eat")
person.do("sing")
begin
  person.do("dance")
rescue
  puts "Can't dance :( "
end


# Dynamic Approach
puts '==========> 2. Dynamic Approach'
class Person2
  def initialize(behavior)
    @behavior = behavior
  end

  def do(action)
    @behavior.send(action)
  end
end
person = Person2.new(Behavior.new)
person.do("eat")
person.do("sing")
begin
  person.do("dance")
rescue
  puts "Can't dance :( "
end

puts '==========> 3. Another example: Relay Messages'
# Relay Messages
# The relay method should return a new array,
# but with all elements converted to data_type.
def relay(arr, data_type)
  arr.map { |s| s.send("to_#{data_type}") }
end

arr = [1, 2, 3, 5]
puts "Array #{arr.inspect} to string array"
p relay(arr, 's')

puts "Array #{arr.inspect} to float array"
p relay(arr, 'f')
