# frozen_string_literal: true

# Ask the user for two numbers
# Ask the user for an operation to perform
# Perform the operation on the two numbers
# Output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts('Welcome to Calculator!')

Kernel.puts("What's the first Number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second Number?")
number2 = Kernel.gets().chomp()

Kernel.puts('What operation would you like to perform? 1) add 2) subtract 3) '\
            'multiply 4) divide')
operator = Kernel.gets().chomp()

result = if operator == '1'
           number1.to_i() + number2.to_i()
         elsif operator == '2'
           number1.to_i() - number2.to_i()
         elsif operator == '3'
           number1.to_i() * number2.to_i()
         else
           number1.to_f() / number2.to_f()
         end

Kernel.puts("The result is #{result}")
