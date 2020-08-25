def initialize_lights_state(number_of_lights)
  lights_state = Hash.new
  1.upto(number_of_lights) { |number| lights_state[number] = true }

  lights_state
end

def lights_on(lights_state)
  lights_state.select { |_key, value| value == true }.keys
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
