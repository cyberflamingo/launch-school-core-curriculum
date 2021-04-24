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

# `@@cats_count` is a class variable. As defined here, it counts the number of
# times objects were instancialized.

puts Cat.cats_count # => 0

kittyA = Cat.new('typeA')
kittyB = Cat.new('typeB')
kittyC = Cat.new('typeC')

puts Cat.cats_count # => 3
