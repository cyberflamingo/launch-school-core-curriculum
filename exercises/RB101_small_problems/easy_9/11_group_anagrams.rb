def group_anagrams(words_list)
  lists = []

  words_list.each do |reference_word|
    next if lists.flatten.include?(reference_word)

    anagrams_list = words_list.select do |word|
      word.chars.sort == reference_word.chars.sort
    end

    lists << anagrams_list
  end

  display_anagrams(lists)
end

def display_anagrams(anagrams_lists)
  anagrams_lists.each do |list|
    puts '-' * 80
    p list
  end
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

group_anagrams(words)
