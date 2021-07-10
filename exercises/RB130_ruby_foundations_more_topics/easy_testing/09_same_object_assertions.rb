require 'minitest/autorun'

class List
  def process
    self
  end
end

class MyTest < Minitest::Test
  def test_same_object
    list = List.new

    assert_same(list, list.process)
  end
end
