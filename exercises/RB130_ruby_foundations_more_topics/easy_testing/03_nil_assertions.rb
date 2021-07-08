require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_value_nil
    value = nil

    assert_nil value
  end
end
