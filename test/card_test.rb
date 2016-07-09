require_relative '../lib/card'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class CardTest< Minitest::Test

  def test_card_exists
    assert Card
  end

  def test_it_is_initialized_with_question
    card = Card.new("Where would you rather be?", "Alaska")

    assert_equal "Where would you rather be?", card.question
  end

  def test_it_is_initialized_with_answer
    card = Card.new("Where would you rather be?", "Alaska")

    assert_equal "Alaska", card.answer
  end
end
