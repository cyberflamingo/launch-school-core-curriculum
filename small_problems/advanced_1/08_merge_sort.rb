=begin

PEDAC
=====

(Understand the) Problem
------------------------

- Inputs:
  1. An array of one type of data (integers or strings)
- Outputs:
  1. A sorted array

**Problem Domain:**

Algorith

**Implicit Requirements:**

-  Array size does not have to be even
-  Sort order is Ruby classic sort order

**Clarifying Questions:**

1. Can I mutate the input array or not? (A: Whatever)

**Mental Model:**

Given an array, return a sorted array using the merge sort algorithm.

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

- Example 1
  - Inputs:
    1. [9, 5, 7, 1]
  - Outputs:
    1. [1, 5, 7, 9]
- Example 2
  - Inputs:
    1. [5, 3]
  - Outputs:
    1. [3, 5]

Data Structure
--------------

**Your Data Structure:**

An array

Algorithm
---------

**Your Algorith:**

. Return `array` if its size is 1
. Initialize local variable `divided_array` to the return value of
  `halvies(array)`
. ---

. Inside `halvies`
  . Return `array` if all its element are Arrays
  . Initialize local variable `half` to the half size of `array`
  . Recursively call `halvies` for the left and right part of array

Code
----

=end

def define_current_element(current_element)
  current_element.nil? ? Float::INFINITY : current_element
end

def merge(array1, array2)
  sorted_merged = Array.new
  index1 = 0
  index2 = 0
  array2 = [] if array2.nil?

  loop do
    element1 = define_current_element(array1[index1])
    element2 = define_current_element(array2[index2])

    if element1 < element2
      sorted_merged << element1
      index1 += 1
    else
      sorted_merged << element2
      index2 += 1
    end

    break if sorted_merged.size == (array1.size + array2.size)
  end

  sorted_merged
end

def recursively_divise(array)
  return [array] if array.size == 1

  half = array.size / 2
  recursively_divise(array[0...half]) + recursively_divise(array[half..-1])
end

def recursively_merge(array)
  return array[0] if array.size == 1

  intermediate_array = Array.new

  0.step(by: 2, to: array.size - 1) do |index|
    intermediate_array << merge(array[index], array[index + 1])
  end

  recursively_merge(intermediate_array)
end

def merge_sort(array)
  return array if array.size == 1

  array = recursively_divise(array)
  recursively_merge(array)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# Can't manage to do it with strings
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
