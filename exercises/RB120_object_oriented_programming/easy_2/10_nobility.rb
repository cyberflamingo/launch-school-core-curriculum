module Gaitable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  attr_reader :name

  include Gaitable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Gaitable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Gaitable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title

  include Gaitable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} #{super()}"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
puts mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
puts kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
puts flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"

puts byron.name
# => "Byron"
puts byron.title
# => "Lord"
