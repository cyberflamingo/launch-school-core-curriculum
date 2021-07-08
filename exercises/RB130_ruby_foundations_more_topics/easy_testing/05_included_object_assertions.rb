require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_empty_list
    list = ['uvw', 'xyz']

    assert_includes list, 'xyz'
  end
end
