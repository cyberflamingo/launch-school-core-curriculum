class Score
  WINNER_POINTS = 3

  def initialize
    @points = 0
  end

  def add_point
    self.points += 1
  end

  def game_over?
    points == WINNER_POINTS
  end

  def reset
    self.points = 0
  end

  def to_s
    points
  end

  private

  attr_accessor :points
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'Spock']

  def initialize(value)
    @value = value
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def >(other_move)
    (scissors? && other_move.paper?) ||
      (paper? && other_move.rock?) ||
      (rock? && other_move.lizard?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.scissors?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (paper? && other_move.spock?) ||
      (spock? && other_move.rock?) ||
      (rock? && other_move.scissors?)
  end

  def <(other_move)
    (paper? && other_move.scissors?) ||
      (rock? && other_move.paper?) ||
      (lizard? && other_move.rock?) ||
      (spock? && other_move.lizard?) ||
      (scissors? && other_move.spock?) ||
      (lizard? && other_move.scissors?) ||
      (paper? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (rock? && other_move.spock?) ||
      (scissors? && other_move.rock?)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def to_s
    value
  end

  protected

  def scissors?
    value == 'scissors'
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def lizard?
    value == 'lizard'
  end

  def spock?
    value == 'Spock'
  end

  private

  attr_accessor :value
end

class Player
  attr_accessor :move, :name, :move_history

  def initialize
    set_name
    @score = Score.new
    @move_history = []
  end

  def record_victory
    score.add_point
  end

  def win?
    score.game_over?
  end

  def add_point
    score.add_point
  end

  def record_move
    move_history << move
  end

  def show_score
    score.to_s
  end

  def reset_score
    score.reset
  end

  private

  attr_reader :score
end

class Human < Player
  def choose
    choice = nil

    loop do
      puts "\n" + "Please choose rock, paper, scissors, lizard or Spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end

    self.move = Move.new(choice)
  end

  private

  def set_name
    n = ''

    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts 'Sorry, must enter a value.'
    end

    self.name = n
  end
end

class Computer < Player
  # def choose
  #   self.move = Move.new(Move::VALUES.sample)
  # end

  # private

  # def set_name
  #   self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  # end
end

class R2D2 < Computer
  def choose
    self.move = Move.new('rock')
  end

  private

  def set_name
    self.name = 'R2D2'
  end
end

class Hal < Computer
  def choose
    weighted_values = ['rock',
                       'scissors', 'scissors', 'scissors',
                       'lizard', 'lizard',
                       'Spock', 'Spock']

    self.move = Move.new(weighted_values.sample)
  end

  private

  def set_name
    self.name = 'HAL'
  end
end

# Game Orchestration Engine
class RPSGame
  def initialize
    @human = Human.new
    @computer = [R2D2, Hal].sample.new
    display_welcome_message
  end

  def play
    loop do
      execute_turn
      display_results
      display_moves_history
      break if (human.win? || computer.win?) && !play_again?
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "\n" +  "Welcome to Rock, Paper, Scissors, Lizard, Spock!" + "\n"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def execute_turn
    human.choose
    computer.choose
    record_moves
    display_moves
    record_victory
  end

  def display_moves
    puts "\n" + "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_moves_history
    puts "\n" + 'Moves History:'
    puts '--------------'
    move_history_tabe(human)
    move_history_tabe(computer)
  end

  def move_history_tabe(player)
    puts "#{player.name}:"
    player.move_history.each_with_index do |move, index|
      puts "  #{index + 1}: #{move}"
    end
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_current_score
    puts "\n" + "Current Score:"
    puts "--------------"
    puts "#{human.name}: #{human.show_score}"
    puts "#{computer.name}: #{computer.show_score}"
  end

  def record_moves
    human.record_move
    computer.record_move
  end

  def record_victory
    if human.move > computer.move
      human.add_point
    elsif human.move < computer.move
      computer.add_point
    end
  end

  def display_grand_winner
    if human.win?
      puts "#{human.name} is the grand winner!"
    elsif computer.win?
      puts "#{computer.name} is the grand winner!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return unless answer.downcase == 'y'
    reset_game
    true
  end

  def reset_game
    human.reset_score
    computer.reset_score
  end

  def display_results
    display_winner
    display_current_score
    display_grand_winner
  end

  attr_accessor :human, :computer
end

RPSGame.new.play
