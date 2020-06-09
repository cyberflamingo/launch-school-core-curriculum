puts 'Enter the length of the room in meters:'
room_length = gets.chomp

puts 'Enter the width of the room in meters:'
room_width = gets.chomp

area_square_meter = room_length.to_i * room_width.to_i
area_square_feet = area_square_meter * 10.7639

puts "The area of the room is #{area_square_meter} square meters " \
     "(#{area_square_feet} square feet)."
