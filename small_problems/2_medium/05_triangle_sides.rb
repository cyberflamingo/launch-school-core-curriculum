# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. 3 integers representing the three sides of a triangle
* Output:
  1. The type of triangle (or invalid if it's not a triangle)

---

*Problem Domain:*
Geometry

---

*Implicit Requirements:*
Knowing the following:
* equilateral All 3 sides are of equal length
* isosceles 2 sides are of equal length, while the 3rd is different
* scalene All 3 sides are of different length

Any other case is considered invalid.

---

*Clarifying Questions:*

N/A

---

*Mental Model:*
Write a program that takes three integer and return the type of triangle based
on thoses integers. Return invalid if conditions to create a valid triangle are
not respected.

---

== Examples / Test Cases / Edge Cases

*Examples:*

See below.

---

== Data Structure

*Your Data Structure:*
A array made of three sides of the triangle.

---

== Algorithm

*Your Algorith:*

$MAIN
1. Add the three sides to an array and sort from shortest to longest
2. Check if one of the side is 0
  1. Return :invalid if true
3. Check if arr[0] + arr[1] < arr[2]
  1. Return :invalid if true
4. Check if all value are equal length
  1. Return :equilateral if true
5. Check if second and third values are equal
  1. Return :isosceles if true
  2. Return :scalene otherwise

== Code

=end

def triangle(side1, side2, side3)
  triangle = [side1, side2, side3].sort

  if triangle.any?(0) || triangle[0] + triangle[1] < triangle[2]
    :invalid
  elsif triangle.uniq.length == 1
    :equilateral
  elsif triangle[1] == triangle[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
