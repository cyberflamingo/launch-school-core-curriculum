class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

puts Cube.new('50').volume
