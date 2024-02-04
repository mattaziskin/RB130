class CustomSet

  def initialize(array=[])
    @collection = array.uniq.sort
  end

  def empty?
    collection.empty?
  end

  def contains?(target)
    collection.include?(target)
  end

  def subset?(other)
    collection - other.collection == []
  end

  def disjoint?(other)
    collection + other.collection == (collection + other.collection).uniq
  end

  def eql?(other)
    collection - other.collection == [] && other.collection - collection == []
  end

  def ==(other)
    collection == other.collection
  end

  def add(num)
    collection << num unless collection.include?(num)
    collection.sort!
    self
  end

  def intersection(other)
    CustomSet.new(collection.select { |el| other.collection.include?(el) })
  end

  def difference(other)
    CustomSet.new(collection.select { |el| !other.collection.include?(el) })
  end

  def union(other)
    CustomSet.new(collection + other.collection)
  end

  protected

  attr_accessor :collection

end