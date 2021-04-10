def madlib
  prompt('Enter a noun: ')
  noun = gets.chomp

  prompt('Enter a verb: ')
  verb = gets.chomp

  prompt('Enter an adjective: ')
  adjective = gets.chomp

  prompt('Enter an adverb: ')
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
  puts "If it #{adverb} #{verb}s like a #{noun}, then it probably is a " \
       "#{adjective} #{noun}."
end

def prompt(str)
  puts "> #{str}"
end

madlib
