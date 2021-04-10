class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new

# Further Exploration
kitty.class.generic_greeting

=begin

Calling `class` on instance `kitty` gives the class `kitty` was intanciated
from, in the case `Cat` class. Once this class in returned, we can now call
`generic_greeting` on it. As `generic_greeting` is a class method of `Cat`, it
can be called on `Cat`.

=end
