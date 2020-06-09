VALID_CHOICES = %w(rock paper scissors lizard Spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def find_associated_string(letter)
  return false if letter == '' || letter.nil?

  associated_string = VALID_CHOICES.select do |choice|
    choice[0] == letter
  end

  associated_string[0]
end

def determine_winner(player, computer, scores)
  pattern = [player, computer]
  winning_patterns = [['scissors', 'paper'], ['paper', 'rock'],
                      ['rock', 'lizard'], ['lizard', 'Spock'],
                      ['Spock', 'scissors'], ['scissors', 'Lizard'],
                      ['lizard', 'paper'], ['paper', 'Spock'],
                      ['Spock', 'rock'], ['rock', 'scissors']]
  loosing_patterns = winning_patterns.map(&:reverse)

  winner = 'none'
  if winning_patterns.include?(pattern)
    winner = 'player'
    scores[:player] += 1
  elsif loosing_patterns.include?(pattern)
    winner = 'computer'
    scores[:computer] += 1
  end

  winner
end

def display_results(winner_name)
  case winner_name
  when 'player'
    'You won!'
  when 'computer'
    'Computer won!'
  else
    "It's a tie!"
  end
end

scores = { player: 0,
           computer: 0 }

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

  winner = determine_winner(choice, computer_choice, scores)
  puts display_results(winner)

  prompt("Current score: \n" \
         "|  Player  | Computer | \n" \
         "| ======== | ======== | \n" \
         "|       #{scores[:player]}  |       #{scores[:computer]}  |")

  grand_winner = if scores[:player] == 5
                   'player'
                 elsif scores[:computer] == 5
                   'computer'
                 else
                   false
                 end

  if grand_winner
    prompt("The grand winner is #{grand_winner}! Congratulations!")

    scores = { player: 0,
               computer: 0 }
    prompt('Do you want to play again?')
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end
end

prompt('Thank you for playing. Good bye!')
