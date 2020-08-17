VOWELS = %w(A I U E O a i u e o)

def remove_vowels(arr)
  no_vowels = arr.map do |str|
    str.chars.reject { |char| VOWELS.include?(char) }.join
  end

  no_vowels
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
