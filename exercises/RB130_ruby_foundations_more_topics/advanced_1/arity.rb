# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

puts '-' * 80

# Group 2
# rubocop:disable Style/Lambda
my_lambda = lambda { |thing| puts "This is a #{thing}." }
# rubocop:enable Style/Lambda
my_second_lambda = ->(thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_second_lambda.call('flamingo')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

puts '-' * 80

# Group 3
def block_method_1(_animal)
  yield if block_given?
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
block_method_1('seal')

puts '-' * 80

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}." }
