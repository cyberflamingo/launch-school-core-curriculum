flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

starts_with_be = flintstones.find_index do |v|
  v.start_with?("Be")
end

p starts_with_be
