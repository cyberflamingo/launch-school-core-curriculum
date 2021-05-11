class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    Deck::RANKS.index(rank) + 2 + (Deck::SUITS.index(suit) * 0.1)
  end

  private

  def <=>(other)
    value <=> other.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    initialize_deck
  end

  def draw
    initialize_deck if deck.empty?
    deck.pop
  end

  private

  attr_accessor :deck

  def initialize_deck
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

class PokerHand
  ROYAL_FLUSH = ([10] + %w(Jack Queen King Ace)).freeze

  def self.royal_flush?(cards)
    initialize_hand(cards)
    straight_flush?(cards) && @ranks == ROYAL_FLUSH
  end

  def self.straight_flush?(cards)
    initialize_hand(cards)
    straight?(cards) && flush?(cards)
  end

  def self.straight?(cards)
    initialize_hand(cards)
    return false if @ranks.uniq != @ranks
    @hand.min.value.to_i == @hand.max.value.to_i - 4
  end

  def self.flush?(cards)
    initialize_hand(cards)
    @hand.all? { |card| card.suit == @hand.first.suit }
  end

  def self.pair?(cards)
    initialize_hand(cards)
    n_of_a_kind?(2)
  end

  def self.three_of_a_kind?(cards)
    initialize_hand(cards)
    n_of_a_kind?(3)
  end

  def self.four_of_a_kind?(cards)
    initialize_hand(cards)
    n_of_a_kind?(4)
  end

  def self.full_house?(cards)
    initialize_hand(cards)
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def self.two_pair?(cards)
    initialize_hand(cards)
    @ranks.uniq.select { |card| @ranks.count(card) == 2 }.size == 2
  end

  def self.high_card?(cards)
    return true unless four_of_a_kind?(cards)  ||
                       flush?(cards)           ||
                       straight?(cards)        ||
                       three_of_a_kind?(cards) ||
                       two_pair?(cards)
  end

  private_class_method def self.initialize_hand(hand)
    @hand = hand.sort
    @ranks = @hand.map(&:rank)
  end

  private_class_method def self.n_of_a_kind?(number)
    @ranks.uniq.one? { |card| @ranks.count(card) == number }
  end
end

# Test that we can identify each PokerHand type.
hand = [
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
]
puts PokerHand.royal_flush?(hand)

hand = [
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
]
puts PokerHand.straight_flush?(hand)

hand = [
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
]
puts PokerHand.four_of_a_kind?(hand)

hand = [
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
]
puts PokerHand.full_house?(hand)

hand = [
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
]
puts PokerHand.flush?(hand)

hand = [
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
]
puts PokerHand.straight?(hand)

hand = [
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
]
puts PokerHand.straight?(hand)

hand = [
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
]
puts PokerHand.three_of_a_kind?(hand)

hand = [
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
]
puts PokerHand.two_pair?(hand)

hand = [
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
]
puts PokerHand.pair?(hand)

hand = [
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
]
puts PokerHand.high_card?(hand)
