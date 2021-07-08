require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_value_odd
    value = 3

    assert value.odd?, 'not odd'
    assert_equal(true, value.odd?)
  end
end
