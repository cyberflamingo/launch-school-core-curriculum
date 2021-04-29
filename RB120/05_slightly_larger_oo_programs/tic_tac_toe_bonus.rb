require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def immediate_threat(marker)
    WINNING_LINES.each do |line|
      if at_threat(line, marker)
        risky_square = find_at_risk_square(line)
        return risky_square unless risky_square.nil?
      end
    end

    nil
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identitcal_markers?(squares)
        return squares.first.marker
      end
    end

    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def at_threat(line, risk_marker)
    @squares.values_at(*line).select do |square|
      square.marker == risk_marker
    end.size == 2
  end

  def find_at_risk_square(line)
    @squares.select do |position, square|
      line.include?(position) && square.marker == Square::INITIAL_MARKER
    end.keys.first
  end

  def three_identitcal_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  MAX_SCORE = 5

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @first_to_move = ask_first_to_move
    @current_marker = @first_to_move
  end

  def play
    clear
    display_welcome_message
    main_game
    display_final_result
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer, :first_to_move
  attr_accessor :current_marker

  def ask_first_to_move
    human_goes_first? ? HUMAN_MARKER : COMPUTER_MARKER
  end

  def human_goes_first?
    answer = 'y'

    loop do
      puts 'Would you like to play first? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def main_game
    loop do
      display_board
      player_move
      record_score
      display_result
      break if someone_won_game?
      break unless play_again?

      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def joinor(list, separator = ', ', last_separator = 'or')
    list.map do |element|
      if element == list.last
        "#{last_separator} #{element}"
      else
        "#{element}#{separator}"
      end
    end.join
  end

  # rubocop:disable Metrics/AbcSize
  def computer_moves
    defense_key = board.immediate_threat(human.marker)
    offense_key = board.immediate_threat(computer.marker)

    return board[offense_key] = computer.marker unless offense_key.nil?
    return board[defense_key] = computer.marker unless defense_key.nil?
    return board[5] = computer.marker if board.unmarked_keys.include?(5)

    board[board.unmarked_keys.sample] = computer.marker
  end
  # rubocop:enable Metrics/AbcSize

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = COMPUTER_MARKER
    else
      computer_moves
      self.current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    current_marker == HUMAN_MARKER
  end

  def record_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won! Current score: #{human.score}"
    when computer.marker
      puts "Computer won! Current score: #{computer.score}"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def someone_won_game?
    human.score == MAX_SCORE || computer.score == MAX_SCORE
  end

  def display_final_result
    puts "Your score:       #{human.score}"
    puts "Computer's score: #{computer.score}"
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    self.current_marker = first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
