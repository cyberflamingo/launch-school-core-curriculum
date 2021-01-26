def output_description(round, lights)
  if lights.values.all?(true)
    puts "round #{round}: every light is turned on"
  elsif lights.values.all?(false)
    puts "round #{round}: every light is turned off"
  else
    on = lights_state(lights, true)
    off = lights_state(lights, false)

    puts "round #{round}: lights #{off.join(', ')} are now off; " \
         "#{on.join(', ')} are on"
  end
end

def initialize_lights_state(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = true }
  output_description(1, lights)

  lights
end

def lights_state(lights, state)
  lights.select { |_key, value| value == state }.keys
end

def switch(number_of_lights)
  lights = initialize_lights_state(number_of_lights)
  round = number_of_lights

  2.upto(round) do |outer_index|
    inner_index = outer_index

    loop do
      break if inner_index > round

      lights[inner_index] = !lights[inner_index]
      inner_index += outer_index
    end

    output_description(outer_index, lights)
  end

  lights_state(lights, true)
end

p switch(5) == [1, 4]
p switch(10) == [1, 4, 9]
p switch(14) == [1, 4, 9]
