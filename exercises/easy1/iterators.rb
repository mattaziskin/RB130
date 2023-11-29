=begin

don't use any, all none, or one methods

=end


def any?(array)
  return false if array.empty?
  array.each do |el|
    return true if yield(el)
  end
  false
end


=begin
p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
=end


def all?(array)
  array.each {|el| return false unless yield(el) }
  true
end

=begin

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

=end

def none?(array)
  array.each {|el| return false if yield(el) }
  true
end

=begin
p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
=end

def one?(array)
  array.select {|el| yield(el) }.size == 1
end
=begin
p one?([1, 3, 5, 6]) { |value| value.even? } == true   # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? } == false  # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true # -> true
p one?([1, 3, 5, 7]) { |value| true } == false          # -> false
p one?([1, 3, 5, 7]) { |value| false } == false         # -> false
p one?([]) { |value| true } == false                    # -> false

=end
