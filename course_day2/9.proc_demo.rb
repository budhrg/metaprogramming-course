# Proc:  Blocks of code that have been bound to a set of local variables.
#        Once bound, the code may be called in different contexts and still
#        access those variables.

puts '==========> 1. Proc Demo'
def gen_times(factor)
  Proc.new {|n| n*factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

p times3.call(12)
p times5.call(5)




puts "==========> 2. transform! method written as Proc"
class Array
  def transform!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end
array = [1, 2, 3, 4]
puts "Before transform! : #{array.inspect}"
array.transform!(Proc.new { |n| n**2 })
puts "After transform! : #{array.inspect}"




puts '==========> 3. transform! : Advanced way'
array = [1, 2, 3, 4]
square = Proc.new {|n| n*2 }
cube = Proc.new {|n| n*3 }
puts "Before transform! : #{array.inspect}"
array.transform!(square)
puts "After transform! as square : #{array.inspect}"

array = [1, 2, 3, 4]
puts "Before transform! : #{array.inspect}"
array.transform!(cube)
puts "After transform! as cube: #{array.inspect}"

