require 'pry'

def initialize_lights_state(number_of_lights)
  # Use an array instead of a hash
  # Add +1 to account for 0 indexed array
  lights_state = Array.new(number_of_lights + 1, true)

  lights_state
end

def lights_on(lights_state)
  lights_on = []

  lights_state.select.with_index do |v, i|
    lights_on << i if v == true && i != 0 # Do not count index 0
  end

  lights_on
end

def switch(number_of_lights)
  lights_state = initialize_lights_state(number_of_lights)
  round = number_of_lights

  2.upto(round) do |outer_index|
    inner_index = outer_index

    loop do
      break if inner_index > round

      lights_state[inner_index] = !lights_state[inner_index]
      inner_index += outer_index
    end
  end

  lights_on(lights_state)
end

p switch(5) == [1, 4]
p switch(10) == [1, 4, 9]
p switch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196,
                   225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676,
                   729, 784, 841, 900, 961]
