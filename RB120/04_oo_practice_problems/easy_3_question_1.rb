class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # => "Hello"

hello = Hello.new
# hello.bye # => NoMethodError

hello = Hello.new
# hello.greet # => ArgumentError

hello = Hello.new
hello.greet("Goodbye") # => "Goodbye"

# Hello.hi # => NoMethodError
