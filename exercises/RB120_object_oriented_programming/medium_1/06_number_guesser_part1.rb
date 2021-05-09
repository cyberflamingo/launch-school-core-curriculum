class GuessingGame
  LOW_NUM = 1
  HIGH_NUM = 100

  def initialize
    @num_to_guess = (LOW_NUM..HIGH_NUM).to_a.sample
    @remaining_guess = 7
    @user_guess = nil
  end

  def play
    main_loop
    show_result
  end

  private

  attr_accessor :user_guess

  def main_loop
    loop do
      show_remaining_guess
      input_user_guess
      compare_numbers
      break if winning_number? || @remaining_guess <= 0
    end
  end

  def show_remaining_guess
    puts "\n"
    puts "You have #{@remaining_guess} guesses remaining."
  end

  def input_user_guess
    loop do
      print "Enter a number between #{LOW_NUM} and #{HIGH_NUM}: "
      self.user_guess = gets.chomp.to_i
      break if user_guess.between?(LOW_NUM, HIGH_NUM)
      print 'Invalid guess. '
    end
  end

  def compare_numbers
    if winning_number?
      puts "That's the number!"
    elsif user_guess < @num_to_guess
      puts "Your guess is too low."
    elsif user_guess > @num_to_guess
      puts "Your guess is too high."
    end

    @remaining_guess -= 1
  end

  def show_result
    if winning_number?
      puts 'You won!'
    else
      puts 'You have no more guesses. You lost!'
      puts "The number was #{@num_to_guess}."
    end
  end

  def winning_number?
    user_guess == @num_to_guess
  end
end

game = GuessingGame.new
game.play
