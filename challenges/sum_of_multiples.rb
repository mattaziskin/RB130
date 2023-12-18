class SumOfMultiples
  attr_reader :multiples, :num

  def initialize(*multiples)
    @multiples = !multiples.empty? ? multiples : [3, 5]
  end

  def to(num)
    sum = 0
    (1...num).each do |number|
      multiples.each do |mult|
        if (number % mult).zero?
          sum += number
          break
        end
      end
    end
    sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end
end

h = SumOfMultiples.new(7, 8)

p h.multiples
