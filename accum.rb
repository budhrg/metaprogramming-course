# encoding: utf-8
# Accum method
class Array
  def accum(*args)
    result = args.last || 0
    result = 0 if args.first.is_a?(Symbol) && (args.length == 1)
    each do |n|
      if args.first.is_a?(Symbol)
        result = result.send(args.first, n)
      else
        result = yield(result, n) if block_given?
      end
    end
    result
  end
end

puts [1, 2, 3, 4].accum { |sum, n| sum + n }
puts [1, 2, 3, 4].accum(10) { |sum, n| sum + n }
puts [1, 2, 3, 4].accum(:+)
puts [1, 2, 3, 4].accum(:+, 10)
