class Scrabble
  attr_reader :word

  SCORES = {
    1 => %w[a e i o u n l r s t],
    2 => %w[d g],
    3 => %w[b c m p],
    4 => %w[f h v w y],
    5 => %w[k],
    8 => %w[j x],
    10 => %w[q z]
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    score = 0
    return 0 unless word.instance_of?(String)

    word.downcase.chars.each do |char|
      SCORES.each_key do |key|
        score += key if SCORES[key].include?(char)
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

hello = Scrabble.new('Hello')
p hello.score
