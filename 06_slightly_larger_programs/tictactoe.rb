=begin rdoc

*Mental Model:*
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn
and marks a square on the board. First player to reach 3 squares in a row,
including diagonals, wins. If all 9 squares are marked and no player has 3
squares in a row, then the game is a tie.

---

== Data Structure

*Your Data Structure:*
A hash

---

== Algorithm

*Your Algorith:*
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

== Code

=end

require 'pry'

FIRST_MOVE = 'choose' # 'player', 'computer', 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(arr, separator = ', ', last_separator = 'or')
  return arr[0] if arr.size == 1

  joined_str = arr.join(separator)
  first_separator_position = joined_str.index(separator)
  last_separator_position = joined_str.rindex(separator)

  if first_separator_position != last_separator_position
    joined_str[last_separator_position + 1] = " #{last_separator} "
  else
    joined_str[last_separator_position] = " #{last_separator}"
  end

  joined_str
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def offensive_strategy(brd)
  square = nil

  WINNING_LINES.each do |line|
    tictactoe = brd.values_at(*line)

    if (tictactoe.count(COMPUTER_MARKER) == 2) &&
       (tictactoe.count(INITIAL_MARKER) == 1)

      empty_square = tictactoe.index { |n| n == INITIAL_MARKER }
      square = line.at(empty_square)
    end
  end

  square
end

def defensive_strategy(brd)
  square = nil

  WINNING_LINES.each do |line|
    tictactoe = brd.values_at(*line)

    if (tictactoe.count(PLAYER_MARKER) == 2) &&
       (tictactoe.count(INITIAL_MARKER) == 1)

      empty_square = tictactoe.index { |n| n == INITIAL_MARKER }
      square = line.at(empty_square)
    end
  end

  square
end

def computer_places_piece!(brd)
  square = offensive_strategy(brd)
  square ||= defensive_strategy(brd)
  square ||= empty_squares(brd).select { |n| n == 5 }.first
  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    tictactoe = brd.values_at(*line)

    if tictactoe.count(PLAYER_MARKER) == 3
      return 'Player'
    elsif tictactoe.count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def keep_score(score, winner_name)
  score[winner_name] += 1
end

def detect_grand_winner(score)
  if score['Player'] == 5
    'Player'
  elsif score['Computer'] == 5
    'Computer'
  end
end

def grand_winner?(score)
  !!detect_grand_winner(score)
end

def choose_first_move
  first_move = ''
  valid_choices = ['computer', 'player']

  loop do
    prompt "Choose a first player (Computer or Player):"
    first_move = gets.chomp.downcase
    break if valid_choices.include?(first_move)
    prompt "Sorry that's not a valid choice."
  end

  first_move
end

total_score = { 'Player' => 0, 'Computer' => 0 }

loop do
  first_move = nil
  board = initialize_board

  loop do
    display_board(board)

    if FIRST_MOVE == 'player'
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    elsif FIRST_MOVE == 'computer'
      computer_places_piece!(board)
      display_board(board)
      break if someone_won?(board) || board_full?(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    else
      if !first_move
        first_move = choose_first_move
      end

      if first_move == 'player'
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      elsif first_move == 'computer'
        computer_places_piece!(board)
        display_board(board)
        break if someone_won?(board) || board_full?(board)

        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
    end
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
    keep_score(total_score, detect_winner(board))
  else
    prompt "It's a tie!"
  end

  if grand_winner?(total_score)
    prompt "#{detect_grand_winner(total_score)} won this game! " \
           "Congratulations!"
    break
  else
    puts "Current score:"
    puts "You: #{total_score['Player']}, Computer: #{total_score['Computer']}"

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
