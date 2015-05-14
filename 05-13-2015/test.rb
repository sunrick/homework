require 'minitest/autorun'

require './deck'

class CardTest < MiniTest::Test

  Card = IronYardGames::Card


# #functions have to start with word test
#   def cookies
#     puts "Cookies"
#   end

#   def test_foo
#     #cookies # can call helper functions
#     puts "foo"
#     assert true
#   end

#   def test_bar
#     cookies
#     refute false
#   end

  def test_can_create_a_card
    card = Card.new
    assert_instance_of Card, card
  end

  def test_can_create_a_specific_card
    card = Card.new(2, "h")
    assert_instance_of Card, card
  end

  def test_cards_have_rank_and_suit
    card = Card.new(2, "h")
    assert_equal card.suit, "h"
    assert_equal card.rank, 2
  end

  def test_cards_can_be_compared
    ace_of_spades = Card.new("A", "s")
    queen_of_hearts = Card.new("Q", "h")
    two_of_diamonds = Card.new(2, "d")

    assert ace_of_spades != queen_of_hearts
    assert ace_of_spades > queen_of_hearts
    assert two_of_diamonds < ace_of_spades
    assert queen_of_hearts == queen_of_hearts
    refute two_of_diamonds > ace_of_spades
  end


end
