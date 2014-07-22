# Callback invoked whenever the receiver is included
# in another module or class

module A
  def self.included(mod_or_class)
    puts "#{self} included in #{mod_or_class}"
  end
end

module Foo
  include A
end

class Bar
  include A
end
