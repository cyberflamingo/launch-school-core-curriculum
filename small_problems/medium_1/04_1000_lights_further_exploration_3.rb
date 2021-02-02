def construct_phrase(numbers)
  sentence = numbers.map.with_index do |number, index|
    if index == numbers.length - 1
      "and #{number}"
    elsif index == numbers.length - 2
      "#{number} "
    else
      "#{number}, "
    end
  end

  sentence.join
end

def statement(on, off)
  "lights #{construct_phrase(off)} are now off; #{construct_phrase(on)} are on"
end

def output_current(switches_bank, pass, max_lights)
  lights_on  = switches_bank
  lights_off = (1..max_lights).to_a - lights_on
  round = "Round #{pass}: "

  lights_state = case switches_bank.length
                 when max_lights then 'every light is turned on'
                 when 0          then 'every light is turned off'
                 else                 statement(lights_on, lights_off)
                 end

  puts round + lights_state
end

def switch_lights_state(switches_bank, pass, max_lights)
  pass.step(by: pass, to: max_lights) do |light|
    if switches_bank.include?(light)
      switches_bank.delete(light)
    else
      switches_bank.push(light)
    end
  end

  switches_bank.sort
end

def switch(lights)
  switches_bank = Array.new
  pass = 1

  loop do
    switches_bank = switch_lights_state(switches_bank, pass, lights)
    output_current(switches_bank, pass, lights)

    break if pass >= lights
    pass += 1
  end

  switches_bank
end

p switch(5) == [1, 4]
p switch(10) == [1, 4, 9]
# p switch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196,
#                    225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676,
#                    729, 784, 841, 900, 961]
