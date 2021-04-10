# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. An array of two or more sortable objects
* Output:
  1. The same array, sorted (mutated) according to the bubble sort algorithm

---

*Problem Domain:*
Sorting algorithm

---

*Implicit Requirements:*
How the bubble sort algorithm works.

---

*Clarifying Questions:*

1. Are the object always sortable? (yes)

---

*Mental Model:*
Create a method that sort the given list of two or more objects based on the
bubble sort algorithm. The result must be a mutation of the given array.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. [5, 3]
  * Output
    1. [3, 5]
* Example 2
  * Inputs:
    1. %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  * Output
    1. %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

---

== Data Structure

*Your Data Structure:*
The passed array, as it needs to be mutated per the requirement.

---

== Algorithm

*Your Algorith:*
1. Initialize a `swapped` flag to false
2. Loop from 0 to length of array
  1. For each loop, check if the current argument is greater than next argument
    1. If true, swap them (with a parallel assignment)
    2. Flip `swapped` to true
  2. Break the loop when `swapped` is false
3. Return the original array, now sorted

== Code

=end

def bubble_sort!(list)
  list_size = list.size

  loop do
    swapped = false
    i = 1

    while i < list_size
      if list[i - 1] > list[i]
        list[i - 1], list[i] = list[i], list[i - 1]
        swapped = true
      end
      i += 1
    end

    break if swapped == false
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
