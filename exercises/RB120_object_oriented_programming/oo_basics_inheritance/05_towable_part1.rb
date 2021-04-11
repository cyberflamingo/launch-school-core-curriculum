module Towable
  def tow
    puts 'I can tow a trailer!'
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow
