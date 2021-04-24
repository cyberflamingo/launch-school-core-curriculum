class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# `self` in the name of the `cats_count` method means this is a class method.
# `self` refer to the class itself.

puts Cat.cats_count # => 0
