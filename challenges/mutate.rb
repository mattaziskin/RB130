class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    short, long = find_short(other_strand)[0], find_short(other_strand)[1]
    short.chars.each_index do |idx|
        distance += 1 if short[idx] != long[idx]
    end
    distance
  end

  def find_short(other_strand)
    if strand.size > other_strand.size
        short = other_strand
        long = strand
    else
        short = strand
        long = other_strand
    end
    [short, long]
  end
end

g = DNA.new('aaa')
p g.hamming_distance('bb')