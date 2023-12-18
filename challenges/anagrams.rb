class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    array.select do |option|
      word.chars.sort == option.downcase.chars.sort && word != option.downcase
    end
  end
end
