class CustomSet
  attr_accessor :set

  def initialize(set=[])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.any?(num)
  end

  def subset?(other)
    (set - other.set).empty?
  end

  def disjoint?(other)
    set - other.set == set && other.set - set == other.set
  end

  def eql?(other)
    set - other.set == [] && other.set - set == []
  end

  def add(el)
    set << el unless set.include?(el)
    self
  end

  def ==(other)
    set == other.set
  end

  def intersection(other)
    CustomSet.new(set.select { |el| other.set.include?(el) })
  end

  def difference(other)
    CustomSet.new(set-other.set)
  end

  def union(other)
    CustomSet.new((set + other.set).uniq.sort)
  end
end
set = CustomSet.new([1, 2, 4]).add(3)
expected = CustomSet.new([1, 2, 4, 3])
p set
p expected

p set == expected