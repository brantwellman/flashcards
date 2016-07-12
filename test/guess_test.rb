require_relative "../lib/guess"
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class GuessTest < Minitest::Test

  def setup
    card = Card.new("Where would you rather be?", "Alaska")
    @guess = Guess.new("Alaska", card)

    card_2 = Card.new("Where would you rather be?", "Alaska")
    @guess_2 = Guess.new("Texas", card_2)
  end

  def test_guess_exists
    assert Guess
  end

  def test_it_is_initialized_with_response
    assert_equal "Alaska", @guess.response
  end

  def test_returns_true_if_response_matches_card_answer
    assert @guess.correct?
  end

  def test_it_returns_correct_as_feedback
    assert_equal "Correct!", @guess.feedback
  end

  def test_returns_false_if_response_doesnt_match_card_answer
    refute @guess_2.correct?
  end

  def test_returns_incorrect_as_feedback
    assert_equal "Incorrect.", @guess_2.feedback
  end
end
