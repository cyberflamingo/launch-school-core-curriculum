require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_value_downcase
    value = 'XYZ'

    assert_equal 'xyz', value.downcase
  end
end
