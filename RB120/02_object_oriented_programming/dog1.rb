class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "Can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak    # => "bark!"
puts teddy.swim     # => "swimming!"

frank = Bulldog.new
puts frank.speak    # => "bark!"
puts frank.swim     # => "Can't swim!"
