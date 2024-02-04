require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
end

  def test_last
    assert_equal(@todo3, @list.last)
end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
end

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert(@list.done?)
end

  def test_add_raise_error
    assert_raises(TypeError) { @list << 3 }
    assert_raises(TypeError) { @list.add 3 }
    assert_raises(TypeError) { @list << 'g' }
end

  def test_add
    @list << (Todo.new("Go To Sleep"))
    @list << Todo.new("Say Hi")
    assert_equal(5, @list.size)
    assert_equal("Say Hi", @list.last.title)
  end

  def test_add_alias
    new_todo = Todo.new("Go to Park")
    @list.add new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    @list.mark_done_at(2)
    assert(@list.last.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(false,@todo1.done?)
    assert_equal(false,@todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(4) }
    @list.done!
    @list.mark_undone_at(2)
    assert_equal(false, @todo3.done?)
    assert_equal(true,@todo1.done?)
    assert_equal(true,@todo2.done?)
  end

  def test_done!
    @list.done!
    assert(@list.to_a.all? {|todo| todo.done? })
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
    assert(@list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {@list.remove_at(4)}
    @list.remove_at(1)
    assert_equal(2, @list.size)
    assert_equal(@todo3, @list.last)
  end

  def test_to_s
     output = <<~OUTPUT.chomp
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
  OUTPUT

  assert_equal(output, @list.to_s)
end

  def test_to_s_one_done
    @list.mark_done_at(1)
     output = <<~OUTPUT.chomp
  ---- Today's Todos ----
  [ ] Buy milk
  [X] Clean room
  [ ] Go to gym
  OUTPUT

  assert_equal(output, @list.to_s)
end

  def test_to_s_all_done
    @list.done!
     output = <<~OUTPUT.chomp
  ---- Today's Todos ----
  [X] Buy milk
  [X] Clean room
  [X] Go to gym
  OUTPUT

  assert_equal(output, @list.to_s)
end

  def test_each
    @list.mark_all_undone
    @list.each { |el| el.done! }
    assert(@list.done?)
end

  def test_each_return
    assert_equal(@list, @list.each)
    assert_equal(@list, @list.each { |el| puts el })
end

  def test_select
    @list.mark_all_undone
    @output = @list.select { |el| el.done? }
    assert_instance_of(TodoList, @output)
    assert_equal([],@output.to_a)
  end
end