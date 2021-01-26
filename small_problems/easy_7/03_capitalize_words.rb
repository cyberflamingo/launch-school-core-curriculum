def word_cap(string)
  capital_case = string.split(' ').each(&:capitalize!).join(' ')

  capital_case
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
