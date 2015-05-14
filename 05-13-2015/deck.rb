require 'pry'

module IronYardGames
  
  class Card

  RANKS = (2..10).to_a + ["J", "Q", "K", "A"]
  SUITS = ["d", "c", "s", "h"]

  RANK_VALUES = {"J" => 11, "Q" => 12, "K" => 13, "A" => 14}

  # attr_reader :rank
  # attr_writer :rank
  attr_accessor :rank, :suit
  include Comparable

  def initialize(rank=nil, suit=nil)
    @rank = rank || RANKS.sample
    @suit = suit || SUITS.sample
  end

  protected
  def value
    val = RANK_VALUES[self.rank]
    val ||= self.rank
  end

  def <=>(other)
    self.value <=> other.value
  end

  # def rank
  #   @rank
  # end

  # def change_rank(new_rank)
  #   @rank = new_rank
  # end

  # def rank=(new_rank)
  #   @rank = new_rank
  # end

  # def suit
  #   @suit
  # end
  end

  class CardDeck
    
    include Enumerable

    attr_reader :deck

    def initialize
      @deck = self.get_deck
    end

    def get_deck
      result = []
      Card::RANKS.each do |rank|
        Card::SUITS.each do |suit|
          result << [rank,suit]
        end
      end
      result
    end

    def see_deck
      result = @deck
      result.map {|x| x.join}
    end

    def draw(n)
      result = @deck.sample(n)
      @deck = @deck - result
      result.map {|x| x.join}
    end

    def peek
      result = @deck[0].join
    end

    def shuffle
      @deck.shuffle
    end

    def each(&block)
      @deck.each do |card|
        yield card
      end
    end

  end

  class Hand

    include Comparable

    def initialize(hand)
      @hand = split_to_array(hand)
      @hand = self.create_card_object

    end

    def split_to_array(hand)
      result = hand.split(" ")
      result.map do |item|
        item.chars
      end
    end

    def create_card_object
      result = []
      self.each do |item|
        result << IronYardGames::Card.new(item[0],item[1])
      end
      result
    end

    def each(&block)
      @hand.each do |card|
        yield card
      end
    end

    def <=>(other)
      self.value <=> other.value
    end

  end

end
