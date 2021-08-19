=begin

PEDAC
=====

(Understand the) Problem
------------------------

-  Inputs: a letter from the alphabet
-  Output: a diamond shape from A to given letter at its widest point, and back

---

**Problem Domain:**
Geometry, math

---

**Implicit Requirements:**
- Minimum 1 letter, max 26
- The same letter is printed only 2 times except A which is printed 1 time

---

**Clarifying Questions:**

1. Is there space on the rightmost side? (Yes)
2. Assume we are given an English letter? (Yes)

---

**Mental Model:**
Given a letter from the English alphabet, create a symmetric diamond shape
(share shape) with its top half in ascending alphabet order and bottom half in
descending alphabet order.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**
See test file

Data Structure
--------------

Array of strings representing one line of the diamond shape.

---

Algorithm
---------

1.  Initialize a constant ALPHABET with all letter of alphabet saved as elements
    of an array
2.  Initialize new local variable midway as the index of ALPHABET for the given
    letter
3.  Initialize new local variable width as (midway * 2) + 1
4.  Initialize new local variable diamond to empty string
5.  Initialize new local variable middle_space to 1
6.  Iterate from zero upto midway
  1.  If first loop:
    1.  Return 'A' center padded by width
  2.  Else:
    1.  Join current letter + a whitespace * middle_space + current letter
    2.  Return above padded by width
  3.  Increment middle_space by 2

7.  Decrement middle_space by 2
8.  Iterate from midway - 1 downto zero
  1.  If last loop:
    1.  Return 'A' center padded by width
  2.  Else:
    1.  Join current letter + a whitespace * middle_space + current letter
    2.  Return above padded by width
  3.  Decrement middle_space by 2
9.  Return diamond joined with "\n"

Code
----

Time: 01:18:26.4

=end

ALPHABET = ('A'..'Z').to_a

class Diamond
  def initialize(letter)
    @diamond = []
    @midway = ALPHABET.index(letter)
    @width = (@midway * 2) + 1
    @middle_space = 1
  end

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    raw_diamond = new(letter)
    raw_diamond.make_diamond
  end

  def make_diamond
    top_half
    bottom_half

    diamond.join("\n") + "\n"
  end

  private

  attr_accessor :diamond, :middle_space
  attr_reader :midway, :width

  def top_half
    0.upto(midway) do |index|
      make_line(index)

      self.middle_space += 2 unless index == 0
    end
  end

  def bottom_half
    self.middle_space -= 4

    (midway - 1).downto(0) do |index|
      make_line(index)

      self.middle_space -= 2 unless index == 0
    end
  end

  def make_line(i)
    let = ALPHABET[i]

    diamond << if i == 0
                 let.center(width)
               else
                 (let + (' ' * middle_space) + let).center(width)
               end
  end
end
