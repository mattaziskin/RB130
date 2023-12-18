# frozen_string_literal: true

# Is this it?
class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(size)
    raise ArgumentError if size > series.length

    position = 0
    array = []
    until position + size > series.size
      array << [series[position..(position + size - 1)]]
      position += 1
    end
    number_conversion(array)
  end

  private

  def number_conversion(array)
    array.map do |subarray|
      subarray.map do |el|
        el.split('').map(&:to_i)
      end.flatten
    end
  end
end

series = Series.new('01234')
p series.slices(1) # [[0], [1], [2], [3], [4]]
p series.slices(2)
