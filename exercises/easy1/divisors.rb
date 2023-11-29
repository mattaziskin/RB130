=begin
Write a method that returns a list of all of the divisors of the positive
integer passed in as an argument. The return value can be in any sequence you
wish.
=end

def divisors(num)
  return [1] if num == 1
  output = []
  starter = 1
  until starter > num
  output << starter if ((num % starter) == 0)
  starter += 1
 end
 output
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute