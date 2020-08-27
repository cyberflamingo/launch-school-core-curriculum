# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. One or more command in string format
* Output:
  1. One or more execution based on the command

---

*Problem Domain:*
Computer science

---

*Implicit Requirements:*
* Know what a stack is
* Can take one or more command in a row
* Commands are well-formated
* `n` number can be either positive or negative
* All operations are performed on the `stack`

---

*Clarifying Questions:*

1. Is there a limit to the number of operations within a line? (No)
2. Is there a prefered way to print the stack? (`print`)

---

*Mental Model:*
Create a program that takes one or several operations in string format and
perform the command in order on the array `stack`, with the help of the
current value `register` initialized to zero.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 'PRINT'
  * Output
    1. '0' (at initialization time)
* Example 2
  * Inputs:
    1. '5 PUSH 3 MULT PRINT'
  * Output
    1. 15

---

== Data Structure

*Your Data Structure:*
An array `stack`

---

== Algorithm

*Your Algorith:*
$MAIN
1. Initialize `register = 0` and `stack = []`
2. Take the input command and split it by space
3. Iterate over the array of split commands
  1. Using a `case` statement, send command to appropriate method
2. End

$REGISTER_N
1. Add `n` to `register`
2. Return `register`

$PUSH
1. Push `register` to `stack`
2. Return `stack`

$ADD
1. Pop `stack` into `register`
2. Return `register`

$SUB
1. Pop `stack`
2. Subtrack popped value to `register`
3. Store the result to `register`
4. Return `register`

$MULT
1. Pop `stack`
2. Multiply popped value to `register`
3. Store the result to `register`
4. Return `register`

$DIV
1. Pop `stack`
2. Divide popped value to `register`
3. Store the result (integer) to `register`
4. Return `register`

$MOD
1. Pop `stack`
2. Divide popped value to `register`
3. Store the remainder (integer) to `register`
4. Return `register`

$POP
1. Pop `stack`
2. Use popped value as `register`
3. Return `register`

$PRINT
1. Print `register`

== Code

=end

def register_n(operation)
  operation
end

def push(stack, register)
  stack.push(register)
end

def add(stack, register)
  register + stack.pop
end

def sub(stack, register)
  register - stack.pop
end

def mult(stack, register)
  register * stack.pop
end

def div(stack, register)
  register / stack.pop
end

def mod(stack, register)
  _, register = register.divmod(stack.pop)
  register
end

def pop(stack)
  stack.pop
end

def print(register)
  puts register
end

def minilang(entered_operations)
  register = 0
  stack = []

  entered_operations.split.each do |ope|
    if    ope.to_i.to_s == ope then register = register_n(ope.to_i)
    elsif ope == 'PUSH'        then            push(stack, register)
    elsif ope == 'ADD'         then register = add(stack, register)
    elsif ope == 'SUB'         then register = sub(stack, register)
    elsif ope == 'MULT'        then register = mult(stack, register)
    elsif ope == 'DIV'         then register = div(stack, register)
    elsif ope == 'MOD'         then register = mod(stack, register)
    elsif ope == 'POP'         then register = pop(stack)
    elsif ope == 'PRINT'       then            print(register)
    else  puts 'ERROR'
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
