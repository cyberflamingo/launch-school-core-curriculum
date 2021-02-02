=begin

PEDAC
=====

(Understand the) Problem
------------------------

- Inputs:
  1. A number of switch `n`
- Outputs:
  1. An array of numbers representing each lights on

**Problem Domain:**

Algebra

**Implicit Requirements:**

- `n` is >= 1
- Swtiches only have two states (ON and OFF)

**Clarifying Questions:**

1. N/A

**Mental Model:**

Write a method that will calculate the number of switches ON after given `n`
repetitions, by switching ON/OFF by `n` for each passage.

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

- Example 1
  - Inputs:
    1. 5
  - Outputs:
    1. [1, 4]
- Example 2
  - Inputs:
    1. 10
  - Outputs:
    1. [1, 4, 9]
- Example 3
  - Inputs:
    1. 1000
  - Output
    1. [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196,
        225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676,
        729, 784, 841, 900, 961]

Data Structure
--------------

**Your Data Structure:**

Array of number representing the switches

Algorithm
---------

**Your Algorith:**

. Initialize a local variable `switches_bank` to a new array object
. Initialize a local variable `pass` to `1`
. Create a loop which break after `n` pass
  . Call method `switch_lights_state` and save the return value in
    `switches_bank`
. Return `switches_bank`

Code
----

=end

def switch_lights_state(switches_bank, pass, max_lights)
  pass.step(by: pass, to: max_lights) do |light|
    if switches_bank.include?(light)
      switches_bank.delete(light)
    else
      switches_bank.push(light)
    end
  end

  switches_bank
end

def switch(lights)
  switches_bank = Array.new
  pass = 1

  loop do
    switches_bank = switch_lights_state(switches_bank, pass, lights)

    break if pass >= lights
    pass += 1
  end

  switches_bank
end

p switch(5)    == [1, 4]
p switch(10)   == [1, 4, 9]
p switch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196,
                   225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676,
                   729, 784, 841, 900, 961]
