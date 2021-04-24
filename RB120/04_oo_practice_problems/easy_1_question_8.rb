class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# `self` here refer to the instance object. It needs to be called
# otherwise Ruby thinks we are initializing a new local variable.
