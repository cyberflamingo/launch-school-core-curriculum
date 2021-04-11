class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'
