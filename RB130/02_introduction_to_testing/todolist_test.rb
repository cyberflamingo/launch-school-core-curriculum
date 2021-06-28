require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)

    @list_range = (-@list.size...@list.size).to_a
    @index = @list_range.sample
    @index_error = not_in_range_num(@list_range)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    assert_equal(@todos.first, @list.shift)
    assert_equal((@todos.size - 1), @list.size)
  end

  def test_pop
    assert_equal(@todos.last, @list.pop)
    assert_equal(@todos.size - 1, @list.size)
  end

  def test_done?
    assert_equal(false, @list.done?)

    @list.mark_all_done
    assert_equal(true, @list.done?)

    @list.mark_all_undone
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add('not a todo object')
    end
  end

  def test_shovel
    todo = Todo.new('Buy smartphone')
    @todos << todo
    @list << todo

    assert_equal(todo, @list.last)
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    todo = Todo.new('Buy smartphone')
    @todos << todo
    @list.add(todo)

    assert_equal(todo, @list.last)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert(@list.item_at(@index))
    assert_raises(IndexError) do
      @list.item_at(@index_error)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(@index)
    assert_equal(true, @list.item_at(@index).done?)
    assert_raises(IndexError) do
      @list.mark_done_at(@index_error)
    end
  end

  def test_mark_undone_at
    @list.mark_undone_at(@index)
    assert_equal(false, @list.item_at(@index).done?)
    assert_raises(IndexError) do
      @list.mark_undone_at(@index_error)
    end
  end

  def test_done!
    @list.done!
    assert_equal(true, @todos.all?(&:done?))
  end

  def test_remove_at
    assert_equal(@list.item_at(@index), @list.remove_at(@index))
    assert_equal(@todos.size - 1, @list.size)

    list_range = (-@list.size...@list.size).to_a
    index_error = not_in_range_num(list_range)

    assert_raises(IndexError) do
      @list.remove_at(index_error)
    end
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  private

  def not_in_range_num(range_to_exclude)
    num = rand(100)

    while range_to_exclude.include?(num)
      num = rand 100
    end

    num
  end
end
