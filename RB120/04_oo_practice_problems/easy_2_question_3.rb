module Taste
  def flavor(flavor)
    puts flavor.to_s
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

tabasco = HotSauce.new
puts tabasco.flavor('spicy')

orange = Orange.new
puts orange.flavor('bitter')

# HotSauce/Orange class -> Taste module

p tabasco.class.ancestors
p orange.class.ancestors
