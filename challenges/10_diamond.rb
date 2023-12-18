=begin
Top and bottom lines will be identical with only 1 letter
middle lines will have two letters
  I need to track outside and inside spaces
  true middle has only spaces in between
  remove 2 outside lines (1 on each side) add 2 to middle
  total spaces equal to target letter idx + 1
=end

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    letters = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    edge = ALPHABET.index(letter) - 1
    middle = 1
    full_construct(letter, letters, edge, middle)
  end

  def self.full_construct(letter, letters, edge, middle)
    output = ''
    letters.each_with_index do |let, idx|
      if let == 'A'
        output << construct_cap(letter)
      elsif idx < ALPHABET.index(letter)
        output << construct_middle(let, edge, middle)
        edge -= 1
        middle += 2
      else
        output << construct_middle(let, edge, middle)
        edge += 1
        middle -= 2
      end
    end
    output
  end

  def self.construct_cap(letter)
    ends = (' ' * ALPHABET.index(letter))
    "#{ends}A#{ends}\n"
  end

  def self.construct_middle(let, edge, middle)
    "#{' ' * edge}#{let}#{' ' * middle}#{let}#{' ' * edge}\n"
  end
end

p Diamond.make_diamond('A')
puts Diamond.make_diamond('C')
