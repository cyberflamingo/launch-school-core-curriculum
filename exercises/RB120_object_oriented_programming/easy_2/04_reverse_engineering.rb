class Transform
  def initialize(string)
    @string = string
  end

  def uppercase
    string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end

  private

  attr_reader :string
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
