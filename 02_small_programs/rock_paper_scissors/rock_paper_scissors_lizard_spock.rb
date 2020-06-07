require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard Spock)

def test_method
  prompt('test message')
end

# test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method

def find_associated_string(letter)
  return false if letter == '' || letter.nil?

  associated_string = VALID_CHOICES.select do |choice|
    choice[0] == letter
  end

  associated_string[0]
end

def display_results(player, computer)
  pattern = [player, computer]
  winning_patterns = [['scissors', 'paper'], ['paper', 'rock'],
                      ['rock', 'lizard'], ['lizard', 'Spock'],
                      ['Spock', 'scissors'], ['scissors', 'Lizard'],
                      ['lizard', 'paper'], ['paper', 'Spock'],
                      ['Spock', 'rock'], ['rock', 'scissors']]
  loosing_patterns = winning_patterns.map(&:reverse)

  return 'You won!' if winning_patterns.include?(pattern)
  return 'Computer won!' if loosing_patterns.include?(pattern)
  "It's a tie!"
end

loop do
  choice = ''
  loop do
    prompt("Choose one by typing its first letter ('S' majuscule for " \
           "Spock): #{VALID_CHOICES.join(', ')}")
    raw_choice = Kernel.gets().chomp()

    choice = find_associated_string(raw_choice[0])

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('Not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  puts display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Good bye!')
