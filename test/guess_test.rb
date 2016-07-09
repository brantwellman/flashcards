require_relative "../lib/guess"
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class GuessTest < Minitest::Test

  def test_guess_exists
    assert Guess
  end

  def test_it_is_initialized_with_response
    card = Card.new("Where would you rather be?", "Alaska")
    guess = Guess.new("Alaska", card)

    assert_equal "Alaska", guess.response
  end

  def test_returns_true_if_response_matches_card_answer
    card = Card.new("Where would you rather be?", "Alaska")
    guess = Guess.new("Alaska", card)

    assert guess.correct?
  end

  def test_it_returns_correct_as_feedback
    card = Card.new("Where would you rather be?", "Alaska")
    guess = Guess.new("Alaska", card)

    assert_equal "Correct!", guess.feedback
  end

  def test_returns_false_if_response_doesnt_match_card_answer
    card = Card.new("Where would you rather be?", "Alaska")
    guess = Guess.new("Texas", card)

    refute guess.correct?
  end

  def test_returns_incorrect_as_feedback
    card = Card.new("Where would you rather be?", "Alaska")
    guess = Guess.new("Texas", card)

    assert_equal "Incorrect.", guess.feedback
  end
end
