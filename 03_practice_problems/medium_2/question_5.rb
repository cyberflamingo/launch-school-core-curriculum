def mutate_with_rutabaga(object)
  object << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
mutate_with_rutabaga(my_string)
mutate_with_rutabaga(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
