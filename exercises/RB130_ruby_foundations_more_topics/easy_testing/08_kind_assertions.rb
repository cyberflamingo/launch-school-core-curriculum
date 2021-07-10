require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_instance_of_numeric
    value = 9
    assert_kind_of(Numeric, value)

    value = 0.4
    assert_kind_of(Numeric, value)
  end
end
