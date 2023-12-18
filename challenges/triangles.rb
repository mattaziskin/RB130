=begin
Within constructor call a method that calls up to 4 methods within it
returning invalid or triangle type
If invalid raise a custom error?


=end
class Triangle
  attr_reader :kind

  def initialize(s1,s2,s3)
    @sides = [s1,s2,s3].sort
    raise ArgumentError if @sides.any?{|side| side <= 0 }
    @kind = kind
  end

  def kind
    if invalid?
      raise ArgumentError
    elsif equilateral?
      return "equilateral"
    elsif isosceles?
      return "isosceles"
    elsif scalene?
      return "scalene"
    end
  end

  private

  def invalid?
    @sides[0] + @sides[1] <= @sides[2]
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    @sides.uniq.size == 2
  end

  def scalene?
    @sides.uniq.size == 3
  end
end

bad = Triangle.new(1,1,1)