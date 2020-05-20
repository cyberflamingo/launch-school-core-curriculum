# 1. a method that returns the sum of two integers

## Casual

Given two integers.

Assign the first and the second integer to a new variable.

Return the value.


## Formal

```
START

# Given two integers "num1" and "num2"

SET $sum = $num1 + $num2

PRINT $sum

END
```


# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together 

## Casual

Given an array of strings

Create a new empty string.
Iterate through the array of strings one by one.
  - Add (concatenate) each string to the newly created string.

After iterating through the array, return the created string.

## Formal

```
START

# Given an array of strings "array"

SET $iterator = 0
SET $concat = empty string

WHILE $iterator <= length of $array
  SET $concat = string value in $array at position $iterator

  $iterator = $iterator + 0

PRINT $concat

END
```


# 3. a method that takes an array of integers, and returns a new array with every other element 

Assuming every other element starts at index 0 (0, 2, 4...).


## Casual

Given an array of integers.

Create a new empty array.
Iterate through the array of integers one by one.
  - If the integer is even
    - Add it to our new array
  - Otherwise, if its odd
    - Move to the next value in the array

At the end of the iteration, return the freshly updated array.


## Formal

```
START

# Given an array of integers "array"

SET $i = 0
SET $other_int = []

WHILE $i <= length of $array
  IF $i % 2 = 0
    SET add current value at index $i of $array into $other_int
  ELSE
    skip to next iteration $i

  $i = $i + 1

PRINT $other_int
END
```
