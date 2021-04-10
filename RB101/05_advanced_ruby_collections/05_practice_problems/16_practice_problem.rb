require 'securerandom'

def hex_gen(length)
  Array.new(length) { [*"a".."f", *"0".."9"].sample }.join
end

def uuid_creator
  uuid_sequence = [8, 4, 4, 4, 12]
  uuid_arr = []

  uuid_sequence.each do |seq|
    uuid_arr << hex_gen(seq)
  end

  uuid_arr.join("-")
end

p uuid_creator

p SecureRandom.uuid
