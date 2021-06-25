class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other) # assert_equal fails without this method
    other.is_a?(Car) && name == other.name
  end
end
