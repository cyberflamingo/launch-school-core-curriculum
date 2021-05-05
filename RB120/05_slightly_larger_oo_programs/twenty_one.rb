module Hand
  attr_accessor :hand

  def show_hand
    puts "#{self.class}'s Hand:"
    hand.each do |card|
      puts "- #{card}"
    end
  end

  def hit(deck)
    hand.push(deck.deal(1)).flatten!
  end

  def busted?
    total > 21
  end

  def total
    sum = 0

    values = hand.map(&:value)

    values.each do |value|
      if value == 'A'
        sum += 11
      elsif value.to_i == 0 # J, Q, K
        sum += 10
      else
        sum += value.to_i
      end
    end

    values.select { |value| value == 'A' }.count.times do
      sum -= 10 if sum > 21
    end

    sum
  end
end

class Player
  include Hand

  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end
end

class Dealer
  include Hand

  def initialize
    # seems like very similar to Player... do we even need this?
  end

  def show_one_card
    puts "#{self.class}'s First Card:"
    puts "- #{hand[0]}"
  end
end

class Deck
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal(num)
    hand_cards = []

    num.times do
      hand_cards.push(cards.delete_at(0))
    end

    hand_cards
  end

  private

  attr_accessor :cards
end

class Card
  SUITS = ['H', 'D', 'C', 'S']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "#{face} of #{suit}"
  end

  def value
    @face
  end

  private

  def face
    case @face
    when 'J' then 'Joker'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'C' then 'Clubs'
    when 'S' then 'Spades'
    else @suit
    end
  end
end

class Game
  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @human = Player.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn unless human.busted?
    show_result
  end

  private

  attr_reader :deck, :dealer, :human

  def deal_cards
    dealer.hand = deck.deal(2)
    human.hand = deck.deal(2)
  end

  def show_initial_cards
    system 'clear'
    human.show_hand

    puts "\n"
    dealer.show_one_card
  end

  def player_turn
    loop do
      action = hit_or_stay

      break if action == 'stay'
      human.hit(deck)
      return if human.busted?
      show_initial_cards
    end
  end

  def dealer_turn
    until dealer.total >= 17 || dealer.busted?
      dealer.hit(deck)
    end
  end

  def hit_or_stay
    answer = nil

    loop do
      puts "-------------------------------"
      puts "Do you want to 'hit' or 'stay'?"
      answer = gets.chomp.downcase
      break if %w(hit stay).include?(answer)
      puts "Sorry, must choose 'hit' or 'stay'."
    end

    answer
  end

  def show_result
    system 'clear'

    if human.busted?
      puts "You busted! Dealer wins!"
    elsif dealer.busted?
      puts "Dealer busted! You win!"
    else
      compare_cards
    end

    puts "-------------------------------"
    human.show_hand
    puts "\n"
    dealer.show_hand
  end

  def compare_cards
    dealer_total = dealer.total
    human_total = human.total

    if dealer_total > human_total
      puts "Dealer wins with #{dealer_total} points! " \
           "You have #{human_total} points."
    elsif dealer_total < human_total
      puts "You win with #{human_total} points! " \
           "Dealer loose with #{dealer_total} points."
    else
      puts "It's a tie! You both have #{human_total} points!"
    end
  end
end

Game.new.start
