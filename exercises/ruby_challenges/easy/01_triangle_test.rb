require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '01_triangle'

class TriangleTest < Minitest::Test
  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal 'equilateral', triangle.kind
  end

  def test_larger_equilateral_equal_sides
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_exactly_two_sides_equal
    triangle = Triangle.new(10, 10, 2)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_equal_sides
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_equal_sides
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_no_equal_sides_descending
    triangle = Triangle.new(5, 4, 2)
    assert_equal 'scalene', triangle.kind
  end

  def test_small_triangles_are_legal
    triangle = Triangle.new(0.4, 0.6, 0.3)
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_is_illegal
    assert_raises(ArgumentError) do
      Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_is_illegal
    assert_raises(ArgumentError) do
      Triangle.new(3, 4, -5)
    end
  end

  def test_size_inequality_is_illegal
    assert_raises(ArgumentError) do
      Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_2
    assert_raises(ArgumentError) do
      Triangle.new(7, 3, 2)
    end
  end

  def test_size_inequality_is_illegal_3
    assert_raises(ArgumentError) do
      Triangle.new(10, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_4
    assert_raises(ArgumentError) do
      Triangle.new(1, 1, 2)
    end
  end
end
