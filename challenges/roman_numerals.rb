=begin

Problem
  Input an integer and output a string representation in roman numerals
Examples
  Provided

Data Structure




=end


class RomanNumeral
  attr_reader :num
  NUMERALS = {
    0 => "",
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    20 => "XX",
    30 => "XXX",
    40 => "XL",
    50 => "L",
    60 => "LX",
    70 => "LXX",
    80 => "LXXX",
    90 => "XC",
    100 => "C",
    200 => "CC",
    300 => "CCC",
    400 => "CD",
    500 => "D",
    600 => "DC",
    700 => "DCC",
    800 => "DCCC",
    900 => "CM",
    1000 => "M",
    2000 => "MM",
    3000 => "MMM"
  }
  def initialize(num)
    @num = num
  end

  def to_roman
    roman = ''
    get_places.each do |place|
      roman << NUMERALS[place]
    end
    roman
  end

  def get_places
    multiplier = 1
    output = []
    num.digits.each do |n|
      output << multiplier * n
      multiplier *= 10
    end
    output.reverse
  end
end

a = RomanNumeral.new(1024)

p a.to_roman

