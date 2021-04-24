class BeesWax
  attr_accessor :type # Add attribute accessors...

  def initialize(type)
    @type = type
  end

  # ... to replace those 2 methods...

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    # ... and we can now use variable without `@` symbol
    puts "I am a #{type} of Bees Wax"
  end
end
