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
  include Comparable
  ROYAL_FLUSH = ([10] + %w(Jack Queen King Ace)).freeze

  HAND_RANKINGS = { 'Royal flush' => 10,
                    'Straight flush' => 9,
                    'Four of a kind' => 8,
                    'Full house' => 7,
                    'Flush' => 6,
                    'Straight' => 5,
                    'Three of a kind' => 4,
                    'Two pair' => 3,
                    'Pair' => 2,
                    'High card' => 1 }

  def initialize(deck)
    initialize_hand(deck)
    @ranks = @hand.map(&:rank)
  end

  def print
    hand.each do |card|
      puts card.to_s
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def evaluate
    if royal_flush? then 'Royal flush'
    elsif straight_flush?  then 'Straight flush'
    elsif four_of_a_kind?  then 'Four of a kind'
    elsif full_house?      then 'Full house'
    elsif flush?           then 'Flush'
    elsif straight?        then 'Straight'
    elsif three_of_a_kind? then 'Three of a kind'
    elsif two_pair?        then 'Two pair'
    elsif pair?            then 'Pair'
    else 'High card'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def find_best_hand
    hand.combination(5).to_a.map do |hand_candidate|
      PokerHand.new(hand_candidate)
    end.max
  end

  private

  attr_reader :hand, :ranks

  def initialize_hand(deck)
    @hand = []
    deck.size.times do
      @hand << deck.draw
    end

    @hand.sort!
  end

  def <=>(other)
    HAND_RANKINGS[evaluate] <=> HAND_RANKINGS[other.evaluate]
  end

  def royal_flush?
    straight_flush? && ranks == ROYAL_FLUSH
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    return false if ranks.uniq != ranks
    hand.min.value.to_i == hand.max.value.to_i - 4
  end

  def flush?
    hand.all? { |card| card.suit == hand.first.suit }
  end

  def pair?
    n_of_a_kind?(2)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def n_of_a_kind?(number)
    ranks.uniq.one? { |card| ranks.count(card) == number }
  end

  def two_pair?
    ranks.uniq.select { |card| ranks.count(card) == 2 }.size == 2
  end
end

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias draw pop
end

# Test to find best 5 cards hand.
royal_flush = PokerHand.new([
                              Card.new(10, 'Hearts'),
                              Card.new('Ace',   'Hearts'),
                              Card.new('Queen', 'Hearts'),
                              Card.new('King',  'Hearts'),
                              Card.new('Jack',  'Hearts'),
                              Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                              Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                            ])
straight_flush = PokerHand.new([
                                 Card.new(8, 'Clubs'),
                                 Card.new(9,       'Clubs'),
                                 Card.new('Queen', 'Clubs'),
                                 Card.new(10,      'Clubs'),
                                 Card.new('Jack',  'Clubs'),
                                 Card.new(Deck::RANKS.sample,
                                          Deck::SUITS.sample),
                                 Card.new(Deck::RANKS.sample,
                                          Deck::SUITS.sample)
                               ])
four_of_a_kind = PokerHand.new([
                                 Card.new(3, 'Hearts'),
                                 Card.new(3, 'Clubs'),
                                 Card.new(5, 'Diamonds'),
                                 Card.new(3, 'Spades'),
                                 Card.new(3, 'Diamonds'),
                                 Card.new(Deck::RANKS.sample,
                                          Deck::SUITS.sample),
                                 Card.new(Deck::RANKS.sample,
                                          Deck::SUITS.sample)
                               ])
full_house = PokerHand.new([
                             Card.new(3, 'Hearts'),
                             Card.new(3, 'Clubs'),
                             Card.new(5, 'Diamonds'),
                             Card.new(3, 'Spades'),
                             Card.new(5, 'Hearts'),
                             Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                             Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                           ])
flush = PokerHand.new([
                        Card.new(10, 'Hearts'),
                        Card.new('Ace', 'Hearts'),
                        Card.new(2, 'Hearts'),
                        Card.new('King', 'Hearts'),
                        Card.new(3, 'Hearts'),
                        Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                        Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                      ])
straight = PokerHand.new([
                           Card.new(8, 'Clubs'),
                           Card.new(9,      'Diamonds'),
                           Card.new(10,     'Clubs'),
                           Card.new(7,      'Hearts'),
                           Card.new('Jack', 'Clubs'),
                           Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                           Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                         ])
straight_alt = PokerHand.new([
                               Card.new('Queen', 'Clubs'),
                               Card.new('King',  'Diamonds'),
                               Card.new(10,      'Clubs'),
                               Card.new('Ace',   'Hearts'),
                               Card.new('Jack',  'Clubs'),
                               Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                               Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                             ])
three_of_a_kind = PokerHand.new([
                                  Card.new(3, 'Hearts'),
                                  Card.new(3, 'Clubs'),
                                  Card.new(5, 'Diamonds'),
                                  Card.new(3, 'Spades'),
                                  Card.new(6, 'Diamonds'),
                                  Card.new(Deck::RANKS.sample,
                                           Deck::SUITS.sample),
                                  Card.new(Deck::RANKS.sample,
                                           Deck::SUITS.sample)
                                ])
two_pair = PokerHand.new([
                           Card.new(9, 'Hearts'),
                           Card.new(9, 'Clubs'),
                           Card.new(5, 'Diamonds'),
                           Card.new(8, 'Spades'),
                           Card.new(5, 'Hearts'),
                           Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                           Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                         ])
pair = PokerHand.new([
                       Card.new(2, 'Hearts'),
                       Card.new(9, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(9, 'Spades'),
                       Card.new(3, 'Diamonds'),
                       Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                       Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                     ])
high_card = PokerHand.new([
                            Card.new(2, 'Hearts'),
                            Card.new('King', 'Clubs'),
                            Card.new(5,      'Diamonds'),
                            Card.new(9,      'Spades'),
                            Card.new(3,      'Diamonds'),
                            Card.new(Deck::RANKS.sample, Deck::SUITS.sample),
                            Card.new(Deck::RANKS.sample, Deck::SUITS.sample)
                          ])

hands = [royal_flush, straight_flush, four_of_a_kind,
         full_house, flush, straight, straight_alt,
         three_of_a_kind, two_pair, pair, high_card]

# May not be perfect because of randomness in card selection
hands.each do |hand|
  puts hand.find_best_hand.evaluate
end
