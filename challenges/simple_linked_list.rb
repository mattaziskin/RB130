class Element
  attr_reader :datum, :next

  def initialize(datum, next_el=nil)
    @data = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :list

  def initialize(list=[])
    @list = list
  end

  def push(element)
    list.unshift(Element.new(element, list[0]))
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def pop
    removed = list.pop
    removed.data
  end

  def peek
    return nil if list.empty?
    head.datum
  end

  def datum
    head.datum
  end

  def head
    list[0]
  end
end

list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    6.times { list.pop }

    p list