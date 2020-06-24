# frozen_string_literal: true

def palindromic_number?(num)
  num == num.to_s.reverse.to_i
end

p palindromic_number?(34_543) == true
p palindromic_number?(123_210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
