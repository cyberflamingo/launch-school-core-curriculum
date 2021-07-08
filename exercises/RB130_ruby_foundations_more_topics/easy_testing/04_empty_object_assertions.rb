require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_empty_list
    list = []

    assert_empty list
  end
end
