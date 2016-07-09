require_relative '../lib/deck'
require_relative '../lib/card'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class DeckTest < Minitest::Test

  def test_deck_exists
    assert Deck
  end

  def test_deck_is_initialized_with_cards
    card1 = Card.new("Where would you rather be?", "Alaska")
    card2 = Card.new("What do you do when the wolf runs by?", "Take pictures")
    card3 = Card.new("Who has your heart forever?", "Alfie")
    deck = Deck.new([card1, card2, card3])

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_deck_returns_number_of_cards
    card1 = Card.new("Where would you rather be?", "Alaska")
    card2 = Card.new("What do you do when the wolf runs by?", "Take pictures")
    card3 = Card.new("Who has your heart forever?", "Alfie")
    deck = Deck.new([card1, card2, card3])

    assert_equal 3, deck.count
  end
end
