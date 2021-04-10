SQMETERS_TO_SQFEET = 10.7639

puts 'Enter the length of the room in meters:'
room_length = gets.to_f

puts 'Enter the width of the room in meters:'
room_width = gets.to_f

area_square_meter = room_length * room_width
area_square_feet = area_square_meter * SQMETERS_TO_SQFEET

puts "The area of the room is #{area_square_meter} square meters " \
     "(#{area_square_feet} square feet)."
