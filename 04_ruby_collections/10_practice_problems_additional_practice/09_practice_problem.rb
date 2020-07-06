words = "the flintstones rock"

words_list = words.split

titleize_list = words_list.map(&:capitalize)

titleize = titleize_list.join(' ')

p titleize
