class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza class has an instance variable. Instance variable are recognizable
# thanks to the `@` symbol.
# We can also call method `instance_variables` on a new instance of each class
# to check their instance variables.

p Fruit.new('pineapple').instance_variables
p Pizza.new('pineapple').instance_variables
