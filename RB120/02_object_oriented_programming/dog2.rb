module Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog
  include Animal

  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat
  include Animal

  def speak
    'meow!'
  end
end

arthur = Dog.new
puts arthur.run
puts arthur.swim
puts arthur.speak

felix = Cat.new
puts felix.jump
puts felix.speak
# puts felix.fetch # throw error
