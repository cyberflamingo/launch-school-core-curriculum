class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end

  def play
    "I'm overriding Game class' play method!"
  end
end

bingo = Bingo.new
puts bingo.play
