DIGITS = %w(zero one two three four five six seven eight nine)

def word_to_digit(string)
  DIGITS.each_with_index do |digit, index|
    string.gsub!(/\b#{digit}\b/i, index.to_s)
  end

  string.gsub!(/(\d)\s+/, '\1')
  string.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3')

  string
end

p word_to_digit('Please call the freight at FIVE Five 5  1 tWo  Three ' \
                'FOUR. Thanks.') == 'Please call the freight at 555123' \
                '4. Thanks.'

p word_to_digit('fIvE') == '5'

p word_to_digit('one two three four five six seven eight nine ' \
                'zero') == '(123) 456-7890'
