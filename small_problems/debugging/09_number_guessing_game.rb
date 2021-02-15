def valid_integer?(string)
  string.to_i.to_s == string
end

def get_input
  input = nil

  until valid_integer?(input)
    print 'Make a guess: '
    input = gets.chomp
  end

  input.to_i
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    guess = get_input

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)
