VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt('test message')
end

# test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method

def display_results(player, computer)
  pattern = [player, computer]
  winning_patterns = [['rock', 'scissors'],
                      ['paper', 'rock'],
                      ['scissors', 'paper']]
  loosing_patterns = [['rock', 'paper'],
                      ['paper', 'scissors'],
                      ['scissors', 'rock']]

  return 'NEW You won!' if winning_patterns.include?(pattern)
  return 'NEW Computer won!' if loosing_patterns.include?(pattern)
  "NEW It's a tie!"
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

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
