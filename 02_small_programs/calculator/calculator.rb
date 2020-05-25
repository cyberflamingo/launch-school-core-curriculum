# frozen_string_literal: true

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'ja'

# Ask the user for two numbers
# Ask the user for an operation to perform
# Perform the operation on the two numbers
# Output the result

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(val)
  val.to_i.to_s == val
end

def float?(val)
  val.to_f.to_s == val
end

def number?(input)
  integer?(input) || float?(input)
end

def valid_number?(num)
  # Regex matching only digit characters
  /\A[+-]?\d+\Z/.match(num)
end

def operation_to_message(op)
  op_word = case op
            when '1'
              'op1'
            when '2'
              'op2'
            when '3'
              'op3'
            when '4'
              'op4'
            end

  op_word
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('greating')
puts " #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt('number_1')
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt('number_error')
    end
  end

  number2 = ''
  loop do
    prompt('number_2')
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt('number_error')
    end
  end

  # Should remove 4) if number2 is 0
  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('operator_error')
    end
  end

  if LANGUAGE == 'ja'
    prompt('operation_message')
    prompt(operation_to_message(operator))
  else
    prompt(operation_to_message(operator))
    prompt('operation_message')
  end

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt('result')
  puts result.to_s

  prompt('again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('thanks')
