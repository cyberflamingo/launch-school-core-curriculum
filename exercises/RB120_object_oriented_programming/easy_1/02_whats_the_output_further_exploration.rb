class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name  # => "42"
puts fluffy       # => My name is 42.
puts fluffy.name  # => "42"
puts name         # => 43
