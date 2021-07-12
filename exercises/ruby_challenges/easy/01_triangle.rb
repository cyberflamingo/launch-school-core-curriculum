class Triangle
  attr_reader :kind

  def initialize(s1, s2, s3)
    check_validity([s1, s2, s3])
    @kind = find_kind([s1, s2, s3])
  end

  private

  def find_kind(sides)
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  def check_validity(sides)
    sum = sides.reduce(:*)
    negative_sides = sides.select(&:negative?)
    is_impossible = sides.min(2).reduce(:+) <= sides.sort.max

    if sum <= 0 || negative_sides.count > 0 || is_impossible
      raise ArgumentError, 'Impossible triangle'
    end
  end
end
