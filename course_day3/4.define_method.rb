# define_method demo

class A
  def foo
    puts "In Foo"
  end
  def create_method(name, &block)
    self.class.send(:define_method, name, &block)
  end
  define_method(:bar) { puts "In Bar" }
end
class B < A
  define_method(:call_foo, instance_method(:foo))
end

a = B.new
a.call_foo
a.bar
a.create_method(:fum) { puts "In fum inside #{self.to_s}" }
a.fum
