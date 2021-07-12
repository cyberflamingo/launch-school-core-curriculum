class Triangle
  attr_reader :kind

  def initialize(s1, s2, s3)
    check_for_side_error([s1, s2, s3])
    @side1 = s1
    @side2 = s2
    @side3 = s3
    @kind = find_kind([s1, s2, s3])
  end

  private

  def find_kind(sides)
    return 'equilateral' if sides.all?(sides[0])

    if sides.sort[0..1].reduce(:-).zero? || sides.sort[1..-1].reduce(:-).zero?
      return 'isosceles'
    end

    'scalene'
  end

  def check_for_side_error(sides)
    sum = sides.reduce(:*)
    negative = sides.select(&:negative?)
    is_impossible = sides.min(2).reduce(:+) <= sides.sort.max

    if sum <= 0 || negative.count > 0 || is_impossible
      raise ArgumentError, 'Impossible triangle'
    end
  end
end
