SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.0304

puts 'Enter the length of the room in feets:'
room_length = gets.to_f

puts 'Enter the width of the room in feets:'
room_width = gets.to_f

area_square_feet = (room_length * room_width).round(2)
area_square_inches = (area_square_feet * SQFEET_TO_SQINCHES).round(2)
area_square_centimeters = (area_square_feet * SQFEET_TO_SQCM).round(2)

puts "The area of the room is #{area_square_feet} square feet " \
     "(#{area_square_inches} square inches or "                 \
     "#{area_square_centimeters} square centimeters)."
