require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_instance_of_numeric
    value = Numeric.new

    assert_instance_of(Numeric, value)
  end
end
