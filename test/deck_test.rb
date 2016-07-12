require_relative '../lib/deck'
require_relative '../lib/card'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("Where would you rather be?", "Alaska")
    @card_2 = Card.new("What do you do when the wolf runs by?", "Take pictures")
    @card_3 = Card.new("Who has your heart forever?", "Alfie")
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_deck_exists
    assert Deck
  end

  def test_deck_is_initialized_with_cards
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_deck_returns_number_of_cards
    assert_equal 3, @deck.count
  end
end
