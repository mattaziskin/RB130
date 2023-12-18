class Octal
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if string.chars.any?(/[^0-7]/)

    sum = 0
    string.reverse.each_char.with_index do |char, idx|
      sum += char.to_i * 8**idx
    end
    sum
  end
end

h = Octal.new('233')
p h.to_decimal