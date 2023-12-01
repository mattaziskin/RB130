def step(start, final, step)
  number = start
  until number > final
    yield(number)
    number += step
  end
  nil
end



step(1, 10, 3) { |value| puts "value = #{value}" }

=begin
value = 1
value = 4
value = 7
value = 10
=end