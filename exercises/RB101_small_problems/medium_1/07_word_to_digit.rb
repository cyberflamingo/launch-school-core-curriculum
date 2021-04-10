DIGITS = %w(zero one two three four five six seven eight nine)

def word_to_digit(string)
  DIGITS.each_with_index do |digit, index|
    string.gsub!(/\b#{digit}\b/, index.to_s)
  end

  string
end

p word_to_digit('Please call the freight at five five five one two three ' \
                'four. Thanks.') == 'Please call the freight at 5 5 5 1 2' \
                ' 3 4. Thanks.'
