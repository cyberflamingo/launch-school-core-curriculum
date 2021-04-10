VALID_CHOICES = %w(rock paper scissors lizard Spock)
WINNING_PATTERNS = [['scissors', 'paper'], ['paper', 'rock'],
                    ['rock', 'lizard'], ['lizard', 'Spock'],
                    ['Spock', 'scissors'], ['scissors', 'lizard'],
                    ['lizard', 'paper'], ['paper', 'Spock'],
                    ['Spock', 'rock'], ['rock', 'scissors']]
LOSING_PATTERNS = WINNING_PATTERNS.map(&:reverse)

def prompt(message)
  Kernel.puts("\n" + "=> #{message}")
end

def find_associated_string(letter)
  return false if letter == '' || letter.nil?

  associated_string = VALID_CHOICES.select do |choice|
    choice[0] == letter
  end

  associated_string[0]
end

def player_move
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
  choice
end

def computer_move
  VALID_CHOICES.sample
end

def display_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}.")
end

def determine_winner(player, computer)
  pattern = [player, computer]

  winner = 'tie'
  if WINNING_PATTERNS.include?(pattern)
    winner = 'player'
  elsif LOSING_PATTERNS.include?(pattern)
    winner = 'computer'
  end
  winner
end

def update_scores(winner_name, scores_table)
  return if winner_name == 'tie'
  scores_table[winner_name.to_sym] += 1
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

def display_scores(scores)
  prompt("Current score: \n" \
         "|  Player  | Computer | \n" \
         "| ======== | ======== | \n" \
         "|       #{scores[:player]}  |       #{scores[:computer]}  |")
end

def determine_grand_winner(winner_name, scores_table)
  grand_winner = if scores_table[winner_name.to_sym] == 5
                   winner_name
                 else
                   false
                 end
  grand_winner
end

def display_grand_winner(winner_name)
  prompt("The grand winner is #{winner_name}! Congratulations!")
end

def play_again?
  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  system 'clear'
  answer
end

scores = { player: 0,
           computer: 0 }

system 'clear'

loop do
  player_choice = player_move
  computer_choice = computer_move
  display_choices(player_choice, computer_choice)
  winner = determine_winner(player_choice, computer_choice)
  update_scores(winner, scores)
  puts display_results(winner)
  display_scores(scores)

  grand_winner = determine_grand_winner(winner, scores)
  if grand_winner
    display_grand_winner(grand_winner)

    scores = { player: 0,
               computer: 0 }
    continue = play_again?

    break unless continue.downcase().start_with?('y')
  end
end

prompt('Thank you for playing. Good bye!')
