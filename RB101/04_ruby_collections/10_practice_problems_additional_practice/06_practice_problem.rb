flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

fli = flintstones.map do |name|
  name[0, 3]
end

p fli
