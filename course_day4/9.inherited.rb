# inherited : Callback invoked whenever a subclass
#             of the current class is created.
# Class's method

class Foo
  def self.inherited(subclass)
    puts "New child: '#{subclass}'"
  end
end

class Bar < Foo
end

class Baz < Bar
end
