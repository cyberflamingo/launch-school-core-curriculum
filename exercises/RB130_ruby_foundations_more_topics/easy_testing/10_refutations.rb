require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_not_in_list
    list = ['uvw', 'abc']

    refute_includes(list, 'xyz')
  end
end
