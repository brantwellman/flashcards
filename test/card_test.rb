require_relative '../lib/card'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class CardTest< Minitest::Test

  def setup
    @card = Card.new("Where would you rather be?", "Alaska")
  end

  def test_card_exists
    assert Card
  end

  def test_it_is_initialized_with_question
    assert_equal "Where would you rather be?", @card.question
  end

  def test_it_is_initialized_with_answer
    assert_equal "Alaska", @card.answer
  end
end
