=begin

Algorithm
---------

. Initialize a local variable `sorted_merged` to an array object
. Initialize a local variable `index1` to an integer `0`
. Initialize a local variable `index2` to an integer `0`
. Create a `loop`
  . Initialize a local variable `num1` to `array1[index1]`
  . Initialize a local variable `num2` to `array2[index2]`
  . Check for nil and replace by `Float::INFINITY` for both `num1` and `num2`
  . In a `if` condition, check which is bigger than the other
  . Add the smaller number to `sorted_merged` and increment corresponding index
  . `break` when `sorted_merged` is the same size as `array1` + `array2`
. Return `sorted_merged`

Time = 27:37

=end

def define_current_number(current_num)
  current_num.nil? ? Float::INFINITY : current_num
end

def merge(array1, array2)
  sorted_merged = Array.new
  index1 = 0
  index2 = 0

  loop do
    num1 = define_current_number(array1[index1])
    num2 = define_current_number(array2[index2])

    if num1 < num2
      sorted_merged << num1
      index1 += 1
    else
      sorted_merged << num2
      index2 += 1
    end

    break if sorted_merged.size == (array1.size + array2.size)
  end

  sorted_merged
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
